#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.debian.chrome : 0.0.1

# [ bash ]
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""
wget -O _.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
${sudo} dpkg -i _.deb
${sudo} apt -y --fix-broken install
[ -f "_.deb" ] && rm _.deb
