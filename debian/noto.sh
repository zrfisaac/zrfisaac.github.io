#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.debian.noto : 0.0.1

# [ bash ]
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""
${sudo} apt -y install fonts-noto
${sudo} apt -y install fonts-noto-cjk
${sudo} apt -y install fonts-noto-cjk-extra
${sudo} apt -y install fonts-noto-color-emoji
