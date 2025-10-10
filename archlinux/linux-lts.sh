#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.archlinux.linux.lts : 25.10.10.1

# [ bash ]
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""
user=$(getent passwd 1000 | cut -d: -f1)
${sudo} pacman -S --noconfirm linux-lts
${sudo} pacman -S --noconfirm linux-lts-headers
${sudo} pacman -S --noconfirm mkinitcpio -p linux-lts
${sudo} grub-mkconfig -o /boot/grub/grub.cfg
