#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.manjaro.lazarus : 1.0.0

# [ bash ]
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""
${sudo} pacman -S --noconfirm lib32-alsa-lib
${sudo} pacman -S --noconfirm lib32-alsa-plugins
${sudo} pacman -S --noconfirm lib32-libpulse
${sudo} pacman -S --noconfirm lib32-pipewire
${sudo} pacman -S --noconfirm pipewire-pulse
${sudo} pacman -S --noconfirm lib32-libpulse
${sudo} pacman -S --noconfirm pipewire-alsa
${sudo} pacman -S --noconfirm lib32-alsa-lib
${sudo} pacman -S --noconfirm lib32-alsa-lib
${sudo} pacman -S --noconfirm lib32-alsa-plugins
${sudo} pacman -S --noconfirm lib32-gnutls
${sudo} pacman -S --noconfirm lib32-sdl2
${sudo} pacman -S --noconfirm lib32-gst-plugins-base
${sudo} pacman -S --noconfirm lib32-gst-plugins-good
${sudo} pacman -S --noconfirm samba
${sudo} pacman -S --noconfirm wine
${sudo} pacman -S --noconfirm winetricks
