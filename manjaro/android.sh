#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.manjaro.android : 25.10.31.1

# [ bash ]
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""
yay -S --noconfirm android-studio
yay -S --noconfirm android-sdk-cmdline-tools-latest
yay -S --noconfirm android-sdk-build-tools
yay -S --noconfirm android-sdk-platform-tools
yay -S --noconfirm android-platform
${sudo} pacman -S --noconfirm android-tools
${sudo} pacman -S --noconfirm repo
