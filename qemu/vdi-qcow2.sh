#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# version : zrfisaac.qemu.vdi.qcow2 : 0.0.1

# [ bash ]
file=$(basename "$0")
file="${file%.*}"
[ -f "${file}.vdi" ] && qemu-img convert -f vdi -O qcow2 ${file}.vdi ${file}.qcow2
