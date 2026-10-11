#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.bash.chroot : 26.10.11.1

# [ bash ]

# - variable
set -euo pipefail
v_arg="${1:-sda}"
v_disk=""

# - argument
if [[ "$v_arg" =~ ^(sd)?[a-z]$ ]]; then
    v_disk="/dev/sd${v_arg: -1}"
elif [[ "$v_arg" =~ ^(nvme)?[0-9]+(n1)?$ ]]; then
    v_nvme="${v_arg#nvme}"
    v_nvme="${v_nvme%n1}"
    v_disk="/dev/nvme${v_nvme}n1"
else
    echo "Invalid disk: $v_arg"
    exit 1
fi

# - check
echo "# . - check"
[ "$EUID" -ne 0 ] && exit 1
[ ! -b "$v_disk" ] && exit 1

# - partition
echo "# . - partition"
if [[ "$v_disk" == /dev/nvme* ]]; then
    v_boot="${v_disk}p1"
    v_efi="${v_disk}p2"
    v_root="${v_disk}p3"
else
    v_boot="${v_disk}1"
    v_efi="${v_disk}2"
    v_root="${v_disk}3"
fi

for v_part in "$v_boot" "$v_efi" "$v_root"; do
    [ -b "$v_part" ] || exit 1
done

# - mount
echo "# . - mount"
mkdir -p /mnt
mountpoint -q /mnt || mount "$v_root" /mnt

mkdir -p /mnt/boot /mnt/efi
mountpoint -q /mnt/boot || mount "$v_boot" /mnt/boot
mountpoint -q /mnt/efi || mount "$v_efi" /mnt/efi

# - chroot
echo "# . - chroot"
arch-chroot /mnt

# - end
echo "# . - end"
