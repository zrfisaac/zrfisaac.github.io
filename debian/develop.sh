#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.debian.chrome : 0.0.1

# [ bash ]
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""

# : - essential 
${sudo} apt -y install build-essential

# : - package
${sudo} apt -y install flex
${sudo} apt -y install bison

# : - dependency
${sudo} apt -y install libtool
${sudo} apt -y install libglib2.0-dev
${sudo} apt -y install libfreetype6-dev
${sudo} apt -y install libfontconfig1-dev
${sudo} apt -y install libx11-dev
${sudo} apt -y install libxext-dev
${sudo} apt -y install libxfixes-dev
${sudo} apt -y install libxrandr-dev
${sudo} apt -y install libxcomposite-dev
${sudo} apt -y install libxdamage-dev
${sudo} apt -y install libopenal-dev
${sudo} apt -y install libv4l-dev
${sudo} apt -y install libpulse-dev
${sudo} apt -y install libmpg123-dev
${sudo} apt -y install libdbus-1-dev
${sudo} apt -y install libgcrypt20-dev
${sudo} apt -y install libgpg-error-dev
${sudo} apt -y install libgphoto2-dev
${sudo} apt -y install libsdl2-dev
${sudo} apt -y install libpcap-dev
${sudo} apt -y install libudev-dev
${sudo} apt -y install libosmesa6-dev
${sudo} apt -y install libbz2-dev
${sudo} apt -y install libssl-dev
${sudo} apt -y install libxml2-dev
${sudo} apt -y install libxslt1-dev

# : - x32
${sudo} dpkg --add-architecture i386
${sudo} apt -y update
${sudo} apt -y install libc6:i386
${sudo} apt -y install libgcc1:i386
${sudo} apt -y install libstdc++6:i386
${sudo} apt -y install libx11-6:i386
${sudo} apt -y install libxext6:i386
${sudo} apt -y install libxrandr2:i386
${sudo} apt -y install libfontconfig1:i386
${sudo} apt -y install libfreetype6:i386

# : - x64
${sudo} apt -y install libc6-dev

# : - optional
${sudo} apt -y install libjpeg-dev
${sudo} apt -y install libpng-dev
${sudo} apt -y install libtiff-dev
${sudo} apt -y install libsane-dev
${sudo} apt -y install libv4l-dev
${sudo} apt -y install libgphoto2-dev
${sudo} apt -y install libglu1-mesa-dev

# : - tool
${sudo} apt -y install dpkg-dev
${sudo} apt -y install git
${sudo} apt -y install python3
