#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.archlinux.github : 25.10.10.1

# [ bash ]
# : gh auth login
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""
${sudo} pacman -S --noconfirm git
${sudo} pacman -S --noconfirm github-cli
yay -S --noconfirm github-desktop-bin
