#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.debian.odbc : 1.0.0

# [ bash ]
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""
${sudo} apt -y install unixodbc
${sudo} apt -y install libodbc1
${sudo} apt -y install libmyodbc
${sudo} apt -y install odbc-postgresql
curl https://packages.microsoft.com/keys/microsoft.asc | ${sudo} apt-key add -
${sudo} curl https://packages.microsoft.com/config/ubuntu/20.04/prod.list > /etc/apt/sources.list.d/mssql-release.list
${sudo} apt -y update
${sudo} apt -y install msodbcsql18
${sudo} apt -y install mssql-tools
