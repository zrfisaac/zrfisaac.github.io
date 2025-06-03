#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.manjaro.zrfisaac : 1.0.0

# [ bash ]

# - variable
swap=/swap/swapfile
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""
user=$(getent passwd 1000 | cut -d: -f1)

# - sudo
if ! sudo test -f "/etc/sudoers.d/$user"
then
	echo "# - sudo"
	sudo test -f "/etc/sudoers.d/$user" || ${sudo} "${user} ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/${user}
	echo ""
fi

# - base
if ! command -v fakeroot >/dev/null 2>&1
then
	echo "# - base"
	${sudo} pacman -Syu --noconfirm
	${sudo} pacman -S --noconfirm base
	${sudo} pacman -S --noconfirm base-devel
	echo ""
fi

# - yay
if ! command -v yay >/dev/null 2>&1
then
	echo "# - yay"
	${sudo} pamac install --no-confirm yay
	echo ""
fi

# - swap
if [ $(stat -c%s "${swap}") -le 8589934592 ];
then
	echo "# - swap"
	[ -f ${swap} ] && ${sudo} swapoff ${swap}
	[ -f ${swap} ] && ${sudo} rm -rvf ${swap}
	${sudo} mkswap -U clear --size 16G --file ${swap}
	${sudo} chmod 0600 ${swap}
	[ -f ${swap} ] && ${sudo} swapon ${swap}
	echo ""
fi

# - geany
if ! command -v geany >/dev/null 2>&1
then
	echo "# - geany"
	${sudo} pacman -S --noconfirm geany
	yay -S --noconfirm geany-themes
	echo ""
fi

# - geany
if ! command -v geany >/dev/null 2>&1
then
	echo "# - geany"
	${sudo} pacman -S --noconfirm geany
	yay -S --noconfirm geany-themes
	echo ""
fi

# - vscode
if ! command -v code >/dev/null 2>&1
then
	echo "# - vscode"
	yay -S --noconfirm visual-studio-code-bin
	echo ""
fi

# - python
if ! command -v vscode >/dev/null 2>&1
then
	echo "# - python"
	${sudo} pacman -S --noconfirm python
	echo ""
fi

# - docker
if ! command -v docker >/dev/null 2>&1
then
	echo "# - docker"
	${sudo} pacman -S --noconfirm docker
	${sudo} pacman -S --noconfirm docker-compose
	${sudo} pacman -S --noconfirm docker-buildx
	echo ""
fi

# - noto
if [ ! -f "/usr/share/fonts/noto/NotoColorEmoji.ttf" ]
then
	echo "# - noto"
	${sudo} pacman -S --noconfirm noto-fonts
	${sudo} pacman -S --noconfirm noto-fonts-cjk
	${sudo} pacman -S --noconfirm noto-fonts-emoji
	echo ""
fi

# - github
if ! command -v github-desktop >/dev/null 2>&1
then
	echo "# - github"
	${sudo} pacman -S --noconfirm git
	${sudo} pacman -S --noconfirm github-cli
	yay -S --noconfirm github-desktop-bin
	echo ""
fi
# - virtualbox
if ! command -v virtualbox >/dev/null 2>&1
then
	echo "# - virtualbox"
	${sudo} pacman -S --noconfirm linux612-virtualbox-host-modules
	${sudo} pacman -S --noconfirm virtualbox
	${sudo} pacman -S --noconfirm virtualbox-guest-iso
	${sudo} pacman -S --noconfirm virtualbox-guest-utils
	${sudo} usermod -a -G vboxusers ${user}
	${sudo} usermod -a -G vboxsf ${user}
	echo ""
fi

# - retroarch
if ! command -v retroarch >/dev/null 2>&1
then
	echo "# - retroarch"
	${sudo} pacman -S --noconfirm vulkan-intel
	${sudo} pacman -S --noconfirm vulkan-radeon
	${sudo} pacman -S --noconfirm libvpl
	${sudo} pacman -S --noconfirm vpl-gpu-rt
	${sudo} pacman -S --noconfirm intel-media-sdk
	${sudo} pacman -S --noconfirm mesa
	${sudo} pacman -S --noconfirm nvidia-utils
	${sudo} pacman -S --noconfirm libvdpau-va-gl
	${sudo} pacman -S --noconfirm libva-nvidia-driver
	${sudo} pacman -S --noconfirm libva-utils
	${sudo} pacman -S --noconfirm vdpauinfo
	${sudo} pacman -S --noconfirm libva-intel-driver
	${sudo} pacman -S --noconfirm intel-media-driver
	${sudo} pacman -S --noconfirm retroarch
	${sudo} pacman -S --noconfirm retroarch-assets-glui
	${sudo} pacman -S --noconfirm retroarch-assets-ozone
	${sudo} pacman -S --noconfirm retroarch-assets-xmb
	${sudo} pacman -S --noconfirm libretro-core-info
	${sudo} pacman -S --noconfirm libretro-desmume
	${sudo} pacman -S --noconfirm libretro-dolphin
	${sudo} pacman -S --noconfirm libretro-mgba
	${sudo} pacman -S --noconfirm libretro-mupen64plus-next
	${sudo} pacman -S --noconfirm libretro-snes9x
	${sudo} pacman -S --noconfirm libretro-beetle-psx
	${sudo} pacman -S --noconfirm libretro-play
	${sudo} pacman -S --noconfirm libretro-ppsspp
	${sudo} pacman -S --noconfirm retro-gtk
	${sudo} pacman -S --noconfirm xorg-xinput
	${sudo} pacman -S --noconfirm modprobe
	${sudo} pacman -S --noconfirm joyutils
	${sudo} pacman -S --noconfirm linuxconsole
	${sudo} pacman -S --noconfirm joy2key
	${sudo} pacman -S --noconfirm retroarch-assets-xmb
	yay -S --noconfirm xf86-input-joystick
	yay -S --noconfirm retroarch-standalone-service
	yay -S --noconfirm retroarch-steam-launcher
	yay -S --noconfirm xboxdrv
	echo ""
fi
