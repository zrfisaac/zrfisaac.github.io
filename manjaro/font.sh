#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.manjaro.font : 1.0.0

# [ bash ]
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""
[ -f "/var/lib/pacman/db.lck" ] && ${sudo} rm -rvf /var/lib/pacman/db.lck
${sudo} pacman -S --noconfirm noto-fonts
${sudo} pacman -S --noconfirm noto-fonts-cjk
${sudo} pacman -S --noconfirm noto-fonts-emoji
