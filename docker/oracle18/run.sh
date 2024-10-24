#!/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.web.bash.oracle : 0.0.2

# [ bash ]

# - config
c_sqlplus_shell=$(command -v sqlplus &> /dev/null && echo "sqlplus" || echo "sqlplus")
c_oracle_server="127.0.0.1"
c_oracle_port="1521"
c_oracle_service="XE"
c_oracle_user="sysdba"
c_oracle_password="ABcd!@34"

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
for _file in $(find "${c_path}" \( -name "*.sql" -o -name "*.oracle.sql" \)); do
	# sqlplus 'system/"ABcd!@34"@127.0.0.1:1521/XE'
	_data="system/\"${c_oracle_password}\"@${c_oracle_server}:${c_oracle_port}/${c_oracle_service}"
	_real="$(realpath ${_file})"
	echo "# : ${_file}"
	echo "@${_real}" | sqlplus -S "${_data}"
done
