#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.get.bde : 26.10.11.1

# [ bash ]

# - variable
set -euo pipefail
v_url="https://github.com/zrfisaac/install.bde/releases/download/v26.6.3.1/bde_26.6.3.1.exe"
v_file="bde_26.6.3.1.exe"

# - download
echo "# . - download"
if command -v curl >/dev/null 2>&1; then
    curl -fL -o "$v_file" "$v_url"
elif command -v wget >/dev/null 2>&1; then
    wget -O "$v_file" "$v_url"
else
    echo "curl or wget required."
    exit 1
fi

# - end
echo "# . - end"
