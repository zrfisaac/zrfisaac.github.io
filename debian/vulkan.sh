#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.debian.vulkan : 1.0.0

# [ bash ]
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""
${sudo} apt -y install vulkan-utils
${sudo} apt -y install mesa-vulkan-drivers
${sudo} apt -y install 
${sudo} add-apt-repository ppa:graphics-drivers/ppa
${sudo} apt -y update
#sudo apt install nvidia-driver-<version> nvidia-vulkan-<version>

