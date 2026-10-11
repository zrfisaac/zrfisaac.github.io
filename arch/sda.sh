#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.bash.sda : 26.10.11.1

# [ bash ]

# - variable
set -euo pipefail
DISK="/dev/sda"

# - check
echo "# . - check"
[ "$EUID" -ne 0 ] && exit 1
[ ! -b "$DISK" ] && exit 1

# - confirm
echo "# . - confirm"
lsblk "$DISK"
read -r -p "Delete all data on $DISK? [Y]/N: " CONFIRM
[[ "${CONFIRM^^}" == "N" ]] && exit 0
[[ -n "$CONFIRM" && "${CONFIRM^^}" != "Y" ]] && exit 1

# - check
if lsblk -nrpo MOUNTPOINT "$DISK" | grep -q '[^[:space:]]'; then
    echo "Disk is mounted."
    exit 1
fi

# - delete
echo "# . - delete"
wipefs -af "$DISK"
sgdisk --zap-all "$DISK"

# - partition
echo "# . - partition"
sgdisk -o "$DISK"
sgdisk -n 1:0:+1G -t 1:8300 -c 1:"BOOT" "$DISK"
sgdisk -n 2:0:+1G -t 2:EF00 -c 2:"EFI" "$DISK"
sgdisk -n 3:0:0   -t 3:8300 -c 3:"LINUX" "$DISK"
partprobe "$DISK"
udevadm settle

# - format
echo "# . - format"
mkfs.ext4 -F -L BOOT "${DISK}1"
mkfs.fat -F 32 -n EFI "${DISK}2"
mkfs.ext4 -F -L LINUX "${DISK}3"

# - mount
echo "# . - mount"
mount "${DISK}3" /mnt
mkdir -p /mnt/boot /mnt/efi
mount "${DISK}1" /mnt/boot
mount "${DISK}2" /mnt/efi

# - show
echo "# . - show"
lsblk -f "$DISK"

# - end
echo "# . - end"
