#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# version : zrfisaac.qemu.amd64.pci : 0.0.1

# [ bash ]
file=$(basename "$0")
file="${file%.*}"
[ -f "${file}.img" ] && file="${file}.img"
[ -f "${file}.qcow2" ] && file="${file}.qcow2"
if [ -f "${file}" ]
then
	qemu-system-x86_64 \
	  -drive file=${file},format=raw \
	  -m 4G \
	  -enable-kvm \
	  -cpu host \
	  -smp 4 \
	  -virtfs local,path=/zrfisaac/public,mount_tag=public,security_model=none,id=fs0 \
	  -net nic \
	  -net user,hostfwd=tcp::3389-:3389 \
	  -device virtio-gpu-pci
fi
