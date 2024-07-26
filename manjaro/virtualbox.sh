#!/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.web.manjaro.virtualbox : 0.0.1

# [ bash ]
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""
$sudo pacman -S --noconfirm virtualbox linux69-virtualbox-host-modules
$sudo pacman -S --noconfirm virtualbox-guest-iso
$sudo pacman -S --noconfirm virtualbox
$sudo usermod -a -G vboxusers $USER
$sudo vboxreload
$sudo modprobe vboxdrv
$sudo modprobe vboxnetflt
$sudo modprobe vboxnetadp
$sudo modprobe vboxpci
