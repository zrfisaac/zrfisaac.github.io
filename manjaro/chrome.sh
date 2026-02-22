#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.manjaro.chrome : 26.2.22.1

# [ bash ]
user=$(getent passwd 1000 | cut -d: -f1)
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""
yay -S --noconfirm google-chrome
[ -f "/usr/bin/google-chrome" ] && ${sudo} ln -s /usr/bin/google-chrome-stable /usr/bin/google-chrome
