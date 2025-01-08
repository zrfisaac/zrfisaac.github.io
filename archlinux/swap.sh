#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.archlinux.pacman : 1.0.0

# [ bash ]
user=""
[ "${user}" == "" ] && user=$(getent passwd 1000 | cut -d: -f1)
[ "${user}" == "" ] && user=$(getent passwd 15443 | cut -d: -f1)
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""
input=""
[ "${input}" == "" ] && input="${1}"
[ "${input}" == "" ] && read input
if [ "${input}" == "" ]
then
	[ -f /swapfile ] && ${sudo} swapoff /swapfile
	[ -f /swapfile ] && ${sudo} rm -rvf /swapfile
	${sudo} fallocate -l 16G /swapfile
	${sudo} chmod 0600 /swapfile
	${sudo} mkswap /swapfile
	[ -f /swapfile ] && ${sudo} swapon /swapfile
else
	${sudo} rm -rvf ${input}/$(basename ${0})
	${sudo} cp -rvf ${0} ${input}/$(basename ${0})
	${sudo} arch-chroot ${input} /$(basename ${0})
	${sudo} rm -rvf ${input}/$(basename ${0})
fi
