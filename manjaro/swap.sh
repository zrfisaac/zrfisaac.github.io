#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.manjaro.swap : 1.0.0

# [ bash ]
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""
[ -f /swap/swapfile ] && ${sudo} swapoff /swap/swapfile
${sudo} sudo swapoff -a
[ -f /swap/swapfile ] && ${sudo} rm -rvf /swap/swapfile
${sudo} fallocate -l 16G /swap/swapfile
${sudo} chmod 0600 /swap/swapfile
${sudo} mkswap /swap/swapfile
[ -f /swap/swapfile ] && ${sudo} swapon /swap/swapfile
