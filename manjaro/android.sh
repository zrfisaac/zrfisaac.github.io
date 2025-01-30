#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.manjaro.android : 1.0.1

# [ bash ]
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""
${sudo} pacman -S --noconfirm base-devel
${sudo} pacman -S --noconfirm jdk17-openjdk
yay -S --noconfirm android-studio
yay -S --noconfirm android-sdk-cmdline-tools-latest
yay -S --noconfirm android-sdk-build-tools
yay -S --noconfirm android-sdk-platform-tools
yay -S --noconfirm android-platform
${sudo} pacman -S --noconfirm android-tools
yay -S --noconfirm android-emulator
${sudo} chown -R $USER:$USER /opt/android-studio
${sudo} chmod -R 755 /opt/android-studio
${sudo} chown -R $USER:$USER /opt/android-sdk
${sudo} chmod -R 755 /opt/android-sdk
