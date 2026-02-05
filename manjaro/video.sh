#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.manjaro.video : 26.2.5.1

# [ bash ]
user=$(getent passwd 1000 | cut -d: -f1)
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""
${sudo} pacman -S --noconfirm vulkan-intel
${sudo} pacman -S --noconfirm vulkan-radeon
${sudo} pacman -S --noconfirm libvpl
${sudo} pacman -S --noconfirm vpl-gpu-rt
${sudo} pacman -S --noconfirm intel-media-sdk
${sudo} pacman -S --noconfirm mesa
${sudo} pacman -S --noconfirm nvidia-utils
${sudo} pacman -S --noconfirm libvdpau-va-gl
${sudo} pacman -S --noconfirm libva-nvidia-driver
${sudo} pacman -S --noconfirm libva-utils
${sudo} pacman -S --noconfirm vdpauinfo
${sudo} pacman -S --noconfirm libva-intel-driver
${sudo} pacman -S --noconfirm intel-media-driver
