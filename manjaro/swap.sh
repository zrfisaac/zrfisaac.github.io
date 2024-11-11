#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.manjaro.swap : 1.0.0

# [ bash ]
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""
[ -f /swapfile ] && ${sudo} swapoff /swapfile
[ -f /swapfile ] && ${sudo} rm -rvf /swapfile
${sudo} fallocate -l 16G /swapfile
${sudo} chmod 0600 /swapfile
${sudo} mkswap /swapfile
[ -f /swapfile ] && ${sudo} swapon /swapfile
