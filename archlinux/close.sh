#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.archlinux.close : 1.0.0

# [ bash ]
user=""
[ "${user}" == "" ] && user=$(getent passwd 1000 | cut -d: -f1)
[ "${user}" == "" ] && user=$(getent passwd 15443 | cut -d: -f1)
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""
read input
if [ "${input}" != "" ]
then
	${sudo} umount /mnt/boot > /dev/null 2>&1
	${sudo} umount /mnt/efi > /dev/null 2>&1
	${sudo} umount /mnt > /dev/null 2>&1
	${sudo} cryptsetup close zero > /dev/null 2>&1
fi
