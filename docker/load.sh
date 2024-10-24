#!/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io

# [ bash ]
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""
cd portainer
./load.sh
cd ..
cd postgres
./load.sh
cd ..
cd mysql
./load.sh
cd ..
cd tomcat
./load.sh
cd ..
cd oracle
./load.sh
cd ..
