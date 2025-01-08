#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.archlinux.open : 1.0.0

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
	${sudo} cryptsetup open ${input}3 zero
	${sudo} mount /dev/mapper/zero /mnt
	${sudo} mkdir -p /mnt/boot
	${sudo} mkdir -p /mnt/efi
	${sudo} mount ${input}1 /mnt/boot
	${sudo} mount ${input}2 /mnt/efi
fi
