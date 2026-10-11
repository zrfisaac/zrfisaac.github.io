#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.bash.login : 26.10.11.1

# [ bash ]
user=""
[ "${user}" == "" ] && user=$(getent passwd 1000 | cut -d: -f1)
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""

# : - login
[ ! -x "$(which lightdm)" ] && ${sudo} pacman -S --noconfirm lightdm
[ ! -x "$(which lightdm-gtk-greeter)" ] && ${sudo} pacman -S --noconfirm lightdm-gtk-greeter
[ ! -x "$(which lightdm-gtk-greeter-settings)" ] && ${sudo} pacman -S --noconfirm lightdm-gtk-greeter-settings
[ ! -x "$(which xdg-user-dirs-update)" ] && ${sudo} pacman -S --noconfirm xdg-user-dirs
[ ! -x "$(which file-roller)" ] && ${sudo} pacman -S --noconfirm file-roller
[ ! -x "$(which totem)" ] && ${sudo} pacman -S --noconfirm totem
[ -x "$(which lightdm)" ] && ${sudo} systemctl enable lightdm
