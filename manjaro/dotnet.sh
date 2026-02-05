#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.manjaro.dotnet : 26.2.5.1

# [ bash ]
user=$(getent passwd 1000 | cut -d: -f1)
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""
${sudo} pacman -S --noconfirm dotnet-runtime
${sudo} pacman -S --noconfirm dotnet-sdk
${sudo} pacman -S --noconfirm aspnet-runtime
${sudo} pacman -S --noconfirm dotnet-runtime-8.0
${sudo} pacman -S --noconfirm dotnet-sdk-8.0
${sudo} pacman -S --noconfirm aspnet-runtime-8.0
yay -S --noconfirm powershell-bin
