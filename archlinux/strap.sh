#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.archlinux.start : 1.0.0

# [ bash ]
user=""
[ "${user}" == "" ] && user=$(getent passwd 1000 | cut -d: -f1)
[ "${user}" == "" ] && user=$(getent passwd 15443 | cut -d: -f1)
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""
input=""
[ "${input}" == "" ] && input="${1}"
[ "${input}" == "" ] && read input
if [ "${input}" != "" ]
then
	${sudo} pacstrap -K ${input} base linux linux-firmware git wget nano grub dosfstools efibootmgr xorg-server xfce4 xfce4-goodies file-roller networkmanager network-manager-applet lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings iwd
fi
