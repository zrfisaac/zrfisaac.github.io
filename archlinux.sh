#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.archlinux : 0.0.1

# [ bash ]
user=""
[ "${user}" == "" ] && user=$(getent passwd 1000 | cut -d: -f1)
[ "${user}" == "" ] && user=$(getent passwd 15443 | cut -d: -f1)
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""

# : - main
echo "# - main"
[ ! -x "$(which which)" ] && ${sudo} pacman -S --noconfirm which
[ ! -x "$(which wget)" ] && ${sudo} pacman -S --noconfirm wget
[ ! -x "$(which curl)" ] && ${sudo} pacman -S --noconfirm curl
[ ! -x "$(which nano)" ] && ${sudo} pacman -S --noconfirm nano
[ ! -x "$(which pacstrap)" ] && ${sudo} pacman -S --noconfirm arch-install-scripts

# : - base
echo "# - base"
[ ! -x "$(which fakeroot)" ] && ${sudo} pacman -S --noconfirm base-devel
[ ! -x "$(which grub-install)" ] && ${sudo} pacman -S --noconfirm grub
[ ! -x "$(which efibootmgr)" ] && ${sudo} pacman -S --noconfirm efibootmgr
[ ! -x "$(which mkfs.fat)" ] && ${sudo} pacman -S --noconfirm dosfstools

# : - compression
echo "# - compression"
[ ! -x "$(which zip)" ] && ${sudo} pacman -S --noconfirm zip
[ ! -x "$(which unzip)" ] && ${sudo} pacman -S --noconfirm unzip
[ ! -x "$(which unrar)" ] && ${sudo} pacman -S --noconfirm unrar

# : - gui
echo "# - gui"
[ ! -f "/usr/share/fonts/noto/NotoSans-Regular.ttf" ] && ${sudo} pacman -S --noconfirm noto-fonts
[ ! -f "/usr/share/fonts/noto-cjk/NotoSansCJK-Regular.ttc" ] && ${sudo} pacman -S --noconfirm noto-fonts-cjk
[ ! -f "/usr/share/fonts/noto/NotoColorEmoji.ttf" ] && ${sudo} pacman -S --noconfirm  	noto-fonts-emoji
[ ! -x "$(which Xorg)" ] && ${sudo} pacman -S --noconfirm xorg-server
[ ! -x "$(which xfwm4)" ] && ${sudo} pacman -S --noconfirm xfce4
[ ! -x "$(which xfce4-notes)" ] && ${sudo} pacman -S --noconfirm xfce4-goodies
[ ! -x "$(which lightdm)" ] && ${sudo} pacman -S --noconfirm lightdm
[ ! -x "$(which lightdm-gtk-greeter)" ] && ${sudo} pacman -S --noconfirm lightdm-gtk-greeter
[ ! -x "$(which lightdm-gtk-greeter-settings)" ] && ${sudo} pacman -S --noconfirm lightdm-gtk-greeter-settings
[ ! -x "$(which xdg-user-dirs-update)" ] && ${sudo} pacman -S --noconfirm xdg-user-dirs
[ -x "$(which lightdm)" ] && ${sudo} systemctl enable lightdm

# : - network
echo "# - network"
[ ! -x "$(which iwctl)" ] && ${sudo} pacman -S --noconfirm iwd
[ ! -x "$(which NetworkManager)" ] && ${sudo} pacman -S --noconfirm networkmanager
[ ! -x "$(which nm-applet)" ] && ${sudo} pacman -S --noconfirm network-manager-applet
[ ! -x "$(which ufw)" ] && ${sudo} pacman -S --noconfirm ufw
[ ! -x "$(which gufw)" ] && ${sudo} pacman -S --noconfirm gufw
[ ! -x "$(which git)" ] && ${sudo} pacman -S --noconfirm git
[ ! -x "$(which gh)" ] && ${sudo} pacman -S --noconfirm github-cli
[ -x "$(which NetworkManager)" ] && ${sudo} systemctl enable NetworkManager
[ -x "$(which ufw)" ] && ${sudo} systemctl enable ufw

# : - audio
echo "# - audio"
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

