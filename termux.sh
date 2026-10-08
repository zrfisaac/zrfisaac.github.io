#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# version : zrfisaac.termux : 0.0.1

# [ url ]

# - : https://wiki.termux.com/wiki/Package_Management

# [ bash ]
pkg update
pkg upgrade
pkg install game-repo
pkg install science-repo
pkg install root-repo
pkg install x11-repo
pkg install git
pkg install tigervnc
pkg install xfce4
pkg install xfce4-goodies
echo '#!/data/data/com.termux/files/usr/bin/sh' > ~/.vnc/xstartup
echo 'export DISPLAY=localhost:0' >> ~/.vnc/xstartup
echo 'xfce4-session &' >> ~/.vnc/xstartup
[ ! -d "~/novnc" ] && git clone https://github.com/novnc/noVNC.git ~/novnc
[ ! -d "~/zrfisaac" ] && git clone https://github.com/zrfisaac/zrfisaac.github.io.git ~/zrfisaac
