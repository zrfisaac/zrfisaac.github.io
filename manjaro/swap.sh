#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.manjaro.swap : 26.2.5.1

# [ bash ]
user=$(getent passwd 1000 | cut -d: -f1)
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""
swap=/swap/swapfile
${sudo} swapoff ${swap}
${sudo} fallocate -l 16G ${swap}
${sudo} chmod 0600 ${swap}
${sudo} mkswap ${swap}
${sudo} swapon ${swap}
