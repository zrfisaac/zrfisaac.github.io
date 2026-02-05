#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.manjaro.openssh : 26.2.5.1

# [ bash ]
user=$(getent passwd 1000 | cut -d: -f1)
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""
${sudo} pacman -S --noconfirm openssh
${sudo} systemctl enable sshd
${sudo} systemctl start sshd
${sudo} echo "Port 22" > /etc/ssh/sshd_config
${sudo} echo "ListenAddress 0.0.0.0" >> /etc/ssh/sshd_config
${sudo} echo "ListenAddress ::" >> /etc/ssh/sshd_config
${sudo} echo "AllowUsers    ${user}" >> /etc/ssh/sshd_config
