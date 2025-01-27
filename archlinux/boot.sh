#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.archlinux.boot : 1.0.1

# [ bash ]
user=""
[ "${user}" == "" ] && user=$(getent passwd 1000 | cut -d: -f1)
[ "${user}" == "" ] && user=$(getent passwd 15443 | cut -d: -f1)
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""
input=""
[ "${input}" == "" ] && input="${1}"
[ "${input}" == "" ] && read input
if [ "${input}" != "" ]
then
	${sudo} mkinitcpio -p linux
	${sudo} grub-install --target=x86_64-efi --recheck ${input} --efi-directory=/efi --boot-directory=/boot --bootloader-id=GRUB --removable
	${sudo} grub-mkconfig -o /boot/grub/grub.cfg
fi
