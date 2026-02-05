#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.manjaro.virtualbox : 26.2.5.1

# [ bash ]
user=$(getent passwd 1000 | cut -d: -f1)
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""
${sudo} pacman -S --noconfirm linux618-virtualbox-host-modules
${sudo} pacman -S --noconfirm virtualbox
${sudo} pacman -S --noconfirm virtualbox-guest-iso
${sudo} pacman -S --noconfirm virtualbox-guest-utils
${sudo} usermod -a -G vboxusers ${user}
${sudo} usermod -a -G vboxsf ${user}
