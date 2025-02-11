#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# version : zrfisaac.run : 0.0.1

# [ bash ]
echo '#!/data/data/com.termux/files/usr/bin/sh' > ~/.vnc/xstartup
echo 'export DISPLAY=:1' >> ~/.vnc/xstartup
echo 'unset SESSION_MANAGER' >> ~/.vnc/xstartup
echo 'unset DBUS_SESSION_BUS_ADDRESS' >> ~/.vnc/xstartup
echo 'dbus-launch --exit-with-session xfce4-session &' >> ~/.vnc/xstartup
[ ! -d "~/novnc" ] && git clone https://github.com/novnc/noVNC.git ~/novnc
vncserver -kill :1
vncserver :1
chmod +x ./novnc/utils/novnc_proxy
./novnc/utils/novnc_proxy --vnc localhost:5901 --listen 0.0.0.0:15443
