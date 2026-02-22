#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.manjaro.emulator : 26.2.22.1

# [ bash ]
user=$(getent passwd 1000 | cut -d: -f1)
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""
yay -S --noconfirm heroic-games-launcher
${sudo} pacman -S --noconfirm steam
${sudo} pacman -S --noconfirm game-devices-udev
${sudo} pacman -S --noconfirm ppsspp
yay -S --noconfirm pcsx2
yay -S --noconfirm rpcs3-bin
yay -S --noconfirm vita3k-bin
