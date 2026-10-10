#!/usr/bin/env bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.mint.anydesk : 26.9.14.2

# [ bash ]
set -e
grep -rlE '^[[:space:]]*deb[[:space:]]+cdrom:' /etc/apt/sources.list /etc/apt/sources.list.d 2>/dev/null |
while IFS= read -r arquivo; do
    sudo sed -i -E 's|^[[:space:]]*(deb[[:space:]]+cdrom:)|# \1|' "$arquivo"
done
sudo apt update
sudo apt install -y ca-certificates curl apt-transport-https
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://keys.anydesk.com/repos/DEB-GPG-KEY -o /etc/apt/keyrings/keys.anydesk.com.asc
sudo chmod a+r /etc/apt/keyrings/keys.anydesk.com.asc
echo "deb [signed-by=/etc/apt/keyrings/keys.anydesk.com.asc] https://deb.anydesk.com all main" | sudo tee /etc/apt/sources.list.d/anydesk-stable.list >/dev/null
sudo apt update
sudo apt install -y anydesk
anydesk &
