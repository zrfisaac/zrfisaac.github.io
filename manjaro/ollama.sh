#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.manjaro.ollama : 26.2.17.1

# [ bash ]
user=$(getent passwd 1000 | cut -d: -f1)
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""
${sudo} pacman -S --noconfirm ollama
#yay -S --noconfirm ollama-gui
#yay -S --noconfirm open-webui-no-venv
#yay -S --noconfirm open-webui-git
#${sudo} systemctl enable ollama
#ollama pull llama3.2:3b
