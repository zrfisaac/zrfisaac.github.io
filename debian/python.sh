#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.debian.python : 0.0.1

# [ bash ]
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""
${sudo} apt -y update
${sudo} apt -y install python3
${sudo} apt -y install python3-pip
${sudo} apt -y install python-is-python3
${sudo} [ ! -f "/usr/bin/python" ] && ${sudo} ln -s /usr/bin/python3 /usr/bin/python
