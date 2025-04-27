#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.debian.winetricks : 0.0.1

# [ bash ]
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""
[ -f "/usr/bin/winetricks" ] && ${sudo} rm -rf /usr/bin/winetricks
${sudo} wget -O /usr/bin/winetricks https://raw.githubusercontent.com/Winetricks/winetricks/refs/heads/master/src/winetricks
${sudo} chmod +x /usr/bin/winetricks
