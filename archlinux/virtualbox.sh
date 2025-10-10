#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.archlinux.virtualbox : 25.10.10.1

# [ bash ]
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""
user=$(getent passwd 1000 | cut -d: -f1)
${sudo} pacman -Rs --noconfirm virtualbox-host-modules-lts
${sudo} pacman -S --noconfirm udev
${sudo} pacman -S --noconfirm virtualbox
${sudo} pacman -S --noconfirm virtualbox-host-modules-arch
${sudo} pacman -S --noconfirm virtualbox-guest-iso
yay -S --noconfirm virtualbox-ext-oracle
${sudo} modprobe vboxdrv
${sudo} modprobe vboxnetadp
${sudo} modprobe vboxnetflt
${sudo} usermod -a -G vboxusers ${user}
