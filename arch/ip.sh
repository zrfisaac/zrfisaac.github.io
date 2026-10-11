#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.bash.ip : 26.10.11.1

# [ bash ]
user=""
[ "${user}" == "" ] && user=$(getent passwd 1000 | cut -d: -f1)
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""

# : - ip
[ ! -x "$(which ffmpeg)" ] && ${sudo} pacman -S --noconfirm iproute2
[ ! -x "$(which yt-dlp)" ] && ${sudo} pacman -S --noconfirm openbsd-netcat
