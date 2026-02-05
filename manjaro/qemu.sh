#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.manjaro.qemu : 26.2.5.1

# [ bash ]
user=$(getent passwd 1000 | cut -d: -f1)
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""
${sudo} pacman -S --noconfirm qemu-full
${sudo} pacman -S --noconfirm qemu-block-gluster
${sudo} pacman -S --noconfirm qemu-block-iscsi
${sudo} pacman -S --noconfirm qemu-block-iscsi
${sudo} pacman -S --noconfirm qemu-user-static
${sudo} pacman -S --noconfirm samba
${sudo} pacman -S --noconfirm qemu-emulators-full
${sudo} pacman -S --noconfirm qemu-guest-agent
${sudo} pacman -S --noconfirm qemu-emulators-full
${sudo} pacman -S --noconfirm qemu-desktop
${sudo} pacman -S --noconfirm qemu-user-static
