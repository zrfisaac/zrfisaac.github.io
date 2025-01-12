#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.archlinux.yay : 1.0.0

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
	[ ! -x "$(which google-chrome-stable)" ] && yay -S --noconfirm google-chrome
	[ ! -f "/usr/share/geany/colorschemes/kugel.conf" ] && yay -S --noconfirm geany-themes
	[ ! -x "$(which code)" ] && yay -S --noconfirm visual-studio-code-bin
	[ ! -x "$(which google-chrome-stable)" ] && yay -S --noconfirm google-chrome
	[ ! -d "/opt/github-desktop" ] && yay -S --noconfirm github-desktop-bin
	[ ! -x "$(which aseprite)" ] && yay -S --noconfirm aseprite
	[ ! -x "$(which mugshot)" ] && yay -S --noconfirm mugshot
	[ ! -x "$(which android-studio)" ] && yay -S --noconfirm android-studio
	[ ! -d "/opt/android-sdk/cmdline-tools" ] && yay -S --noconfirm android-sdk-cmdline-tools-latest
	[ ! -d "/opt/android-sdk/build-tools" ] && yay -S --noconfirm android-sdk-build-tools
	[ ! -d "/opt/android-sdk/platform-tools" ] && yay -S --noconfirm android-sdk-platform-tools
	[ ! -d "/opt/android-sdk/platforms" ] && yay -S --noconfirm android-platform
	[ ! -d "/usr/lib/flutter" ] && yay -S --noconfirm flutter
	[ ! -x "$(which eclipse)" ] && yay -S --noconfirm eclipse-jee-bin
	[ ! -x "$(which blender)" ] && yay -S --noconfirm blender-3.6-bin
else
	${sudo} rm -rvf ${input}/$(basename ${0})
	${sudo} cp -rvf ${0} ${input}/$(basename ${0})
	${sudo} arch-chroot ${input} /$(basename ${0})
	${sudo} rm -rvf ${input}/$(basename ${0})
fi
