#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.archlinux.swap : 25.10.10.1

# [ bash ]
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""
[ -f /swap ] && ${sudo} swapoff /swap
[ -f /swap ] && ${sudo} rm -rvf /swap
${sudo} fallocate -l 8G /swap
${sudo} chmod 0600 /swap
${sudo} mkswap /swap
[ -f /swap ] && ${sudo} swapon /swap
