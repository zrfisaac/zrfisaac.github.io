#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.manjaro.geany : 25.10.31.1

# [ bash ]
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""
${sudo} pacman -S --noconfirm jack2
${sudo} pacman -S --noconfirm linux-firmware-cirrus
${sudo} pacman -S --noconfirm linux-firmware-intel
${sudo} pacman -S --noconfirm alsa-firmware
${sudo} pacman -S --noconfirm alsa-lib
${sudo} pacman -S --noconfirm ncurses
${sudo} pacman -S --noconfirm alsa-utils
${sudo} pacman -S --noconfirm alsa-oss
${sudo} pacman -S --noconfirm alsa-tools
${sudo} pacman -S --noconfirm pulseaudio
${sudo} pacman -S --noconfirm pulseaudio-alsa
${sudo} pacman -S --noconfirm pulseaudio-bluetooth
${sudo} pacman -S --noconfirm pulseaudio-equalizer
${sudo} pacman -S --noconfirm pulseaudio-jack
${sudo} pacman -S --noconfirm pulseaudio-lirc
${sudo} pacman -S --noconfirm pulseaudio-zeroconf
${sudo} pacman -S --noconfirm pamixer
${sudo} pacman -S --noconfirm pulsemixer
${sudo} pacman -S --noconfirm paprefs
${sudo} pacman -S --noconfirm pavucontrol
${sudo} pacman -S --noconfirm sof-firmware
