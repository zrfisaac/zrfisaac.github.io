#!/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.web.manjaro.geany : 0.0.1

# [ bash ]
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""
$sudo pacman -S --noconfirm geany
$sudo pamac install --no-confirm geany-themes
