#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.manjaro.geany : 1.0.0

# [ bash ]
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""
[ ! -x "$(which dbeaver)" ] && ${sudo} pacman -S --noconfirm dbeaver
[ ! -x "$(which node)" ] && ${sudo} pacman -S --noconfirm nodejs
[ ! -x "$(which npm)" ] && ${sudo} pacman -S --noconfirm npm
[ ! -x "$(which cordova)" ] && ${sudo} pacman -S --noconfirm cordova
[ ! -x "$(which stlink-gui)" ] && ${sudo} pacman -S --noconfirm stlink
[ ! -x "$(which rustc)" ] && ${sudo} pacman -S --noconfirm rust
[ ! -x "$(which nasm)" ] && ${sudo} pacman -S --noconfirm nasm
[ ! -x "$(which godot)" ] && ${sudo} pacman -S --noconfirm godot
[ ! -x "$(which riscv64-linux-gnu-as)" ] && ${sudo} pacman -S --noconfirm risc-v
[ ! -f "/etc/highlight/filetypes.conf" ] && ${sudo} pacman -S --noconfirm highlight
[ ! -x "$(which go)" ] && ${sudo} pacman -S --noconfirm go
[ ! -x "$(which lazarus)" ] && ${sudo} pacman -S --noconfirm lazarus-qt6
[ ! -x "$(which mariadb)" ] && ${sudo} pacman -S --noconfirm mariadb && mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
