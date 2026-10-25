#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.bash.lib : 26.10.11.1

# [ bash ]

# - variable
set -euo pipefail
v_file="/etc/pacman.conf"

# - check
echo "# . - check"
[ "$EUID" -ne 0 ] && exit 1
[ ! -f "$v_file" ] && exit 1

# - multilib
echo "# . - multilib"
sed -i '/^[[:space:]]*#[[:space:]]*\[multilib\][[:space:]]*$/,/^[[:space:]]*#[[:space:]]*Include[[:space:]]*=[[:space:]]*\/etc\/pacman.d\/mirrorlist[[:space:]]*$/ s/^[[:space:]]*#[[:space:]]*//' "$v_file"

# - sync
echo "# . - sync"
pacman -Sy

# - end
echo "# . - end"
