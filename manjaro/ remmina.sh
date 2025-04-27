#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.manjaro.remmina : 1.0.0

# [ bash ]
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""
${sudo} pacman -S --noconfirm remmina
${sudo} pacman -S --noconfirm libvncserver
${sudo} pacman -S --noconfirm gtk-vnc
${sudo} pacman -S --noconfirm freerdp
${sudo} pacman -S --noconfirm freerdp
${sudo} pacman -S --noconfirm openssh
${sudo} pacman -S --noconfirm tigervnc
