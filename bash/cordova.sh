#!/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.web.bash.cordova : 0.0.1

# [ bash ]
_name=zrfisaac.github.io.bash.cordova
_title=ZRFISAAC
[ ! -f "config.xml" ] && cordova create _ $_name $_title
[ ! -f "config.xml" ] && mv _/* .
[ -d "_" ] && rm -rvf _
[ ! -d "platforms/android" ] && cordova platform add android
[ ! -d "/opt/android-sdk/build-tools/33.0.2" ] && sdkmanager --sdk_root=/opt/android-sdk "build-tools;33.0.2"
cordova build android
[ ! -d "binary" ] && mkdir -p binary
[ -f "binary/app-debug.apk" ] && rm -rvf binary/app-debug.apk
[ -f "platforms/android/app/build/outputs/apk/debug/app-debug.apk" ] && mv platforms/android/app/build/outputs/apk/debug/app-debug.apk binary/app-debug.apk
