#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.update : 1.0.1

# [ bash ]
user=""
[ "${user}" == "" ] && user=$(getent passwd 1000 | cut -d: -f1)
[ "${user}" == "" ] && user=$(getent passwd 15443 | cut -d: -f1)
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""
