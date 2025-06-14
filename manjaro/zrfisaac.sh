#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.manjaro.zrfisaac : 25.6.12.1

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

# - zip
if ! command -v unrar >/dev/null 2>&1
then
	echo "# - zip"
	${sudo} pacman -S --noconfirm zip
	${sudo} pacman -S --noconfirm unzip
	${sudo} pacman -S --noconfirm 7zip
	${sudo} pacman -S --noconfirm unrar
	echo ""
fi

# - download
if ! command -v yt-dlp >/dev/null 2>&1
then
	echo "# - download"
	${sudo} pacman -S --noconfirm qbittorrent
	${sudo} pacman -S --noconfirm python
	${sudo} pacman -S --noconfirm ffmpeg
	${sudo} pacman -S --noconfirm yt-dlp
	${sudo} pacman -S --noconfirm uget
	echo ""
fi

# - openssh
if ! command -v sshd >/dev/null 2>&1
then
	echo "# - openssh"
	${sudo} pacman -S --noconfirm openssh
	${sudo} systemctl enable sshd
	${sudo} systemctl start sshd
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
if ! command -v python >/dev/null 2>&1
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

# - android
if ! command -v android-studio >/dev/null 2>&1
then
	echo "# - android"
	yay -S --noconfirm android-studio
	yay -S --noconfirm android-sdk-cmdline-tools-latest
	yay -S --noconfirm android-sdk-build-tools
	yay -S --noconfirm android-sdk-platform-tools
	yay -S --noconfirm android-platform
	${sudo} pacman -S --noconfirm android-tools
	${sudo} pacman -S --noconfirm adb
	${sudo} pacman -S --noconfirm jdk8-openjdk
	${sudo} pacman -S --noconfirm jdk17-openjdk
	${sudo} pacman -S --noconfirm android-udev
	${sudo} pacman -S --noconfirm lib32-gcc-libs
	echo ""
fi

# - flutter
if ! command -v flutter >/dev/null 2>&1
then
	echo "# - flutter"
	yay -S --noconfirm flutter-bin
	yay -S --noconfirm flutter
	echo ""
fi

# - cordova
if ! command -v cordova >/dev/null 2>&1
then
	echo "# - cordova"
	${sudo} pacman -S --noconfirm cordova
	echo ""
fi

# - dbeaver
if ! command -v dbeaver >/dev/null 2>&1
then
	echo "# - dbeaver"
	${sudo} pacman -S --noconfirm dbeaver
	echo ""
fi

# - filezilla
if ! command -v filezilla >/dev/null 2>&1
then
	echo "# - filezilla"
	${sudo} pacman -S --noconfirm filezilla
	echo ""
fi

# - remmina
if ! command -v remmina >/dev/null 2>&1
then
	echo "# - remmina"
	${sudo} pacman -S --noconfirm remmina
	${sudo} pacman -S --noconfirm libvncserver
	${sudo} pacman -S --noconfirm gtk-vnc
	${sudo} pacman -S --noconfirm freerdp
	${sudo} pacman -S --noconfirm freerdp
	${sudo} pacman -S --noconfirm openssh
	${sudo} pacman -S --noconfirm tigervnc
	echo ""
fi

# - remmina
if ! command -v wine >/dev/null 2>&1
then
	echo "# - wine"
	${sudo} pacman -S --noconfirm lib32-gnutls
	${sudo} pacman -S --noconfirm lib32-alsa-lib
	${sudo} pacman -S --noconfirm lib32-alsa-plugins
	${sudo} pacman -S --noconfirm lib32-libpulse
	${sudo} pacman -S --noconfirm lib32-pipewire 
	${sudo} pacman -S --noconfirm pipewire-pulse
	${sudo} pacman -S --noconfirm lib32-libpulse
	${sudo} pacman -S --noconfirm pipewire-alsa
	${sudo} pacman -S --noconfirm lib32-alsa-lib
	${sudo} pacman -S --noconfirm lib32-alsa-oss
	${sudo} pacman -S --noconfirm lib32-alsa-plugins
	${sudo} pacman -S --noconfirm wine
	${sudo} pacman -S --noconfirm wine-gecko
	${sudo} pacman -S --noconfirm wine-mono
fi


# - godot3
if ! command -v godot3-bin >/dev/null 2>&1
then
	echo "# - godot3"
	yay -S --noconfirm godot3-bin
	echo ""
fi

# - godot
if ! command -v godot >/dev/null 2>&1
then
	echo "# - godot"
	${sudo} pacman -S --noconfirm godot
	echo ""
fi

# - lmms
if ! command -v lmms >/dev/null 2>&1
then
	echo "# - lmms"
	${sudo} pacman -S --noconfirm lmms
	echo ""
fi

# - chrome
if ! command -v google-chrome-stable >/dev/null 2>&1
then
	echo "# - google-chrome"
	yay -S --noconfirm google-chrome
	echo ""
fi

# - lazarus
if ! command -v lazarus >/dev/null 2>&1
then
	echo "# - lazarus"
	${sudo} pacman -S --noconfirm gdb
	${sudo} pacman -S --noconfirm lazarus-qt5
	echo ""
fi
