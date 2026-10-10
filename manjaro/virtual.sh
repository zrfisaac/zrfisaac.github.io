#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.manjaro.geany : 1.0.0

# [ bash ]
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""
[ ! -x "$(which dosbox)" ] && ${sudo} pacman -S --noconfirm dosbox
[ ! -x "$(which qemu-img)" ] && ${sudo} pacman -S --noconfirm qemu-full
[ ! -f "/usr/lib/modules-load.d/virtualbox-host-modules-arch.conf" ] && ${sudo} pacman -S --noconfirm virtualbox-host-modules-arch
[ ! -x "$(which virtualbox)" ] && ${sudo} pacman -S --noconfirm virtualbox
[ ! -x "$(which docker)" ] && ${sudo} pacman -S --noconfirm docker
[ ! -f "/usr/lib/docker/cli-plugins/docker-buildx" ] && ${sudo} pacman -S --noconfirm docker-buildx
[ ! -x "$(which docker-compose)" ] && ${sudo} pacman -S --noconfirm docker-compose
[ ! -x "$(which wine)" ] && ${sudo} pacman -S --noconfirm wine
[ ! -x "$(which winetricks)" ] && ${sudo} pacman -S --noconfirm winetricks
[ ! -d "/usr/share/wine/gecko" ] && ${sudo} pacman -S --noconfirm wine-gecko
[ ! -d "/usr/share/wine/mono" ] && ${sudo} pacman -S --noconfirm wine-mono
[ ! -f "/usr/lib/libgnutls.so" ] && ${sudo} pacman -S --noconfirm gnutls
[ ! -f "/usr/lib32/libgnutls.so" ] && ${sudo} pacman -S --noconfirm lib32-gnutls
[ -x "$(which docker)" ] && ${sudo} systemctl enable docker
