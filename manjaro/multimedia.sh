#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.manjaro.geany : 1.0.0

# [ bash ]
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""
[ ! -x "$(which audacity)" ] && ${sudo} pacman -S --noconfirm audacity
[ ! -x "$(which inkscape)" ] && ${sudo} pacman -S --noconfirm inkscape
[ ! -x "$(which lmms)" ] && ${sudo} pacman -S --noconfirm lmms
[ ! -x "$(which obs)" ] && ${sudo} pacman -S --noconfirm obs-studio
[ ! -x "$(which ffmpeg)" ] && ${sudo} pacman -S --noconfirm ffmpeg
[ ! -x "$(which yt-dlp)" ] && ${sudo} pacman -S --noconfirm yt-dlp
[ ! -x "$(which vlc)" ] && ${sudo} pacman -S --noconfirm vlc
[ ! -x "$(which vlc)" ] && ${sudo} pacman -S --noconfirm vlc-plugins-all
