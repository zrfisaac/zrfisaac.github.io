#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.manjaro.steam : 25.10.31.1

# [ bash ]
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""
${sudo} pacman -S --noconfirm steam