# : - editor
echo "# - editor"
[ ! -x "$(which geany)" ] && ${sudo} pacman -S --noconfirm geany

# : - web
echo "# - web"
[ ! -x "$(which netcat)" ] && ${sudo} pacman -S --noconfirm gnu-netcat
[ ! -x "$(which firefox)" ] && ${sudo} pacman -S --noconfirm firefox
[ ! -x "$(which php)" ] && ${sudo} pacman -S --noconfirm php
[ ! -x "$(which httpd)" ] && ${sudo} pacman -S --noconfirm apache
[ ! -f "/etc/httpd/conf/extra/php_module.conf" ] && ${sudo} pacman -S --noconfirm php-apache
[ ! -x "$(which php-cgi)" ] && ${sudo} pacman -S --noconfirm php-cgi
[ ! -x "$(which qbittorrent)" ] && ${sudo} pacman -S --noconfirm qbittorrent

# : - office
echo "# - office"
[ ! -x "$(which loffice)" ] && ${sudo} pacman -S --noconfirm libreoffice-still

# : - multimedia
echo "# - multimedia"
[ ! -x "$(which audacity)" ] && ${sudo} pacman -S --noconfirm audacity
[ ! -x "$(which inkscape)" ] && ${sudo} pacman -S --noconfirm inkscape
[ ! -x "$(which lmms)" ] && ${sudo} pacman -S --noconfirm lmms
[ ! -x "$(which obs)" ] && ${sudo} pacman -S --noconfirm obs-studio

# : - virtual
echo "# - virtual"
[ ! -x "$(which dosbox)" ] && ${sudo} pacman -S --noconfirm dosbox
[ ! -x "$(which qemu-img)" ] && ${sudo} pacman -S --noconfirm qemu-full
[ ! -x "$(which docker)" ] && ${sudo} pacman -S --noconfirm docker
[ ! -f "/usr/lib/docker/cli-plugins/docker-buildx" ] && ${sudo} pacman -S --noconfirm docker-buildx
[ ! -x "$(which docker-compose)" ] && ${sudo} pacman -S --noconfirm docker-compose
[ -x "$(which docker)" ] && ${sudo} systemctl enable docker

# : - user
echo "# - user"
if [ ! -d "/zrfisaac" ]
then
	useradd -m -G wheel -s /bin/bash -d /zrfisaac zrfisaac
	${sudo} echo "zrfisaac ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/zrfisaac
fi

# : - aur
echo "# - aur"
if [ ! -x "$(which yay)" ]
then
	[ -d "/_" ] && ${sudo} rm -rvf /_
	${sudo} git clone https://aur.archlinux.org/yay.git /_
	${sudo} chown -R zrfisaac:zrfisaac /_
	${sudo} su - zrfisaac -c "cd /_ && makepkg -sri --noconfirm"
	[ -d "/_" ] && ${sudo} rm -rvf /_
fi

# : - yay
echo "# - yay"
[ ! -x "$(which ventoy)" ] && ${sudo} su - zrfisaac -c "yay -S --noconfirm ventoy"
[ ! -x "$(which google-chrome-stable)" ] && ${sudo} su - zrfisaac -c "yay -S --noconfirm google-chrome"
[ ! -d "/opt/github-desktop" ] && ${sudo} su - zrfisaac -c "yay -S --noconfirm github-desktop-bin"

