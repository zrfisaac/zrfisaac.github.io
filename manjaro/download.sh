#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.manjaro.download : 1.0.0

# [ bash ]
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""
${sudo} pacman -S --noconfirm qbittorrent
${sudo} pacman -S --noconfirm python
${sudo} pacman -S --noconfirm ffmpeg
${sudo} pacman -S --noconfirm yt-dlp
