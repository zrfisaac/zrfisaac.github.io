#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# version : zrfisaac.qemu.vdi.img : 0.0.1

# [ bash ]
file=$(basename "$0")
file="${file%.*}"
[ -f "${file}.vdi" ] && qemu-img convert -f vdi -O raw ${file}.vdi ${file}.img
