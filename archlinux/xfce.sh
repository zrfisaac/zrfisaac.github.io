#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.archlinux.xfce : 25.10.10.1

# [ bash ]
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""
${sudo} pacman -S --noconfirm lightdm
${sudo} pacman -S --noconfirm ligtdm-gtk-greeter
${sudo} pacman -S --noconfirm lightdm-gtk-greeter-settings
${sudo} pacman -S --noconfirm xorg-server
${sudo} pacman -S --noconfirm xfce4
${sudo} pacman -S --noconfirm xfce4-goodies
${sudo} pacman -S --noconfirm ufw
${sudo} pacman -S --noconfirm gufw
${sudo} pacman -S --noconfirm networkmanager
${sudo} pacman -S --noconfirm network-manager-applet
${sudo} pacman -S --noconfirm iwd
${sudo} pacman -S --noconfirm dhcpcd
${sudo} pacman -S --noconfirm thunar-archive-plugin
${sudo} pacman -S --noconfirm gvfs
${sudo} pacman -S --noconfirm file-roller
${sudo} pacman -S --noconfirm thunar-media-tags-plugin
${sudo} pacman -S --noconfirm thunar-volman
${sudo} pacman -S --noconfirm tumbler
${sudo} pacman -S --noconfirm ffmpegthumbnailer
${sudo} pacman -S --noconfirm webp-pixbuf-loader
