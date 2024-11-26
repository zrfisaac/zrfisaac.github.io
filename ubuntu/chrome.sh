#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.ubuntu.chrome : 1.0.0

# [ bash ]
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""
${sudo} apt -y update
${sudo} apt -y install wget
${sudo} apt -y --fix-broken install libnspr4
${sudo} apt -y --fix-broken install libnss3
[ ! -f "./_.deb" ] && wget -O ./_.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
${sudo} dpkg -i _.deb && [ -f "./_.deb" ] && rm -rf ./_.deb
