#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.bash.xfce : 26.10.11.1

# [ bash ]
user=""
[ "${user}" == "" ] && user=$(getent passwd 1000 | cut -d: -f1)
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""

# : - xfce
[ ! -f "/usr/share/fonts/noto/NotoSans-Regular.ttf" ] && ${sudo} pacman -S --noconfirm noto-fonts
[ ! -f "/usr/share/fonts/noto-cjk/NotoSansCJK-Regular.ttc" ] && ${sudo} pacman -S --noconfirm noto-fonts-cjk
[ ! -f "/usr/share/fonts/noto/NotoColorEmoji.ttf" ] && ${sudo} pacman -S --noconfirm  	noto-fonts-emoji
[ ! -x "$(which Xorg)" ] && ${sudo} pacman -S --noconfirm xorg-server
[ ! -x "$(which xfwm4)" ] && ${sudo} pacman -S --noconfirm xfce4
[ ! -x "$(which xfce4-notes)" ] && ${sudo} pacman -S --noconfirm xfce4-goodies
