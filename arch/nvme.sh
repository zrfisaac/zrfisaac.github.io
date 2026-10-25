
#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.bash.nvme : 26.10.12.1

# [ bash ]

# - variable
set -euo pipefail
v_nvme=0
v_min=16384
v_clean=0

# - argument
if [[ "${1:-}" =~ ^[0-9]+$ ]]; then
    v_nvme="$1"
fi

v_disk="/dev/nvme${v_nvme}n1"

# - check
echo "# . - check"
[ "$EUID" -ne 0 ] && exit 1
[ ! -b "$v_disk" ] && exit 1

for v_cmd in lsblk parted sgdisk wipefs partprobe udevadm mkfs.ext4 mkfs.fat pacstrap genfstab arch-chroot; do
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
v_start=""
v_end=""
v_size=0

if [[ "$v_table" == "gpt" ]]; then
    while IFS=: read -r v_a v_b v_c v_d v_rest; do
        [[ "$v_rest" == "free;" ]] || continue

        v_a=${v_a%s}
        v_b=${v_b%s}
        v_c=${v_c%s}

        [[ "$v_a" =~ ^[0-9]+$ ]] || continue
        [[ "$v_b" =~ ^[0-9]+$ ]] || continue

        # - align
        v_aligned=$(( (v_a + 2047) / 2048 * 2048 ))
        v_available=$(( (v_b - v_aligned) / 2048 ))

        if (( v_available >= v_min && v_available > v_size )); then
            v_start="$v_aligned"
            v_end="$v_b"
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
else
    echo "No suitable unallocated space found."
    read -r -p "Delete all data on $v_disk? Y/[N]: " v_confirm
    [[ "${v_confirm^^}" != "Y" ]] && exit 0
    v_clean=1
fi

# - delete
if (( v_clean == 1 )); then
    echo "# . - delete"
    wipefs -af "$v_disk"
    sgdisk --zap-all "$v_disk"
    sgdisk -o "$v_disk"
    v_start=2048
    v_end=0
fi

# - partition
echo "# . - partition"

if (( v_clean == 1 )); then
    sgdisk -n 0:0:+1G -t 0:8300 -c 0:"BOOT" "$v_disk"
    sgdisk -n 0:0:+1G -t 0:EF00 -c 0:"EFI" "$v_disk"
    sgdisk -n 0:0:0   -t 0:8300 -c 0:"LINUX" "$v_disk"
else
    # - reserve
    v_boot_start="$v_start"
    v_efi_start=$((v_boot_start + 2097152))
    v_linux_start=$((v_efi_start + 2097152))

    if (( v_linux_start + 2048 >= v_end )); then
        echo "Not enough space for partitions."
        exit 1
    fi

    # - create
    sgdisk -n 0:"$v_boot_start":+1G \
           -t 0:8300 -c 0:"BOOT" "$v_disk"

    sgdisk -n 0:"$v_efi_start":+1G \
           -t 0:EF00 -c 0:"EFI" "$v_disk"

    sgdisk -n 0:"$v_linux_start":"$v_end" \
           -t 0:8300 -c 0:"LINUX" "$v_disk"
fi

partprobe "$v_disk"
udevadm settle

# - detect
v_boot=""
v_efi=""
v_linux=""

while IFS='|' read -r v_path v_label; do
    case "$v_label" in
        BOOT)  v_boot="$v_path" ;;
        EFI)   v_efi="$v_path" ;;
        LINUX) v_linux="$v_path" ;;
    esac
done < <(lsblk -nrpo NAME,PARTLABEL -P "$v_disk" | \
    sed -n 's/^NAME="\([^"]*\)" PARTLABEL="\([^"]*\)".*/\1|\2/p')

[[ -n "$v_boot" && -n "$v_efi" && -n "$v_linux" ]] || {
    echo "Partition detection failed."
    exit 1
}

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
