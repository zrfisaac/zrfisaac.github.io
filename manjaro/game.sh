#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.manjaro.game : 1.0.0

# [ bash ]
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""
[ ! $(which steam) ] && ${sudo} pacman -S --noconfirm steam
[ ! $(which heroic) ] && ${sudo} pacman -S --noconfirm heroic-games-launcher
