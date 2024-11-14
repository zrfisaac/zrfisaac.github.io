#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.debian.ms.font : 1.0.0

# [ bash ]
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""
${sudo} apt -y install msttcorefonts-installer
${sudo} apt -y install fontconfig
${sudo} fc-cache -f -v
