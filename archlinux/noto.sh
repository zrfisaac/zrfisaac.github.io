#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.archlinux.noto : 1.0.0

# [ bash ]
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""
${sudo} pacman -S --noconfirm geany
${sudo} pacman -S --noconfirm noto-fonts
${sudo} pacman -S --noconfirm noto-fonts-cjk
${sudo} pacman -S --noconfirm noto-fonts-emoji
${sudo} pacman -S --noconfirm noto-fonts-extra
