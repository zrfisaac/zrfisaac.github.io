#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.manjaro.flutter : 1.0.0

# [ bash ]
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""
yay -S --noconfirm flutter-common
yay -S --noconfirm flutter-intellij-patch
yay -S --noconfirm flutter-tool
yay -S --noconfirm flutter-sky-engine-google-bin
yay -S --noconfirm flutter-material-fonts-google-bin
yay -S --noconfirm flutter-engine-common-google-bin
yay -S --noconfirm flutter-engine-linux-google-bin
yay -S --noconfirm flutter-target-linux
yay -S --noconfirm flutter-engine-android-google-bin
yay -S --noconfirm flutter-gradle
yay -S --noconfirm flutter-target-android
yay -S --noconfirm flutter-devel
yay -S --noconfirm flutter-engine-web-google-bin
yay -S --noconfirm flutter-target-web
yay -S --noconfirm flutter
