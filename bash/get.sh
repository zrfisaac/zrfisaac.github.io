#!/usr/bin/env bash

# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.bash.get : 26.10.11.2

# [ bash ]

# : - begin
printf '# - : %s\n' "$(realpath -- "$0")"

# - variable
set -euo pipefail
v_user="zrfisaac"
v_home="/zrfisaac"
v_repo="https://github.com/USER/REPO.git"

# - check
echo "# . - check"
[ "$EUID" -ne 0 ] && exit 1
id "$v_user" &>/dev/null && exit 1
[ -e "$v_home" ] && exit 1

# - user
echo "# . - user"
useradd -m -d "$v_home" -s /bin/bash "$v_user"

# - clone
echo "# . - clone"
git clone "$v_repo" "$v_home/_"

# - copy
echo "# . - copy"
cp -a "$v_home/_/." "$v_home/"

# - delete
echo "# . - delete"
rm -rf "$v_home/_"

# - permission
echo "# . - permission"
chown -R "$v_user:$v_user" "$v_home"
chmod 700 "$v_home"

# - end
echo "# . - end"
