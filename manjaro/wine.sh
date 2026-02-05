#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.manjaro.wine : 26.2.5.1

# [ bash ]
user=$(getent passwd 1000 | cut -d: -f1)
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""
${sudo} pacman -S --noconfirm lib32-gnutls
${sudo} pacman -S --noconfirm lib32-alsa-lib
${sudo} pacman -S --noconfirm lib32-alsa-plugins
${sudo} pacman -S --noconfirm lib32-libpulse
${sudo} pacman -S --noconfirm lib32-pipewire 
${sudo} pacman -S --noconfirm pipewire-pulse
${sudo} pacman -S --noconfirm lib32-libpulse
${sudo} pacman -S --noconfirm pipewire-alsa
${sudo} pacman -S --noconfirm lib32-alsa-lib
${sudo} pacman -S --noconfirm lib32-alsa-oss
${sudo} pacman -S --noconfirm lib32-alsa-plugins
${sudo} pacman -S --noconfirm wine
${sudo} pacman -S --noconfirm wine-gecko
${sudo} pacman -S --noconfirm wine-mono
