#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.bash.800 : 26.10.11.1

# [ bash ]

# - variable
set -euo pipefail
v_file="/etc/default/grub"
v_resolution="800x600"

# - check
echo "# . - check"
[ "$EUID" -ne 0 ] && exit 1
[ ! -f "$v_file" ] && exit 1

# - configure
echo "# . - configure"
sed -i '/^GRUB_GFXMODE=/d; /^GRUB_GFXPAYLOAD_LINUX=/d' "$v_file"

echo "GRUB_GFXMODE=$v_resolution" >> "$v_file"
echo "GRUB_GFXPAYLOAD_LINUX=keep" >> "$v_file"

# - grub
echo "# . - grub"
grub-mkconfig -o /boot/grub/grub.cfg

# - end
echo "# . - end"
