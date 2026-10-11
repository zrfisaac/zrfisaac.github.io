#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.bash.net : 26.10.11.1

# [ bash ]
user=""
[ "${user}" == "" ] && user=$(getent passwd 1000 | cut -d: -f1)
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""

# : - net
[ ! -x "$(which iwctl)" ] && ${sudo} pacman -S --noconfirm iwd
[ ! -x "$(which NetworkManager)" ] && ${sudo} pacman -S --noconfirm networkmanager
[ ! -x "$(which nm-applet)" ] && ${sudo} pacman -S --noconfirm network-manager-applet
[ ! -x "$(which ufw)" ] && ${sudo} pacman -S --noconfirm ufw
[ ! -x "$(which gufw)" ] && ${sudo} pacman -S --noconfirm gufw
[ ! -x "$(which less)" ] && ${sudo} pacman -S --noconfirm less
[ ! -x "$(which git)" ] && ${sudo} pacman -S --noconfirm git
[ ! -x "$(which gh)" ] && ${sudo} pacman -S --noconfirm github-cli
[ ! -f "/etc/conf.d/samba" ] && ${sudo} pacman -S --noconfirm samba
[ ! -f "/usr/lib/libwbclient.so" ] && ${sudo} pacman -S --noconfirm libwbclient
[ -x "$(which NetworkManager)" ] && ${sudo} systemctl enable NetworkManager
[ -x "$(which ufw)" ] && ${sudo} systemctl enable ufw
