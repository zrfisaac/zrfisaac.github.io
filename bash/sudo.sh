#!/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.web.bash.sudo : 0.0.1

# [ bash ]
_user=$(getent passwd 1000 | awk -F: '{print $1}')
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""
$sudo mkdir -p /etc/sudoers.d
$sudo echo "$_user ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/$_user >/dev/null
