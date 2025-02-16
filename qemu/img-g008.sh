#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# version : zrfisaac.qemu.img.g008 : 0.0.1

# [ bash ]
file=$(basename "$0")
file="${file%.*}"
qemu-img create -f raw ${file}.img 8G
