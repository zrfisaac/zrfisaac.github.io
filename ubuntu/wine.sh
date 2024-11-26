#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.ubuntu.wine : 1.0.0

# [ url ]

# - : https://gitlab.winehq.org/wine/wine/-/wikis/Debian-Ubuntu

# [ bash ]
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""
${sudo} dpkg --add-architecture i386
${sudo} mkdir -pm755 /etc/apt/keyrings
${sudo} wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
${sudo} wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/oracular/winehq-oracular.sources
${sudo} apt -y update
#${sudo} apt -y install --install-recommends winehq-stable
${sudo} apt -y install --install-recommends wine
${sudo} apt -y install cabextract
