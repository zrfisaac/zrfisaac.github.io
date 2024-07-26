#!/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.web.bash.nc.listen : 0.0.1

# [ bash ]
trap "exit" SIGINT
while true; do nc -l -p 15443; done
