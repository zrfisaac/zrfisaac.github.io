#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.manjaro.geany : 25.10.31.1

# [ bash ]
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""
${sudo} pacman -S --noconfirm bluez
${sudo} pacman -S --noconfirm bluez-utils
${sudo} pacman -S --noconfirm bluez-deprecated-tools
${sudo} pacman -S --noconfirm bluez-obex
${sudo} pacman -S --noconfirm bluez-mesh 
${sudo} pacman -S --noconfirm bluetui
${sudo} pacman -S --noconfirm blueman
