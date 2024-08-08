#!/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io

# [ bash ]

# - config
[ -e "config.sh" ] && source config.sh
[ -e "_config.sh" ] && source _config.sh
[ -e "__config.sh" ] && source __config.sh

# - routine
curl --request POST \
     --url https://sandbox.api.pagseguro.com/accounts \
     --header 'Authorization: ${c_pagbank_token}' \
     --header 'accept: */*' \
     --header 'content-type: application/json' \
     --data '${c_pagbank_json}'
