#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.archlinux.wine : 25.10.10.1

# [ bash ]
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""
${sudo} pacman -S --noconfirm wine
${sudo} pacman -S --noconfirm wine-mono
${sudo} pacman -S --noconfirm wine-gecko
${sudo} pacman -S --noconfirm winetricks
