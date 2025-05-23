#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# version : zrfisaac.qemu.amd64.win10.br : 0.0.1

# [ bash ]
file=$(basename "$0")
file="${file%.*}"
[ -f "${file}.img" ] && file="${file}.img"
[ -f "${file}.qcow2" ] && file="${file}.qcow2"
iso="/zrfisaac/repository/os/windows/windows-10-br-amd64.iso"
if [ -f "${file}" ] && [ -f "${iso}" ]
then
	qemu-system-x86_64 \
	  -drive file=${file},format=raw \
      -drive file=${iso},media=cdrom \
	  -m 4G \
	  -enable-kvm \
	  -cpu host \
	  -smp 4 \
	  -virtfs local,path=/zrfisaac/public,mount_tag=public,security_model=none,id=fs0 \
	  -net nic \
	  -device virtio-gpu-pci
fi
