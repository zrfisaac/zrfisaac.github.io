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
	[ ! -x "$(which zip)" ] && ${sudo} pacman -S --noconfirm zip
	[ ! -x "$(which unzip)" ] && ${sudo} pacman -S --noconfirm unzip
	[ ! -x "$(which unrar)" ] && ${sudo} pacman -S --noconfirm unrar
	[ ! -x "$(which 7z)" ] && ${sudo} pacman -S --noconfirm p7zip
	[ ! -x "$(which wget)" ] && ${sudo} pacman -S --noconfirm wget
	[ ! -x "$(which curl)" ] && ${sudo} pacman -S --noconfirm curl
	[ ! -x "$(which git)" ] && ${sudo} pacman -S --noconfirm git
	[ ! -x "$(which gh)" ] && ${sudo} pacman -S --noconfirm github-cli
	[ ! -x "$(which geany)" ] && ${sudo} pacman -S --noconfirm geany
	[ ! -x "$(which yt-dlp)" ] && ${sudo} pacman -S --noconfirm yt-dlp
	[ ! -d "/lib64/jvm/java-17-openjdk" ] && ${sudo} pacman -S --noconfirm jdk17-openjdk
	[ ! -x "$(which dhcpcd)" ] && ${sudo} pacman -S --noconfirm dhcpcd
	[ ! -x "$(which docker)" ] && ${sudo} pacman -S --noconfirm docker
	[ ! -x "$(which docker-compose)" ] && ${sudo} pacman -S --noconfirm docker-compose
	[ ! -f "/usr/share/fontconfig/conf.avail/46-noto-mono.conf" ] && ${sudo} pacman -S --noconfirm noto-fonts
	[ ! -f "/usr/share/fonts/noto/NotoKufiArabic-ExtraBold.ttf" ] && ${sudo} pacman -S --noconfirm noto-fonts-extra
	[ ! -f "/usr/share/fonts/noto-cjk/NotoSansCJK-Black.ttc" ] && ${sudo} pacman -S --noconfirm noto-fonts-cjk
	[ ! -f "/usr/share/fonts/noto/NotoColorEmoji.ttf" ] && ${sudo} pacman -S --noconfirm noto-fonts-emoji
	[ ! -x "$(which virtualbox)" ] && ${sudo} pacman -S --noconfirm virtualbox
	[ ! -x "$(which netcat)" ] && ${sudo} pacman -S --noconfirm gnu-netcat
	[ ! -f "/etc/httpd/conf/httpd.conf" ] && ${sudo} pacman -S --noconfirm apache
	[ ! -f "/etc/php/php.ini" ] && ${sudo} pacman -S --noconfirm php
	[ ! -f "/etc/httpd/conf/extra/php_module.conf" ] && ${sudo} pacman -S --noconfirm php-apache
	[ ! -d "/usr/share/android-tools" ] && ${sudo} pacman -S --noconfirm android-tools
	[ ! -d "/usr/share/licenses/python-protobuf" ] && ${sudo} pacman -S --noconfirm python-protobuf
	[ ! -x "$(which dart)" ] && ${sudo} pacman -S --noconfirm dart
	[ ! -x "$(which godot)" ] && ${sudo} pacman -S --noconfirm godot
	[ ! -x "$(which wine)" ] && ${sudo} pacman -S --noconfirm wine
	[ ! -d "/usr/share/wine/gecko" ] && ${sudo} pacman -S --noconfirm wine-gecko
	[ ! -d "/usr/share/wine/mono" ] && ${sudo} pacman -S --noconfirm wine-mono
	[ ! -x "$(which winetricks)" ] && ${sudo} pacman -S --noconfirm winetricks
	[ ! -x "$(which node)" ] && ${sudo} pacman -S --noconfirm nodejs
	[ ! -x "$(which npm)" ] && ${sudo} pacman -S --noconfirm npm
	[ ! -x "$(which inkscape)" ] && ${sudo} pacman -S --noconfirm inkscape
	[ ! -x "$(which openshot-qt)" ] && ${sudo} pacman -S --noconfirm openshot
	[ ! -x "$(which mgba-qt)" ] && ${sudo} pacman -S --noconfirm mgba-qt
	[ ! -x "$(which snes9x)" ] && ${sudo} pacman -S --noconfirm snes9x
	[ ! -x "$(which snes9x-gtk)" ] && ${sudo} pacman -S --noconfirm snes9x-gtk
	[ ! -x "$(which dosbox)" ] && ${sudo} pacman -S --noconfirm dosbox
	[ ! -x "$(which desmume)" ] && ${sudo} pacman -S --noconfirm desmume
	[ ! -x "$(which qemu-storage-daemon)" ] && ${sudo} pacman -S --noconfirm qemu-full
	[ ! -f "$(which pacstrap)" ] && ${sudo} pacman -S --noconfirm arch-install-scripts
	[ ! -x "$(which steam)" ] && ${sudo} pacman -S --noconfirm steam
else
	${sudo} rm -rvf ${input}/$(basename ${0})
	${sudo} cp -rvf ${0} ${input}/$(basename ${0})
	${sudo} arch-chroot ${input} /$(basename ${0})
	${sudo} rm -rvf ${input}/$(basename ${0})
fi
