#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.archlinux.format : 1.0.0

# [ bash ]
user=""
[ "${user}" == "" ] && user=$(getent passwd 1000 | cut -d: -f1)
[ "${user}" == "" ] && user=$(getent passwd 15443 | cut -d: -f1)
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""
read input
if [ "${input}" != "" ]
then
	${sudo} parted -s "${input}" mklabel gpt
	${sudo} parted -s "${input}" mkpart primary 0% 512MB
	${sudo} parted -s "${input}" mkpart primary 512MB 1GB
	${sudo} parted -s "${input}" mkpart primary 1GB 100%
	fix=
	[ "${input}" == *"nvme"* ] && fix=p
	${sudo} mkfs.ext3 -F -q ${input}${fix}1
	${sudo} mkfs.fat -F 32 ${input}${fix}2
	${sudo} mkfs.ext4 -F -q ${input}${fix}3
fi
