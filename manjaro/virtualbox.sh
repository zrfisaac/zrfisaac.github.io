#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.manjaro.virtualbox : 25.10.31.1

# [ bash ]
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""
user=$(getent passwd 1000 | cut -d: -f1)
${sudo} pacman -S --noconfirm linux612-virtualbox-host-modules
${sudo} pacman -S --noconfirm virtualbox
${sudo} pacman -S --noconfirm virtualbox-guest-iso
${sudo} pacman -S --noconfirm virtualbox-guest-utils
${sudo} usermod -a -G vboxusers ${user}
${sudo} usermod -a -G vboxsf ${user}
