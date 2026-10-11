#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.arch.vnc : 26.10.11.3

# [ bash ]

# - variable
set -euo pipefail
v_display=":1"
v_port="15443"
v_app="${1:-winecfg}"
v_home="$HOME"
v_novnc="$v_home/novnc"

# - install
echo "# . - install"
if [ "$EUID" -eq 0 ]; then
    pacman -S --needed --noconfirm tigervnc xorg-xauth git wine
else
    sudo pacman -S --needed --noconfirm tigervnc xorg-xauth git wine
fi

# - clone
echo "# . - clone"
[ -d "$v_novnc" ] || git clone https://github.com/novnc/noVNC.git "$v_novnc"
[ -d "$v_novnc/utils/websockify" ] ||
    git clone https://github.com/novnc/websockify.git "$v_novnc/utils/websockify"

# - configure
echo "# . - configure"
mkdir -p "$v_home/.config/tigervnc"

cat > "$v_home/.config/tigervnc/xstartup" <<EOF
#!/usr/bin/bash
unset SESSION_MANAGER
unset DBUS_SESSION_BUS_ADDRESS
exec dbus-run-session -- $v_app
EOF

chmod +x "$v_home/.config/tigervnc/xstartup"

# - vnc
echo "# . - vnc"
vncserver -kill "$v_display" 2>/dev/null || true
vncserver "$v_display" -geometry 800x600 -depth 24 -localhost yes

# - novnc
echo "# . - novnc"
"$v_novnc/utils/novnc_proxy" \
    --vnc localhost:5901 \
    --listen "0.0.0.0:$v_port" &

# - end
echo "# . - end"
echo "http://localhost:$v_port/vnc.html"
