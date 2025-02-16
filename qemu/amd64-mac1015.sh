#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# version : zrfisaac.qemu.amd64.mac1015 : 0.0.1

# [ bash ]
file=$(basename "$0")
file="${file%.*}"
[ -f "${file}.img" ] && file="${file}.img"
[ -f "${file}.qcow2" ] && file="${file}.qcow2"
iso="/zrfisaac/repository/os/macos/macos-1015-amd64.iso"
if [ -f "${file}" ] && [ -f "${iso}" ]; then
    qemu-system-x86_64 \
        -enable-kvm \
        -m 4G \
        -cpu Penryn,vendor=GenuineIntel,+ssse3,+sse4.1,+sse4.2,+x2apic \
        -smp 4 \
        -machine q35 \
        -usb -device usb-kbd -device usb-mouse \
        -device ide-drive,bus=ide.0,drive=MacHDD \
        -drive id=MacHDD,file=${file},format=raw,if=none \
        -cdrom ${iso} \
        -netdev user,id=net0 -device e1000-82545em,netdev=net0 \
        -boot order=d
fi
