#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.archlinux.xdg : 1.0.0

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
	xdg="/${user}/.config"
	[ -d "/${user}/Desktop" ] && rm -rvf /${user}/Desktop
	[ -d "/${user}/Documents" ] && rm -rvf /${user}/Documents
	[ -d "/${user}/Downloads" ] && rm -rvf /${user}/Downloads
	[ -d "/${user}/Music" ] && rm -rvf /${user}/Music
	[ -d "/${user}/Pictures" ] && rm -rvf /${user}/Pictures
	[ -d "/${user}/Public" ] && rm -rvf /${user}/Public
	[ -d "/${user}/Templates" ] && rm -rvf /${user}/Templates
	[ -d "/${user}/Videos" ] && rm -rvf /${user}/Videos
	[ ! -d "{xdg}" ] && mkdir -p ${xdg}
	[ ! -d "/${user}/default" ] && mkdir /${user}/default
	[ ! -d "/${user}/default/android" ] && mkdir /${user}/default/android
	[ ! -d "/${user}/default/dosbox" ] && mkdir /${user}/default/dosbox
	[ ! -d "/${user}/default/flutter" ] && mkdir /${user}/default/flutter
	[ ! -d "/${user}/default/virtualbox" ] && mkdir /${user}/default/virtualbox
	[ ! -d "/${user}/desktop" ] && mkdir /${user}/desktop
	[ ! -d "/${user}/download" ] && mkdir /${user}/download
	[ ! -d "/${user}/template" ] && mkdir /${user}/template
	[ ! -d "/${user}/public" ] && mkdir /${user}/public
	[ ! -d "/${user}/document" ] && mkdir /${user}/document
	[ ! -d "/${user}/music" ] && mkdir /${user}/music
	[ ! -d "/${user}/picture" ] && mkdir /${user}/picture
	[ ! -d "/${user}/repository" ] && mkdir /${user}/repository
	[ ! -d "/${user}/repository/game" ] && mkdir /${user}/repository/game
	[ ! -d "/${user}/repository/os" ] && mkdir /${user}/repository/os
	[ ! -d "/${user}/repository/os/archlinux" ] && mkdir /${user}/repository/os/archlinux
	[ ! -d "/${user}/repository/os/manjaro" ] && mkdir /${user}/repository/os/manjaro
	[ ! -d "/${user}/repository/os/windows" ] && mkdir /${user}/repository/os/windows
	[ ! -d "/${user}/repository/program" ] && mkdir /${user}/repository/program
	[ ! -d "/${user}/video" ] && mkdir /${user}/video
	[ ! -d "/${user}/trash" ] && mkdir /${user}/trash
	[ ! -d "/${user}/trash/01-any" ] && mkdir /${user}/trash/01-any
	xdg="${xdg}/user-dirs.dirs"
	echo "XDG_DESKTOP_DIR=\"$HOME/desktop\"" > ${xdg}
	echo "XDG_DOWNLOAD_DIR=\"$HOME/download\"" >> ${xdg}
	echo "XDG_TEMPLATES_DIR=\"$HOME/template\"" >> ${xdg}
	echo "XDG_PUBLICSHARE_DIR=\"$HOME/public\"" >> ${xdg}
	echo "XDG_DOCUMENTS_DIR=\"$HOME/document\"" >> ${xdg}
	echo "XDG_MUSIC_DIR=\"$HOME/music\"" >> ${xdg}
	echo "XDG_PICTURES_DIR=\"$HOME/picture\"" >> ${xdg}
	echo "XDG_VIDEOS_DIR=\"$HOME/video\"" >> ${xdg}
else
	${sudo} rm -rvf ${input}/$(basename ${0})
	${sudo} cp -rvf ${0} ${input}/$(basename ${0})
	${sudo} arch-chroot ${input} /$(basename ${0})
	${sudo} rm -rvf ${input}/$(basename ${0})
fi
