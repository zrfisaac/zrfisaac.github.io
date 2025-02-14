#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.bash.breath : 0.0.1

# [ bash ]
user=""
[ "${user}" == "" ] && user=$(getent passwd 1000 | cut -d: -f1)
[ "${user}" == "" ] && user=$(getent passwd 15443 | cut -d: -f1)
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""
breath="$(pwd)/breath.bin"
if [ "${1}" != "" ] && [ -e "${1}" ] && [ ! -d "${1}" ] && [ ! -f "${1}" ]
then
	[ -f "${breath}" ] && rm -rvf ${breath} 2>/dev/null
	${sudo} dd if=${1} of=${breath} bs=2048 count=1 2>/dev/null
fi
