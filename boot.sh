#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.boot : 0.0.1

# [ bash ]
user=""
[ "${user}" == "" ] && user=$(getent passwd 1000 | cut -d: -f1)
[ "${user}" == "" ] && user=$(getent passwd 15443 | cut -d: -f1)
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""
if [ "${1}" != "" ] && [ ! -d "${1}" ] && [ ! -f "${1}" ] && [ -e "${1}" ]
then
	${sudo} mkinitcpio -p linux
	${sudo} grub-install --target=x86_64-efi --recheck ${1} --efi-directory=/efi --boot-directory=/boot --bootloader-id=GRUB --removable
	${sudo} grub-mkconfig -o /boot/grub/grub.cfg
fi
