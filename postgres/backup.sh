#!/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.web.postgres.backup : 0.0.1

# [ bash ]
# - config
c_psql_shell=$(command -v psql &> /dev/null && echo "pg_restore" || echo "pg_restore")
c_psql_server="127.0.0.1"
c_psql_port="5432"
c_psql_user="postgres"
c_psql_password="ABcd!@34"
c_psql_database="postgres"

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

# - table
export PGPASSWORD="${c_psql_password}"
for _file in $(find "${c_path}" \( -name "*.bak" -o -name "*.backup" -o -name "*.Backup" \)); do
	_database=$(basename ${_file%.*})
	echo "# : ${_file}"
	psql -h "${c_psql_server}" -p "${c_psql_port}" -U "${c_psql_user}" -d "${c_psql_database}" -c "CREATE DATABASE \"${_database}\";"
	${c_psql_shell} -h "${c_psql_server}" -p "${c_psql_port}" -U "${c_psql_user}" -d "${_database}" "${_file}"
done
