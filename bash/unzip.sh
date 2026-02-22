#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.bash.unzip : 26.2.22.1

# [ bash ]
for _file in *.zip; do
    unzip "${_file}"
    rm -rvf readme.*
done
