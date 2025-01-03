#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.debug : 1.0.0

# [ bash ]
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""
_user=$(getent passwd 1000 | cut -d: -f1)
${sudo} umount /zrfisaac.mount
${sudo} umount /zrfisaac.binary
${sudo} umount /zrfisaac.mount
[ -f "/zrfisaac.binary" ] && ${sudo} rm -rvf /zrfisaac.binary
${sudo} rm -rvf /zrfisaac.mount
