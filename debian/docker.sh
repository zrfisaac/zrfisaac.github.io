#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.debian.docker : 0.0.1

# [ bash ]
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""
${sudo} apt -y update
${sudo} apt -y install apt-transport-https ca-certificates curl software-properties-common
[ ! -f "/usr/share/keyrings/docker-archive-keyring.gpg" ] &&  ${sudo} curl -fsSL https://download.docker.com/linux/debian/gpg | ${sudo}  gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
[ ! -f "/etc/apt/sources.list.d/docker.list" ] && ${sudo} echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | ${sudo} tee /etc/apt/sources.list.d/docker.list > /dev/null
${sudo} apt -y update
${sudo} apt -y install docker-ce
${sudo} systemctl start docker
${sudo} systemctl enable docker
