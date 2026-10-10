#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.manjaro.github : 1.0.0

# [ shell ]

# - : gh auth login

# [ bash ]
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""
[ ! -x "$(which android-studio)" ] && yay -S --noconfirm android-studio
[ ! -d "/opt/android-sdk/cmdline-tools" ] && yay -S --noconfirm android-sdk-cmdline-tools-latest
[ ! -d "/opt/android-sdk/build-tools" ] && yay -S --noconfirm android-sdk-build-tools
[ ! -d "/opt/android-sdk/platform-tools" ] && yay -S --noconfirm android-sdk-platform-tools
[ ! -d "/opt/android-sdk/platforms" ] && yay -S --noconfirm android-platform
[ ! -d "/etc/java-openjdk" ] && ${sudo} pacman -S --noconfirm jdk-openjdk
[ ! -d "/etc/java-8-openjdk" ] && ${sudo} pacman -S --noconfirm jdk8-openjdk
[ ! -d "/etc/java17-openjdk" ] && ${sudo} pacman -S --noconfirm jdk17-openjdk
[ ! -d "/etc/java21-openjdk" ] && ${sudo} pacman -S --noconfirm jdk21-openjdk
[ ! -x "$(which gradle)" ] && ${sudo} pacman -S --noconfirm gradle
