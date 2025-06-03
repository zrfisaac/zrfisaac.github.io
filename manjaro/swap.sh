#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.manjaro.swap : 1.0.1

# [ bash ]
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""
[ -f /swap/swapfile ] && ${sudo} swapoff /swap/swapfile
[ -f /swap/swapfile ] && ${sudo} rm -rvf /swap/swapfile
${sudo} mkswap -U clear --size 16G --file /swap/swapfile
${sudo} chmod 0600 /swap/swapfile
[ -f /swap/swapfile ] && ${sudo} swapon /swap/swapfile
