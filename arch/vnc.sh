#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.arch.vnc : 26.10.11.1

# [ bash ]
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""
_user=$(getent passwd 1000 | cut -d: -f1)
[ ! -x "$(which tigervnc)" ] && ${sudo} pacman -S --noconfirm tigervnc
[ ! -d "~/novnc" ] && git clone https://github.com/novnc/noVNC.git ~/novnc
[ -d "~/novnc" ] && [ ! -d "~/novnc/utils/websockify" ] && git clone https://github.com/novnc/websockify.git ~/novnc/utils/websockify
vncserver -kill :1
vncserver :1 &
chmod +x ./novnc/utils/novnc_proxy
./novnc/utils/novnc_proxy --vnc localhost:5901 --listen 0.0.0.0:15443 &
ip a
