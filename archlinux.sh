#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.manjaro : 3.1.0

# [ bash ]
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""
user=$(getent passwd 1000 | cut -d: -f1)
kernel="linux612"
local="/zrfisaac"
#[ ! -f "/etc/sudoers.d/${user}" ] && echo "${user} ALL=(ALL) NOPASSWD:ALL" | ${sudo} tee /etc/sudoers.d/${user} > /dev/null
#[ ! -d "${local}" ] && ${sudo} git clone https://github.com/zrfisaac/zrfisaac.github.io.git ${local}
#[ -d "${local}" ] && ${sudo} chown -R ${user}:${user} ${local}
#[ -d "${local}" ] && ${sudo} sed -i 's|/home/zrfisaac|/zrfisaac|g' /etc/passwd
#[ -d "/home/zrfisaac" ] && ${sudo} rm -rvf /home/zrfisaac

# : - user
#${sudo} usermod -a -G vboxusers ${user}

# : - swap
if [ $(stat -c%s /swapfile) -lt $((16 * 1024 * 1024 * 1024)) ]
then
	[ -f /swapfile ] && ${sudo} swapoff /swapfile
	[ -f /swapfile ] && ${sudo} rm -rvf /swapfile
	${sudo} fallocate -l 16G /swapfile
	${sudo} chmod 0600 /swapfile
	${sudo} mkswap /swapfile
	[ -f /swapfile ] && ${sudo} swapon /swapfile
fi

# : - pacman
#${sudo} pacman -Syu --noconfirm
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
[ ! -f "/usr/lib/modules-load.d/${kernel}-virtualbox-host-modules.conf" ] && ${sudo} pacman -S --noconfirm ${kernel}-virtualbox-host-modules && ${sudo} modprobe vboxdrv && ${sudo} modprobe vboxnetadp && ${sudo} modprobe vboxnetflt
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
[ ! -f "usr/share/bash-completion/completions/pacstrap" ] && ${sudo} pacman -S --noconfirm arch-install-scripts
[ ! -x "$(which steam)" ] && ${sudo} pacman -S --noconfirm steam

# : - pamac
#${sudo} sed -i 's/^#EnableAUR/EnableAUR/' /etc/pamac.conf
#${sudo} pamac update --aur --no-confirm
[ ! -f "/usr/share/geany/colorschemes/kugel.conf" ] && ${sudo} pamac install --no-confirm geany-themes
[ ! -x "$(which code)" ] && ${sudo} pamac install --no-confirm visual-studio-code-bin
[ ! -x "$(which google-chrome-stable)" ] && ${sudo} pamac install --no-confirm google-chrome
[ ! -d "/opt/github-desktop" ] && ${sudo} pamac install --no-confirm github-desktop-bin
[ ! -x "$(which aseprite)" ] && ${sudo} pamac install --no-confirm aseprite
[ ! -x "$(which android-studio)" ] && ${sudo} pamac install --no-confirm android-studio
[ ! -d "/opt/android-sdk/cmdline-tools" ] && ${sudo} pamac install --no-confirm android-sdk-cmdline-tools-latest
[ ! -d "/opt/android-sdk/build-tools" ] && ${sudo} pamac install --no-confirm android-sdk-build-tools
[ ! -d "/opt/android-sdk/platform-tools" ] && ${sudo} pamac install --no-confirm android-sdk-platform-tools
[ ! -d "/opt/android-sdk/platforms" ] && ${sudo} pamac install --no-confirm android-platform
[ ! -x "$(which yay)" ] && ${sudo} pamac install --no-confirm yay
[ ! -x "$(which godot3)" ] && ${sudo} pamac install --no-confirm godot3
[ ! -x "$(which archey4)" ] && ${sudo} pamac install --no-confirm archey4
[ ! -x "$(which blender-3.6)" ] && ${sudo} pamac install --no-confirm blender-3.6-bin
[ ! -x "$(which simple64-gui)" ] && ${sudo} pamac install --no-confirm simple64
[ ! -x "$(which ventoy)" ] && ${sudo} pamac install --no-confirm ventoy

# : - yay
[ ! -d "/usr/lib/flutter" ] && yay -S --noconfirm flutter
[ ! -d "/usr/lib/flutter/packages/flutter_tools" ] && yay -S --noconfirm flutter-tool

