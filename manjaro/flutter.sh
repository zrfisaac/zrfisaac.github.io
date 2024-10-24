#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.manjaro.flutter : 1.0.0

# [ bash ]
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""
${sudo} pamac install --no-confirm paru-bin 
${sudo} pamac install --no-confirm flutter-common
${sudo} pamac install --no-confirm flutter-intellij-patch
${sudo} pamac install --no-confirm flutter-tool
${sudo} pamac install --no-confirm flutter-sky-engine-google-bin
${sudo} pamac install --no-confirm flutter-material-fonts-google-bin
${sudo} pamac install --no-confirm flutter-engine-common-google-bin
${sudo} pamac install --no-confirm flutter-engine-linux-google-bin
${sudo} pamac install --no-confirm flutter-target-linux
${sudo} pamac install --no-confirm flutter-engine-android-google-bin
${sudo} pamac install --no-confirm flutter-gradle
${sudo} pamac install --no-confirm flutter-target-android
${sudo} pamac install --no-confirm flutter-devel
${sudo} pamac install --no-confirm flutter-engine-web-google-bin
${sudo} pamac install --no-confirm flutter-target-web
${sudo} pamac install --no-confirm flutter
${sudo} paru -S --noconfirm flutter-bin
