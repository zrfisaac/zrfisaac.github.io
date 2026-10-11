#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.arch.vnc : 26.10.11.5

# [ bash ]

# - variable
set -euo pipefail
v_display=":1"
v_port="15443"
v_app="${1:-winecfg}"
v_home="$HOME"
v_novnc="$v_home/novnc"
v_passwd="$v_home/.config/tigervnc/passwd"

# - check
echo "# . - check"
[ "$EUID" -eq 0 ] && exit 1

# - install
echo "# . - install"
sudo pacman -S --needed --noconfirm \
    tigervnc xorg-xauth git dbus \
    xfwm4 wine

# - clone
echo "# . - clone"
[ -d "$v_novnc" ] ||
    git clone https://github.com/novnc/noVNC.git "$v_novnc"

[ -d "$v_novnc/utils/websockify" ] ||
    git clone https://github.com/novnc/websockify.git \
    "$v_novnc/utils/websockify"

# - password
echo "# . - password"
mkdir -p "$v_home/.config/tigervnc"

if [ ! -f "$v_passwd" ]; then
    vncpasswd "$v_passwd"
fi

chmod 600 "$v_passwd"

# - vnc
echo "# . - vnc"
if [ -f "$v_home/.config/tigervnc/vnc.pid" ]; then
    kill "$(cat "$v_home/.config/tigervnc/vnc.pid")" 2>/dev/null || true
fi

Xvnc "$v_display" \
    -geometry 800x600 \
    -depth 24 \
    -SecurityTypes VncAuth \
    -PasswordFile "$v_passwd" \
    -localhost &

v_pid=$!
echo "$v_pid" > "$v_home/.config/tigervnc/vnc.pid"

# - wait
echo "# . - wait"
sleep 2
kill -0 "$v_pid"

# - session
echo "# . - session"
export DISPLAY="$v_display"

dbus-run-session -- bash -c '
    xfwm4 &

    while true; do
        "$@"
        sleep 1
    done
' bash "$v_app" &

# - novnc
echo "# . - novnc"
"$v_novnc/utils/novnc_proxy" \
    --vnc localhost:5901 \
    --listen "0.0.0.0:$v_port" &

# - end
echo "# . - end"
echo "http://localhost:$v_port/vnc.html"
wait
