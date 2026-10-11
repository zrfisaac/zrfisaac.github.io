#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.bash.sda : 26.10.11.3

# [ bash ]

# - variable
set -euo pipefail
v_sda="a"

# - argument
if [[ "${1:-}" =~ ^[a-z]$ ]]; then
    v_sda="$1"
fi

v_disk="/dev/sd${v_sda}"

# - check
echo "# . - check"
[ "$EUID" -ne 0 ] && exit 1
[ ! -b "$v_disk" ] && exit 1

# - confirm
echo "# . - confirm"
lsblk "$v_disk"
read -r -p "Delete all data on $v_disk? Y/[N]: " v_confirm
[[ "${v_confirm^^}" != "Y" ]] && exit 0

# - check
if lsblk -nrpo MOUNTPOINT "$v_disk" | grep -q '[^[:space:]]'; then
    echo "Disk is mounted."
    exit 1
fi

# - delete
echo "# . - delete"
wipefs -af "$v_disk"
sgdisk --zap-all "$v_disk"

# - partition
echo "# . - partition"
sgdisk -o "$v_disk"
sgdisk -n 1:0:+1G -t 1:8300 -c 1:"BOOT" "$v_disk"
sgdisk -n 2:0:+1G -t 2:EF00 -c 2:"EFI" "$v_disk"
sgdisk -n 3:0:0   -t 3:8300 -c 3:"LINUX" "$v_disk"
partprobe "$v_disk"
udevadm settle

# - format
echo "# . - format"
mkfs.ext4 -F -L BOOT "${v_disk}1"
mkfs.fat -F 32 -n EFI "${v_disk}2"
mkfs.ext4 -F -L LINUX "${v_disk}3"

# - mount
echo "# . - mount"
mount "${v_disk}3" /mnt
mkdir -p /mnt/boot /mnt/efi
mount "${v_disk}1" /mnt/boot
mount "${v_disk}2" /mnt/efi

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
