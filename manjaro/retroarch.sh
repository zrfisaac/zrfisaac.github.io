#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.manjaro.retroarch : 1.0.0

# [ bash ]
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""
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
