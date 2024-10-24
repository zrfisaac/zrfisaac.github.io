#!/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io

# [ bash ]
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""
mkdir -p ./public
mkdir -p ../public
mkdir -p ./webapps
mkdir -p ../webapps
mkdir -p ./webapps/systems
mkdir -p ../webapps/systems
$sudo docker compose -f ../docker-compose.yml -f docker-compose.yml up -d
