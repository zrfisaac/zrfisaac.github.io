#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.manjaro.game : 26.2.22.1

# [ bash ]
user=$(getent passwd 1000 | cut -d: -f1)
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""
${sudo} pacman -S --noconfirm gnome-extra
${sudo} pacman -S --noconfirm kde-games
${sudo} pacman -S --noconfirm bsd-games
${sudo} pacman -S --noconfirm kde-education
${sudo} pacman -S --noconfirm openttd
${sudo} pacman -S --noconfirm simutrans
${sudo} pacman -S --noconfirm openrct2
${sudo} pacman -S --noconfirm konquest
yay -S --noconfirm robocode
yay -S --noconfirm stockfish
