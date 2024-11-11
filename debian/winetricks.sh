#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.debian.winetricks : 1.0.0

# [ bash ]
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""
[ -f "/usr/bin/winetricks" ] && ${sudo} rm -rf /usr/bin/winetricks
${sudo} wget -O /usr/bin/winetricks https://zrfisaac.github.io/linux/winetricks
${sudo} chmod +x /usr/bin/winetricks
