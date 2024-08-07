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

# - config
[ "$c_correios_token" = "" ] && c_correios_token=""

# - routine
curl -X 'POST' \
  'https://api.correios.com.br/token/v1/autentica/contrato' \
  -H 'accept: application/json' \
  -H 'Content-Type: application/json' \
  -H 'Authorization: Basic enJmaXNhYWM6' \
  -d '{
  "numero": "string"
}'
