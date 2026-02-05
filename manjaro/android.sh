#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.manjaro.android : 26.2.5.1

# [ bash ]
user=$(getent passwd 1000 | cut -d: -f1)
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""
yay -S --noconfirm android-studio
yay -S --noconfirm android-sdk-cmdline-tools-latest
yay -S --noconfirm android-sdk-build-tools
yay -S --noconfirm android-sdk-platform-tools
yay -S --noconfirm android-platform
${sudo} pacman -S --noconfirm android-tools
${sudo} pacman -S --noconfirm adb
${sudo} pacman -S --noconfirm jdk8-openjdk
${sudo} pacman -S --noconfirm jdk17-openjdk
${sudo} pacman -S --noconfirm android-udev
${sudo} pacman -S --noconfirm lib32-gcc-libs
