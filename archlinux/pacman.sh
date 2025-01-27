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
	# : - compression
	[ ! -x "$(which zip)" ] && ${sudo} pacman -S --noconfirm zip
	[ ! -x "$(which unzip)" ] && ${sudo} pacman -S --noconfirm unzip
	[ ! -x "$(which unrar)" ] && ${sudo} pacman -S --noconfirm unrar
	[ ! -x "$(which 7z)" ] && ${sudo} pacman -S --noconfirm p7zip

	# : - network
	[ ! -x "$(which wget)" ] && ${sudo} pacman -S --noconfirm wget
	[ ! -x "$(which curl)" ] && ${sudo} pacman -S --noconfirm curl

	# : - font
	[ ! -f "/usr/share/fontconfig/conf.avail/46-noto-mono.conf" ] && ${sudo} pacman -S --noconfirm noto-fonts
	[ ! -f "/usr/share/fonts/noto/NotoKufiArabic-ExtraBold.ttf" ] && ${sudo} pacman -S --noconfirm noto-fonts-extra
	[ ! -f "/usr/share/fonts/noto-cjk/NotoSansCJK-Black.ttc" ] && ${sudo} pacman -S --noconfirm noto-fonts-cjk

	[ ! -x "$(which geany)" ] && ${sudo} pacman -S --noconfirm geany

	[ ! -x "$(which git)" ] && ${sudo} pacman -S --noconfirm git
	[ ! -x "$(which gh)" ] && ${sudo} pacman -S --noconfirm github-cli
	[ ! -x "$(which yt-dlp)" ] && ${sudo} pacman -S --noconfirm yt-dlp
	[ ! -d "/lib64/jvm/java-17-openjdk" ] && ${sudo} pacman -S --noconfirm jdk17-openjdk
	[ ! -x "$(which dhcpcd)" ] && ${sudo} pacman -S --noconfirm dhcpcd
	[ ! -x "$(which docker)" ] && ${sudo} pacman -S --noconfirm docker
	[ ! -x "$(which docker-compose)" ] && ${sudo} pacman -S --noconfirm docker-compose
	[ ! -f "/usr/share/fonts/noto/NotoColorEmoji.ttf" ] && ${sudo} pacman -S --noconfirm noto-fonts-emoji
	[ ! -f "/usr/lib/modules-load.d/virtualbox-host-modules-arch.conf" ] && ${sudo} pacman -S --noconfirm virtualbox-host-modules-arch
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
	[ ! -x "$(which dbeaver)" ] && ${sudo} pacman -S --noconfirm dbeaver
	[ ! -x "$(which filezilla)" ] && ${sudo} pacman -S --noconfirm filezilla
	[ ! -x "$(which lazarus)" ] && ${sudo} pacman -S --noconfirm lazarus-gtk2
	[ ! -x "$(which vlc)" ] && ${sudo} pacman -S --noconfirm vlc
	[ ! -x "$(which grub-install)" ] && ${sudo} pacman -S --noconfirm grub
	[ ! -x "$(which audacity)" ] && ${sudo} pacman -S --noconfirm audacity
	[ ! -x "$(which libreoffice)" ] && ${sudo} pacman -S --noconfirm libreoffice-still
	[ ! -x "$(which mono)" ] && ${sudo} pacman -S --noconfirm mono

	# : - file
	[ ! -x "$(which file-roller)" ] && ${sudo} pacman -S --noconfirm file-roller
	[ ! -x "$(which totem)" ] && ${sudo} pacman -S --noconfirm totem

	# : - network
	[ ! -f "/usr/lib/libgnutls.so" ] && ${sudo} pacman -S --noconfirm gnutls
	[ ! -f "/usr/lib32/libgnutls.so" ] && ${sudo} pacman -S --noconfirm lib32-gnutls
	[ ! -x "$(which samba)" ] && ${sudo} pacman -S --noconfirm samba

	# : - web
	[ ! -x "$(which firefox)" ] && ${sudo} pacman -S --noconfirm firefox
	[ ! -x "$(which chromium)" ] && ${sudo} pacman -S --noconfirm chromium
	[ ! -x "$(which qbittorrent)" ] && ${sudo} pacman -S --noconfirm qbittorrent

	# : - audio
	[ ! -f "/usr/lib/libasound.so" ] && ${sudo} pacman -S --noconfirm alsa-lib
	[ ! -f "/usr/bin/alsamixer" ] && ${sudo} pacman -S --noconfirm alsa-utils
	[ ! -f "/usr/lib/firmware/aica_firmware.bin" ] && ${sudo} pacman -S --noconfirm alsa-firmware
	[ ! -f "/usr/bin/aoss" ] && ${sudo} pacman -S --noconfirm alsa-oss
	[ ! -f "/usr/bin/pulseaudio" ] && ${sudo} pacman -S --noconfirm pulseaudio
	[ ! -f "/etc/alsa/conf.d/99-pulseaudio-default.conf" ] && ${sudo} pacman -S --noconfirm pulseaudio-alsa
	[ ! -f "/usr/lib/pulseaudio/modules/module-bluetooth-discover.so" ] && ${sudo} pacman -S --noconfirm pulseaudio-bluetooth
	[ ! -f "/usr/lib/pulseaudio/modules/module-equalizer-sink.so" ] && ${sudo} pacman -S --noconfirm pulseaudio-equalizer
	[ ! -f "/usr/lib/pulseaudio/modules/module-jack-sink.so" ] && ${sudo} pacman -S --noconfirm pulseaudio-jack
	[ ! -f "/usr/lib/pulseaudio/modules/module-lirc.so" ] && ${sudo} pacman -S --noconfirm pulseaudio-lirc
	[ ! -f "/usr/lib/pulseaudio/modules/libavahi-wrap.so" ] && ${sudo} pacman -S --noconfirm pulseaudio-zeroconf
	[ ! -f "/usr/bin/paprefs" ] && ${sudo} pacman -S --noconfirm paprefs
	[ ! -f "/usr/bin/pavucontrol" ] && ${sudo} pacman -S --noconfirm pavucontrol
	[ ! -f "/usr/bin/pavucontrol-qt" ] && ${sudo} pacman -S --noconfirm pavucontrol-qt
	[ ! -f "/usr/lib/xfce4/panel/plugins/libpulseaudio-plugin.so" ] && ${sudo} pacman -S --noconfirm xfce4-pulseaudio-plugin
	[ ! -f "/usr/bin/pulsemixer" ] && ${sudo} pacman -S --noconfirm pulsemixer
	[ ! -f "/usr/bin/pulseaudio-equalizer" ] && ${sudo} pacman -S --noconfirm pulseaudio-equalizer-ladspa
	[ ! -f "/usr/share/licenses/sof-firmware/Notice.NXP" ] && ${sudo} pacman -S --noconfirm sof-firmware

	[ ! -f "/usr/lib/libmtp.so" ] && ${sudo} pacman -S --noconfirm libmtp
	[ ! -x "$(which stlink-gui)" ] && ${sudo} pacman -S --noconfirm stlink
	[ ! -f "/usr/bin/android-file-transfer" ] && ${sudo} pacman -S --noconfirm android-file-transfer
	[ ! -f "/usr/bin/fusermount3" ] && ${sudo} pacman -S --noconfirm fuse3
	[ ! -f "/usr/bin/mtpfs" ] && ${sudo} pacman -S --noconfirm mtpfs
	[ ! -f "/usr/lib/gvfsd" ] && ${sudo} pacman -S --noconfirm gvfs
	[ ! -f "/usr/lib/gvfsd-mtp" ] && ${sudo} pacman -S --noconfirm gvfs-mtp
	[ ! -f "/usr/bin/parted" ] && ${sudo} pacman -S --noconfirm parted

	[ ! -x "$(which cordova)" ] && ${sudo} pacman -S --noconfirm cordova
	[ ! -x "$(which nuget)" ] && ${sudo} pacman -S --noconfirm nuget
else
	${sudo} rm -rvf ${input}/$(basename ${0})
	${sudo} cp -rvf ${0} ${input}/$(basename ${0})
	${sudo} arch-chroot ${input} /$(basename ${0})
	${sudo} rm -rvf ${input}/$(basename ${0})
fi
