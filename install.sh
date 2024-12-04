#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.install : 1.0.0

# [ bash ]
if [ -n "$1" ]
then
	cp -rvf /zrfisaac/linux/etc/pacman.conf /linux/etc/pacman.conf
	echo "LANG=en_US.UTF-8" > /etc/locale.conf
	"KEYMAP=de-latin1" > /etc/vconsole.conf
	useradd -m -G wheel -s /bin/bash -u 15443 -d /zrfisaac zrfisaac
	pacman -S --noconfirm base
	pacman -S --noconfirm base-devel
	pacman -S --noconfirm wget
	pacman -S --noconfirm git
	pacman -S --noconfirm curl
	pacman -S --noconfirm grub
	pacman -S --noconfirm zip
	pacman -S --noconfirm unzip
	pacman -S --noconfirm unrar
	pacman -S --noconfirm p7zip
	pacman -S --noconfirm ufw
	pacman -S --noconfirm gufw
	pacman -S --noconfirm xorg-server
	pacman -S --noconfirm xfce4
	pacman -S --noconfirm xfce4-goodies
	pacman -S --noconfirm networkmanager
	pacman -S --noconfirm network-manager-applet
	pacman -S --noconfirm lightdm
	pacman -S --noconfirm lightdm-gtk-greeter
	pacman -S --noconfirm lightdm-gtk-greeter-settings
	systemctl enable ufw
	systemctl enable NetworkManager
	systemctl enable lightdm
else
	command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""
	_user=$(getent passwd 1000 | cut -d: -f1)
	if [ ! -f "/zrfisaac.binary" ]
	then
		[ -f "/zrfisaac.binary" ] && ${sudo} rm -rvf /zrfisaac.binary
		${sudo} fallocate -l 16G /zrfisaac.binary
		${sudo} mkfs.ext4 -F /zrfisaac.binary
		[ ! -d "/zrfisaac.mount" ] && ${sudo} mkdir /zrfisaac.mount
		${sudo} mount /zrfisaac.binary /zrfisaac.mount
		${sudo} rm -rvf /zrfisaac.mount/lost+found
	fi
	if [ $(mountpoint -q /zrfisaac.mount; echo $?) -eq 0 ] && [ -f "/zrfisaac.binary" ]
	then
		if [ -z "$(ls -A /zrfisaac.mount)" ]
		then
			${sudo} pacman -S --noconfirm arch-install-scripts
			${sudo} pacstrap -K /zrfisaac.mount base base-devel
		fi
		${sudo} cp -rf ./install.sh /zrfisaac.mount/install.sh
		[ ! -d "/zrfisaac.mount/zrfisaac" ] && ${sudo} git clone https://github.com/zrfisaac/zrfisaac.github.io.git /zrfisaac.mount/zrfisaac
		${sudo} arch-chroot /zrfisaac.mount /install.sh --chroot
	fi
fi