# : extra
# - : https://docs.flutter.dev/get-started/install/linux/android
[ ! -f "/usr/bin/google-chrome" ] && ${sudo} ln -s /usr/bin/google-chrome-stable /usr/bin/google-chrome
[ ! -d "/opt/flutter" ] && ${sudo} mkdir -p /opt/flutter && ${sudo} wget -qO- https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.27.1-stable.tar.xz | ${sudo} tar -xJ -C /opt/flutter --strip-components=1
#yes | flutter doctor --android-licenses

# : - permission
#[ -d "${local}" ] && ${sudo} chown -R ${user}:${user} ${local}
#[ -d "${local}" ] && ${sudo} chown -R ${user}:${user} /opt

# : xdg
_xdg="${local}/.config"
[ -d "${local}/Desktop" ] && rm -rvf ${local}/Desktop
[ -d "${local}/Documents" ] && rm -rvf ${local}/Documents
[ -d "${local}/Downloads" ] && rm -rvf ${local}/Downloads
[ -d "${local}/Music" ] && rm -rvf ${local}/Music
[ -d "${local}/Pictures" ] && rm -rvf ${local}/Pictures
[ -d "${local}/Public" ] && rm -rvf ${local}/Public
[ -d "${local}/Templates" ] && rm -rvf ${local}/Templates
[ -d "${local}/Videos" ] && rm -rvf ${local}/Videos
[ ! -d "{_xdg}" ] && mkdir -p ${_xdg}
[ ! -d "${local}/default" ] && mkdir ${local}/default
[ ! -d "${local}/default/android" ] && mkdir ${local}/default/android
[ ! -d "${local}/default/dosbox" ] && mkdir ${local}/default/dosbox
[ ! -d "${local}/default/flutter" ] && mkdir ${local}/default/flutter
[ ! -d "${local}/default/virtualbox" ] && mkdir ${local}/default/virtualbox
[ ! -d "${local}/desktop" ] && mkdir ${local}/desktop
[ ! -d "${local}/download" ] && mkdir ${local}/download
[ ! -d "${local}/template" ] && mkdir ${local}/template
[ ! -d "${local}/public" ] && mkdir ${local}/public
[ ! -d "${local}/document" ] && mkdir ${local}/document
[ ! -d "${local}/music" ] && mkdir ${local}/music
[ ! -d "${local}/picture" ] && mkdir ${local}/picture
[ ! -d "${local}/repository" ] && mkdir ${local}/repository
[ ! -d "${local}/repository/game" ] && mkdir ${local}/repository/game
[ ! -d "${local}/repository/os" ] && mkdir ${local}/repository/os
[ ! -d "${local}/repository/os/archlinux" ] && mkdir ${local}/repository/os/archlinux
[ ! -d "${local}/repository/os/manjaro" ] && mkdir ${local}/repository/os/manjaro
[ ! -d "${local}/repository/os/windows" ] && mkdir ${local}/repository/os/windows
[ ! -d "${local}/repository/program" ] && mkdir ${local}/repository/program
[ ! -d "${local}/video" ] && mkdir ${local}/video
[ ! -d "${local}/trash" ] && mkdir ${local}/trash
[ ! -d "${local}/trash/01-any" ] && mkdir ${local}/trash/01-any
_xdg="${_xdg}/user-dirs.dirs"
echo "XDG_DESKTOP_DIR=\"$HOME/desktop\"" > ${_xdg}
echo "XDG_DOWNLOAD_DIR=\"$HOME/download\"" >> ${_xdg}
echo "XDG_TEMPLATES_DIR=\"$HOME/template\"" >> ${_xdg}
echo "XDG_PUBLICSHARE_DIR=\"$HOME/public\"" >> ${_xdg}
echo "XDG_DOCUMENTS_DIR=\"$HOME/document\"" >> ${_xdg}
echo "XDG_MUSIC_DIR=\"$HOME/music\"" >> ${_xdg}
echo "XDG_PICTURES_DIR=\"$HOME/picture\"" >> ${_xdg}
echo "XDG_VIDEOS_DIR=\"$HOME/video\"" >> ${_xdg}

# : - service
${sudo} systemctl enable httpd && ${sudo} systemctl restart httpd 
${sudo} systemctl enable docker && ${sudo} systemctl restart docker

# gdb
# lazarus-gtk2
# dbeaver
# cordova
