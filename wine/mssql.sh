#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.wine.mdac28 : 1.0.0

# [ bash ]
winetricks --force --unattended mdac28
wine winecfg -v win10
