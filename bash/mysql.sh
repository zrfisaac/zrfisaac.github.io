#!/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.web.bash.mysql : 0.0.1

# [ bash ]

# - config
echo "# - config"
c_mysql_shell="mysql"
c_mysql_server=""
c_mysql_user=""
c_mysql_password=""
c_mysql_database=""

# - sudo
echo "# - sudo"
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""

# - config
echo "# - config"
[ -f  $(pwd)/config.sh ] && source $(pwd)/config.sh
[ -f  $(pwd)/_config.sh ] && source $(pwd)/_config.sh
[ -f  $(pwd)/__config.sh ] && source $(pwd)/__config.sh

# - clean
echo "# - clean"
[ -d  $(pwd)/_ ] && source $(pwd)/_

# - table
#echo ${c_mysql_shell} -h ${c_mysql_server} -u ${c_mysql_user!} -p${c_mysql_password} -D ${c_mysql_database} < "%%~z"
echo ${c_mysql_shell} -h ${c_mysql_server} -u ${c_mysql_user} -p${c_mysql_password} -D ${c_mysql_database}
