#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.web.manjaro.geany : 1.0.0

# [ bash ]
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""
${sudo} pacman -S --noconfirm apache
${sudo} pacman -S --noconfirm php
${sudo} pacman -S --noconfirm php-apache
${sudo} systemctl enable httpd
${sudo} systemctl restart httpd
