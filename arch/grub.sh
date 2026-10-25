#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.bash.grub : 26.10.11.2

# [ bash ]

# - variable
set -euo pipefail
v_file="/etc/default/grub"

# - check
echo "# . - check"
[ "$EUID" -ne 0 ] && exit 1
[ ! -d /sys/firmware/efi ] && exit 1
mountpoint -q /efi || exit 1
mountpoint -q /boot || exit 1

# - install
echo "# . - install"
pacman -S --needed --noconfirm grub efibootmgr mkinitcpio

# - configure
echo "# . - configure"
sed -i 's/^GRUB_TIMEOUT=.*/GRUB_TIMEOUT=0/' "$v_file"
sed -i 's/^GRUB_TIMEOUT_STYLE=.*/GRUB_TIMEOUT_STYLE=hidden/' "$v_file"

grep -q '^GRUB_TIMEOUT=' "$v_file" || echo 'GRUB_TIMEOUT=0' >> "$v_file"
grep -q '^GRUB_TIMEOUT_STYLE=' "$v_file" || echo 'GRUB_TIMEOUT_STYLE=hidden' >> "$v_file"

# - initramfs
echo "# . - initramfs"
mkinitcpio -p linux

# - grub
echo "# . - grub"
grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

# - end
echo "# . - end"
