#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# version : zrfisaac.qemu.img.g140 : 0.0.1

# [ bash ]
file=$(basename "$0")
file="${file%.*}"
qemu-img create -f raw ${file}.img 140G
