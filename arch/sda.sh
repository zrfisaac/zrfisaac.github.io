
#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.bash.sda : 26.10.12.1

# [ bash ]

# - variable
set -euo pipefail
v_sda="a"
v_min=16384
v_clean=0
v_start=0
v_end=0
v_size=0

# - argument
if [[ "${1:-}" =~ ^[a-z]$ ]]; then
    v_sda="$1"
fi

v_disk="/dev/sd${v_sda}"

# - check
echo "# . - check"
[ "$EUID" -ne 0 ] && exit 1
[ ! -b "$v_disk" ] && exit 1

for v_cmd in lsblk parted sgdisk wipefs partprobe udevadm \
             mkfs.ext4 mkfs.fat mkswap swapon pacstrap \
             genfstab arch-chroot; do
    command -v "$v_cmd" >/dev/null || {
        echo "Missing command: $v_cmd"
        exit 1
    }
done

lsblk "$v_disk"

# - mounted
if lsblk -nrpo MOUNTPOINTS "$v_disk" | grep -q '[^[:space:]]'; then
    echo "Disk or partition is mounted."
    exit 1
fi

# - free
echo "# . - free"

v_table=$(lsblk -dnro PTTYPE "$v_disk" | xargs)

if [[ "$v_table" == "gpt" ]]; then
    while IFS=: read -r v_number v_first v_last v_length v_type v_rest; do
        [[ "$v_type" == "free;" ]] || continue

        v_first=${v_first%s}
        v_last=${v_last%s}

        [[ "$v_first" =~ ^[0-9]+$ ]] || continue
        [[ "$v_last" =~ ^[0-9]+$ ]] || continue

        # - align
        v_first=$(( (v_first + 2047) / 2048 * 2048 ))
        v_last=$(( (v_last + 1) / 2048 * 2048 - 1 ))
        v_available=$(( (v_last - v_first + 1) / 2048 ))

        if (( v_available >= v_min && v_available > v_size )); then
            v_start="$v_first"
            v_end="$v_last"
            v_size="$v_available"
        fi
    done < <(parted -m -s "$v_disk" unit s print free)
fi

# - confirm
echo "# . - confirm"

if (( v_size >= v_min )); then
    echo "Available unallocated space: $((v_size / 1024)) GiB"
    read -r -p "Use only available free space? [Y]/N: " v_confirm
    [[ "${v_confirm^^}" == "N" ]] && exit 0
    [[ -n "$v_confirm" && "${v_confirm^^}" != "Y" ]] && exit 0
else
    echo "No suitable unallocated space found."
    read -r -p "Delete all data on $v_disk? Y/[N]: " v_confirm
    [[ "${v_confirm^^}" != "Y" ]] && exit 0
    v_clean=1
fi

# - delete
if (( v_clean == 1 )); then
    echo "# . - delete"

    v_bytes=$(lsblk -bdnro SIZE "$v_disk")

    if (( v_bytes < v_min * 1024 * 1024 )); then
        echo "Disk is too small."
        exit 1
    fi

    wipefs -af "$v_disk"
    sgdisk --zap-all "$v_disk"
    sgdisk -o "$v_disk"
fi

# - partition
echo "# . - partition"

# - numbers
v_p1=$(sgdisk -f "$v_disk")
[[ "$v_p1" =~ ^[0-9]+$ ]] || exit 1

if (( v_clean == 1 )); then
    sgdisk -n "${v_p1}:0:+1G" \
           -t "${v_p1}:8300" \
           -c "${v_p1}:BOOT" "$v_disk"
else
    sgdisk -n "${v_p1}:${v_start}:+1G" \
           -t "${v_p1}:8300" \
           -c "${v_p1}:BOOT" "$v_disk"
fi

v_p2=$(sgdisk -f "$v_disk")
[[ "$v_p2" =~ ^[0-9]+$ ]] || exit 1

sgdisk -n "${v_p2}:0:+1G" \
       -t "${v_p2}:EF00" \
       -c "${v_p2}:EFI" "$v_disk"

v_p3=$(sgdisk -f "$v_disk")
[[ "$v_p3" =~ ^[0-9]+$ ]] || exit 1

if (( v_clean == 1 )); then
    sgdisk -n "${v_p3}:0:0" \
           -t "${v_p3}:8300" \
           -c "${v_p3}:LINUX" "$v_disk"
else
    v_linux_start=$((v_start + 4194304))

    sgdisk -n "${v_p3}:${v_linux_start}:${v_end}" \
           -t "${v_p3}:8300" \
           -c "${v_p3}:LINUX" "$v_disk"
fi

partprobe "$v_disk"
udevadm settle

# - paths
v_boot="${v_disk}${v_p1}"
v_efi="${v_disk}${v_p2}"
v_linux="${v_disk}${v_p3}"

# - verify
for v_part in "$v_boot" "$v_efi" "$v_linux"; do
    [ -b "$v_part" ] || {
        echo "Partition not found: $v_part"
        exit 1
    }
done

# - format
echo "# . - format"
mkfs.ext4 -F -L BOOT "$v_boot"
mkfs.fat -F 32 -n EFI "$v_efi"
mkfs.ext4 -F -L LINUX "$v_linux"

# - mount
echo "# . - mount"
mount "$v_linux" /mnt
mkdir -p /mnt/boot /mnt/efi
mount "$v_boot" /mnt/boot
mount "$v_efi" /mnt/efi

# - swap
echo "# . - swap"
dd if=/dev/zero of=/mnt/swap bs=1M count=8192 status=progress
chmod 600 /mnt/swap
mkswap /mnt/swap
swapon /mnt/swap

# - pacstrap
echo "# . - pacstrap"
pacstrap -K /mnt base linux linux-firmware nano wget git base-devel grub efibootmgr
genfstab -U /mnt > /mnt/etc/fstab

# - end
echo "# . - end"
lsblk -f "$v_disk"

# - chroot
arch-chroot /mnt
