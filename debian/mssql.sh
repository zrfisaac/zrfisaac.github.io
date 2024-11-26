#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.debian.mssql : 1.0.0

# [ bash ]
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""
curl https://packages.microsoft.com/keys/microsoft.asc | ${sudo} tee /etc/apt/trusted.gpg.d/microsoft.asc
curl https://packages.microsoft.com/config/debian/$(lsb_release -rs)/prod.list | ${sudo} tee /etc/apt/sources.list.d/mssql-release.list
${sudo} apt-get update
${sudo} ACCEPT_EULA=Y apt -y install msodbcsql18
${sudo} ACCEPT_EULA=Y apt -y install mssql-tools18
#echo 'export PATH="$PATH:/opt/mssql-tools18/bin"' >> ~/.bashrc
#source ~/.bashrc
${sudo} apt-get install -y unixodbc-dev
