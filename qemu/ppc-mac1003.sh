#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# version : zrfisaac.qemu.ppc.mac1003 : 0.0.1

# [ bash ]
file=$(basename "$0")
file="${file%.*}"
[ -f "${file}.img" ] && file="${file}.img"
[ -f "${file}.qcow2" ] && file="${file}.qcow2"
iso1="/zrfisaac/repository/os/macos/macos-1003-amd64-01.iso"
iso2="/zrfisaac/repository/os/macos/macos-1003-amd64-02.iso"
iso3="/zrfisaac/repository/os/macos/macos-1003-amd64-03.iso"
if [ -f "${file}" ] && [ -f "${iso1}" ] && [ -f "${iso2}" ] && [ -f "${iso3}" ]
then
	qemu-system-ppc \
      -drive file=${iso1},media=cdrom \
      -drive file=${iso2},media=cdrom \
      -drive file=${iso3},media=cdrom \
	  -drive file=${file},format=raw \
	  -m 1024 \
	  -cpu G4 \
	  -M mac99,via=pmu \
	  -netdev user,id=net0 -device rtl8139,netdev=net0 \
	  -device usb-mouse -device usb-kbd \
	  -boot d
fi
