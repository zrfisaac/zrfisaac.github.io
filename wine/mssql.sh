#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.wine.mssql : 1.0.1

# [ bash ]
winetricks --force --unattended ole32
winetricks --force --unattended oleaut32
winetricks --force --unattended native_mdac
winetricks --force --unattended native_oleaut32
winetricks --force --unattended mdac28
