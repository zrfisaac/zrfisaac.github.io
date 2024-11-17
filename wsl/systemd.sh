#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.wsl.systemd : 1.0.1

# [ shell ]

# - : wsl --shutdown

# [ bash ]
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""
${sudo} echo "[boot]" > /etc/wsl.conf
${sudo} echo "systemd=true" >> /etc/wsl.conf
