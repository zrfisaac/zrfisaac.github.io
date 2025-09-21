#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# version : zrfisaac.qemu.amd64.mac10 : 0.0.1

# [ bash ]
file=$(basename "$0")
file="${file%.*}"
[ -f "${file}.img" ] && file="${file}.img"
[ -f "${file}.qcow2" ] && file="${file}.qcow2"
iso="/zrfisaac/repository/os/macos/macos-10-amd64.iso"
if [ -f "${file}" ] && [ -f "${iso}" ]
then
	qemu-system-x86_64 \
	  -cdrom ${iso} \
	  -drive file=${file},format=raw \
	  -m 4G \
	  -enable-kvm \
	  -cpu host \
	  -smp 4 \
	  -virtfs local,path=/zrfisaac/public,mount_tag=public,security_model=none,id=fs0 \
	  -net nic \
	  -device virtio-gpu-pci
fi