# : - github
echo "# - github"
if [ -d "/zrfisaac" ] && [ ! -d "/zrfisaac/.git" ]
then
	git clone https://github.com/zrfisaac/zrfisaac.github.io.git /zrfisaac/_
	mv -vf /zrfisaac/_/* /zrfisaac/
	mv -vf /zrfisaac/_/.* /zrfisaac/
	rm -rvf /zrfisaac/_
	chown -R zrfisaac:zrfisaac /zrfisaac
fi

# : - xdg
echo "# - xdg"
if [ -x "$(which xdg-user-dirs-update)" ] && [ ! -f "/zrfisaac/.config/user-dirs.dirs" ]
then
	xdg="/zrfisaac/.config"
	[ -d "/zrfisaac/Desktop" ] && rm -rvf /zrfisaac/Desktop
	[ -d "/zrfisaac/Documents" ] && rm -rvf /zrfisaac/Documents
	[ -d "/zrfisaac/Downloads" ] && rm -rvf /zrfisaac/Downloads
	[ -d "/zrfisaac/Music" ] && rm -rvf /zrfisaac/Music
	[ -d "/zrfisaac/Pictures" ] && rm -rvf /zrfisaac/Pictures
	[ -d "/zrfisaac/Public" ] && rm -rvf /zrfisaac/Public
	[ -d "/zrfisaac/Templates" ] && rm -rvf /zrfisaac/Templates
	[ -d "/zrfisaac/Videos" ] && rm -rvf /zrfisaac/Videos
	[ ! -d "{xdg}" ] && mkdir -p ${xdg}
	[ ! -d "/zrfisaac/default" ] && mkdir /zrfisaac/default
	[ ! -d "/zrfisaac/default/android" ] && mkdir /zrfisaac/default/android
	[ ! -d "/zrfisaac/default/dosbox" ] && mkdir /zrfisaac/default/dosbox
	[ ! -d "/zrfisaac/default/flutter" ] && mkdir /zrfisaac/default/flutter
	[ ! -d "/zrfisaac/default/virtualbox" ] && mkdir /zrfisaac/default/virtualbox
	[ ! -d "/zrfisaac/desktop" ] && mkdir /zrfisaac/desktop
	[ ! -d "/zrfisaac/download" ] && mkdir /zrfisaac/download
	[ ! -d "/zrfisaac/template" ] && mkdir /zrfisaac/template
	[ ! -d "/zrfisaac/public" ] && mkdir /zrfisaac/public
	[ ! -d "/zrfisaac/document" ] && mkdir /zrfisaac/document
	[ ! -d "/zrfisaac/music" ] && mkdir /zrfisaac/music
	[ ! -d "/zrfisaac/picture" ] && mkdir /zrfisaac/picture
	[ ! -d "/zrfisaac/repository" ] && mkdir /zrfisaac/repository
	[ ! -d "/zrfisaac/repository/game" ] && mkdir /zrfisaac/repository/game
	[ ! -d "/zrfisaac/repository/os" ] && mkdir /zrfisaac/repository/os
	[ ! -d "/zrfisaac/repository/os/archlinux" ] && mkdir /zrfisaac/repository/os/archlinux
	[ ! -d "/zrfisaac/repository/os/manjaro" ] && mkdir /zrfisaac/repository/os/manjaro
	[ ! -d "/zrfisaac/repository/os/windows" ] && mkdir /zrfisaac/repository/os/windows
	[ ! -d "/zrfisaac/repository/program" ] && mkdir /zrfisaac/repository/program
	[ ! -d "/zrfisaac/video" ] && mkdir /zrfisaac/video
	[ ! -d "/zrfisaac/trash" ] && mkdir /zrfisaac/trash
	[ ! -d "/zrfisaac/trash/01-any" ] && mkdir /zrfisaac/trash/01-any
	xdg="/zrfisaac/.config/user-dirs.dirs"
	echo "XDG_DESKTOP_DIR=\"$HOME/desktop\"" > ${xdg}
	echo "XDG_DOWNLOAD_DIR=\"$HOME/download\"" >> ${xdg}
	echo "XDG_TEMPLATES_DIR=\"$HOME/model\"" >> ${xdg}
	echo "XDG_PUBLICSHARE_DIR=\"$HOME/public\"" >> ${xdg}
	echo "XDG_DOCUMENTS_DIR=\"$HOME/document\"" >> ${xdg}
	echo "XDG_MUSIC_DIR=\"$HOME/music\"" >> ${xdg}
	echo "XDG_PICTURES_DIR=\"$HOME/picture\"" >> ${xdg}
	echo "XDG_VIDEOS_DIR=\"$HOME/video\"" >> ${xdg}
	${sudo} chown -R zrfisaac:zrfisaac /zrfisaac
	${sudo} usermod -a -G docker zrfisaac
fi

# : - swap
echo "# - swap"
if [ ! -f /swapfile ]
then
	${sudo} fallocate -l 16G /swapfile
	${sudo} chmod 0600 /swapfile
	${sudo} mkswap /swapfile
fi
