#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.archlinux.crypt : 1.0.0

# [ bash ]
user=""
[ "${user}" == "" ] && user=$(getent passwd 1000 | cut -d: -f1)
[ "${user}" == "" ] && user=$(getent passwd 15443 | cut -d: -f1)
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""
read input
if [ "${input}" != "" ]
then
	${sudo} cryptsetup close zero > /dev/null 2>&1
	${sudo} cryptsetup luksFormat ${input}3
	${sudo} cryptsetup open ${input}3 zero
	${sudo} mkfs.ext4 -F -q /dev/mapper/zero
	${sudo} cryptsetup close zero > /dev/null 2>&1
fi
