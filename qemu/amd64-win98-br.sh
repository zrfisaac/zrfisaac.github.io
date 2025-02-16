#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# version : zrfisaac.qemu.amd64.win98.br : 0.0.1

# [ bash ]
file=$(basename "$0")
file="${file%.*}"
[ -f "${file}.img" ] && file="${file}.img"
[ -f "${file}.qcow2" ] && file="${file}.qcow2"
iso="/zrfisaac/repository/os/windows/windows-98-br-i386.iso"
if [ -f "${file}" ] && [ -f "${iso}" ]
then
	qemu-system-i386 \
	  -drive file=${file},format=raw \
	  -drive file=${iso},media=cdrom \
		-m 512M \
		-cpu 486 \
		-smp 1 \
		-virtfs local,path=/zrfisaac/public,mount_tag=public,security_model=none,id=fs0 \
		-net nic \
		-device virtio-gpu-pci
fi
