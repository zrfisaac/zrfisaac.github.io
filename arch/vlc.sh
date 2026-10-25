#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.bash.vlc : 26.10.11.1

# [ bash ]
user=""
[ "${user}" == "" ] && user=$(getent passwd 1000 | cut -d: -f1)
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""

# : - vlc
[ ! -x "$(which ffmpeg)" ] && ${sudo} pacman -S --noconfirm ffmpeg
[ ! -x "$(which yt-dlp)" ] && ${sudo} pacman -S --noconfirm yt-dlp
[ ! -x "$(which vlc)" ] && ${sudo} pacman -S --noconfirm vlc
[ ! -x "$(which vlc)" ] && ${sudo} pacman -S --noconfirm vlc-plugins-all
