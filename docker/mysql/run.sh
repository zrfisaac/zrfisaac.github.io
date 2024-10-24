#!/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.web.bash.mysql : 0.0.2

# [ bash ]

# - config
c_mysql_shell=$(command -v mariadb &> /dev/null && echo "mariadb" || echo "mysql")
c_mysql_server="127.0.0.1"
c_mysql_port="3306"
c_mysql_user="root"
c_mysql_password="ABcd!@34"
c_mysql_database="mysql"

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
for _file in $(find "${c_path}" \( -name "*.sql" -o -name "*.mysql.sql" -o -name "*.mariadb.sql" \)); do
	echo "# : ${_file}"
	${c_mysql_shell} -h "${c_mysql_server}" -P "${c_mysql_port}" -u "${c_mysql_user}" -p"${c_mysql_password}" -D "${c_mysql_database}" < "${_file}"
done
