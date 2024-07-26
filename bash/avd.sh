#!/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.web.bash.avd : 0.0.1

# [ bash ]
_android=android-30
_name=zrfiadb01
export ANDROID_HOME=/opt/android-sdk/
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
[ ! -d "/opt/android-sdk/system-images/$_name" ] && sdkmanager "system-images;$_android;google_apis_playstore;x86"
[ ! -d "/home/zrfisaac/.android/avd/$_name.avd" ] && echo "" | avdmanager create avd -n $_name -k "system-images;$_android;google_apis_playstore;x86"
[ -d "/home/zrfisaac/.android/avd/$_name.avd" ] && pgrep -f "emulator" > /dev/null || emulator -avd $_name -memory 6144 -cores 6
[ -d "/home/zrfisaac/.android/avd/$_name.avd" ] && adb wait-for-device
[ -d "/home/zrfisaac/.android/avd/$_name.avd" ] && [ -f "binary/app-debug.apk" ] && adb install binary/app-debug.apk
[ -d "/home/zrfisaac/.android/avd/$_name.avd" ] && [ -f "binary/debug.apk" ] && adb install binary/debug.apk
[ -d "/home/zrfisaac/.android/avd/$_name.avd" ] && [ -f "app-debug.apk" ] && adb install app-debug.apk
[ -d "/home/zrfisaac/.android/avd/$_name.avd" ] && [ -f "debug.apk" ] && adb install debug.apk
