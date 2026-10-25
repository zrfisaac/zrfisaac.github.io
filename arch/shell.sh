#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.bash.shell : 26.10.11.1

# [ bash ]

# - variable
set -euo pipefail
v_user="zrfisaac"
v_dir="/etc/systemd/system/getty@tty1.service.d"
v_file="$v_dir/autologin.conf"

# - check
echo "# . - check"
[ "$EUID" -ne 0 ] && exit 1
id "$v_user" &>/dev/null || exit 1

# - configure
echo "# . - configure"
mkdir -p "$v_dir"

cat > "$v_file" <<EOF
[Service]
ExecStart=
ExecStart=-/usr/bin/agetty --autologin $v_user --noclear %I \$TERM
EOF

# - enable
echo "# . - enable"
systemctl enable getty@tty1.service

# - end
echo "# . - end"
