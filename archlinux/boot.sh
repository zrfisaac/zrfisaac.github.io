#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.archlinux.boot : 25.10.10.1

# [ bash ]
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""
${sudo} pacman -S --noconfirm base-devel
${sudo} pacman -S --noconfirm grub
${sudo} pacman -S --noconfirm mtools
${sudo} pacman -S --noconfirm freetype2
${sudo} pacman -S --noconfirm dosfstools
${sudo} pacman -S --noconfirm efibootmgr
