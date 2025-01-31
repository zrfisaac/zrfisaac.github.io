#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# version : zrfisaac.bash.cordova : 1.0.0

# [ bash ]
if [ ! -d "./_" ]
then
	cordova telemetry off
	cordova create _ zrfisaac.bash.cordova zrfisaac
	cd _
	cordova platform add android browser
fi
