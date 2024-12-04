#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.manjaro.android : 1.0.0

# [ bash ]
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""
${sudo} pacman -S --noconfirm base-devel
${sudo} pacman -S --noconfirm jdk17-openjdk
${sudo} pamac install --no-confirm android-studio
${sudo} pamac install --no-confirm android-sdk-cmdline-tools-latest
${sudo} pamac install --no-confirm android-sdk-build-tools
${sudo} pamac install --no-confirm android-sdk-platform-tools
${sudo} pamac install --no-confirm android-platform
${sudo} pacman -S --noconfirm android-tools
${sudo} pamac install --no-confirm android-emulator
${sudo} chown -R $USER:$USER /opt/android-studio
${sudo} chmod -R 755 /opt/android-studio
${sudo} chown -R $USER:$USER /opt/android-sdk
${sudo} chmod -R 755 /opt/android-sdk
