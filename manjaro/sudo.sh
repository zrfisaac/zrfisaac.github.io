#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.manjaro.sudo : 1.0.0

# [ bash ]
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""
_user=$(getent passwd 1000 | cut -d: -f1)
${sudo} echo "${_user} ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/${_user}
