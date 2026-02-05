#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.manjaro.mssql : 26.2.5.1

# [ bash ]
user=$(getent passwd 1000 | cut -d: -f1)
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""
yay -S --noconfirm mssql-server
yay -S --noconfirm mssql-tools
${sudo} mkdir -p /var/opt/mssql/hk && ${sudo} chown mssql:mssql /var/opt/mssql/hk
${sudo} /opt/mssql/bin/mssql-conf setup
${sudo} systemctl enable mssql-server.service
