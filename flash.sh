#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.flash : 0.0.1

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
[ ! -f "/usr/share/fonts/noto/NotoColorEmoji.ttf" ] && ${sudo} pacman -S --noconfirm noto-fonts-emoji
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
[ ! -x "$(which less)" ] && ${sudo} pacman -S --noconfirm less
[ ! -x "$(which git)" ] && ${sudo} pacman -S --noconfirm git
[ ! -x "$(which gh)" ] && ${sudo} pacman -S --noconfirm github-cli
[ ! -f "/etc/conf.d/samba" ] && ${sudo} pacman -S --noconfirm samba
[ ! -f "/usr/lib/libwbclient.so" ] && ${sudo} pacman -S --noconfirm libwbclient
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
[ ! -x "$(which php)" ] && ${sudo} pacman -S --noconfirm php
[ ! -x "$(which php-cgi)" ] && ${sudo} pacman -S --noconfirm php-cgi
[ ! -x "$(which qbittorrent)" ] && ${sudo} pacman -S --noconfirm qbittorrent
[ ! -x "$(which filezilla)" ] && ${sudo} pacman -S --noconfirm filezilla

# : - office
echo "# - office"
[ ! -x "$(which loffice)" ] && ${sudo} pacman -S --noconfirm libreoffice-still

# : - multimedia
echo "# - multimedia"
[ ! -x "$(which audacity)" ] && ${sudo} pacman -S --noconfirm audacity
[ ! -x "$(which inkscape)" ] && ${sudo} pacman -S --noconfirm inkscape
[ ! -x "$(which lmms)" ] && ${sudo} pacman -S --noconfirm lmms
[ ! -x "$(which obs)" ] && ${sudo} pacman -S --noconfirm obs-studio

# : - developer
echo "# - developer"
[ ! -x "$(which dbeaver)" ] && ${sudo} pacman -S --noconfirm dbeaver

# : - virtual
echo "# - virtual"
[ ! -x "$(which qemu-img)" ] && ${sudo} pacman -S --noconfirm qemu-full

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
[ ! -x "$(which code)" ] && ${sudo} su - zrfisaac -c "yay -S --noconfirm visual-studio-code-bin"

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

# : - folder
echo "# - folder"
if [ -d "/zrfisaac" ]
then
	${sudo} su - zrfisaac -c "mkdir -p ~/.wine"
	${sudo} su - zrfisaac -c "mkdir -p ~/default"
	${sudo} su - zrfisaac -c "mkdir -p ~/default/android"
	${sudo} su - zrfisaac -c "mkdir -p ~/default/cordova"
	${sudo} su - zrfisaac -c "mkdir -p ~/default/docker"
	${sudo} su - zrfisaac -c "mkdir -p ~/default/dosbox"
	${sudo} su - zrfisaac -c "mkdir -p ~/default/flutter"
	${sudo} su - zrfisaac -c "mkdir -p ~/default/godot3"
	${sudo} su - zrfisaac -c "mkdir -p ~/default/godot4"
	${sudo} su - zrfisaac -c "mkdir -p ~/default/lazarus"
	${sudo} su - zrfisaac -c "mkdir -p ~/default/qemu"
	${sudo} su - zrfisaac -c "mkdir -p ~/default/virtualbox"
	${sudo} su - zrfisaac -c "mkdir -p ~/desktop"
	${sudo} su - zrfisaac -c "mkdir -p ~/download"
	${sudo} su - zrfisaac -c "mkdir -p ~/document"
	${sudo} su - zrfisaac -c "mkdir -p ~/model"
	${sudo} su - zrfisaac -c "mkdir -p ~/music"
	${sudo} su - zrfisaac -c "mkdir -p ~/picture"
	${sudo} su - zrfisaac -c "mkdir -p ~/public"
	${sudo} su - zrfisaac -c "mkdir -p ~/repository"
	${sudo} su - zrfisaac -c "mkdir -p ~/repository/game"
	${sudo} su - zrfisaac -c "mkdir -p ~/repository/os"
	${sudo} su - zrfisaac -c "mkdir -p ~/repository/os/alpine"
	${sudo} su - zrfisaac -c "mkdir -p ~/repository/os/archlinux"
	${sudo} su - zrfisaac -c "mkdir -p ~/repository/os/debian"
	${sudo} su - zrfisaac -c "mkdir -p ~/repository/os/macos"
	${sudo} su - zrfisaac -c "mkdir -p ~/repository/os/manjaro"
	${sudo} su - zrfisaac -c "mkdir -p ~/repository/os/msdos"
	${sudo} su - zrfisaac -c "mkdir -p ~/repository/os/ubuntu"
	${sudo} su - zrfisaac -c "mkdir -p ~/repository/os/windows"
	${sudo} su - zrfisaac -c "mkdir -p ~/repository/program"
	${sudo} su - zrfisaac -c "mkdir -p ~/template"
	${sudo} su - zrfisaac -c "mkdir -p ~/trash"
	${sudo} su - zrfisaac -c "mkdir -p ~/trash/01-any"
	${sudo} su - zrfisaac -c "mkdir -p ~/video"
fi

# : - shortcut
echo "# - shortcut"
if [ -d "/zrfisaac" ]
then
	${sudo} su - zrfisaac -c "[ ! -e ~/default/wine ] && ln -s ~/.wine/drive_c ~/default/wine"
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
