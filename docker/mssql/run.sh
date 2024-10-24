#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.web.bash.mssql : 3.1.0

# [ bash ]

# - config
c_mssql_shell=$(command -v sqlcmd &> /dev/null && echo "sqlcmd" || echo "sqlcmd")
c_mssql_server="127.0.0.1"
c_mssql_port="1433"
c_mssql_user="sa"
c_mssql_password="ABcd!@34"
c_mssql_database="master"

# - config
c_path="$(pwd)"

# - sudo
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""

# - config
[ -f  $(pwd)/config.sh ] && source $(pwd)/config.sh
[ -f  $(pwd)/_config.sh ] && source $(pwd)/_config.sh
[ -f  $(pwd)/__config.sh ] && source $(pwd)/__config.sh

# - clean
[ -d  $(pwd)/_ ] && source $(pwd)/_

# - run
for _file in $(find "${c_path}" \( -name "*.sql" -o -name "*.mssql.sql" \)); do
	echo "# : ${_file}"
	sqlcmd -S ${c_mssql_server},${c_mssql_port} -d ${c_mssql_database} -U ${c_mssql_user} -P ${c_mssql_password}  -C -i "${_file}"
done
