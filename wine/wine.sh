#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.wine.wine : 0.0.1

# [ bash ]
user=""
[ "${user}" == "" ] && user=$(getent passwd 1000 | cut -d: -f1)
[ "${user}" == "" ] && user=$(getent passwd 15443 | cut -d: -f1)
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""
path=$(pwd)
if [  "$1" != "" ]
then
	export WINEPREFIX="$path/_wine"
	export WINEARCH=win32
	${path}/wine $1 $2 $3 $4 $5 $6 $7 $8 $9
fi
