#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.web.manjaro.ms.font : 1.0.0

# [ bash ]
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""
${sudo} pacman -S --noconfirm geany
${sudo} pacman -S --noconfirm ttf-ms-fonts
${sudo} pacman -S --noconfirm fontconfig
${sudo} fc-cache -f -v
