#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.bash.die : 0.0.1

# [ bash ]
user=""
[ "${user}" == "" ] && user=$(getent passwd 1000 | cut -d: -f1)
[ "${user}" == "" ] && user=$(getent passwd 15443 | cut -d: -f1)
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""
breath="$(pwd)/breath.bin"
if [ "${1}" != "" ] && [ -e "${1}" ] && [ ! -d "${1}" ] && [ ! -f "${1}" ] && [ -f "${breath}" ]
then
	${sudo} dd if=/dev/urandom of=${1} bs=2048 count=1 2>/dev/null
fi
