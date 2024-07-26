#!/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.web.bash.rsa : 0.0.1

# [ url ]
# - : https://wiki.archlinux.org/title/Easy-RSA

# [ bash ]

# : - config
c_client="zrfisaac-client"
c_client_key="./pki/private/$c_client.key"
c_client_crt="./pki/private/$c_client.crt"
c_client_csr="./pki/private/$c_client.csr"
c_server="zrfisaac-server"
c_server_key="./pki/private/$c_server.key"
c_server_crt="./pki/private/$c_server.crt"
c_server_csr="./pki/private/$c_server.csr"

# : - config
c_day=365
#c_day=36500
c_country="BR"
c_state="Bahia"
c_city="salvador"
c_name="Isaac Caires"
c_unit="ZI"
c_domain="zrfisaac.github.io"

# : - variable
export EASYRSA=$(pwd)
export EASYRSA_VARS_FILE=/etc/easy-rsa/vars
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""

# : - clean
#[ -d "./pki" ] && rm -rvf ./pki

# : - start
#[ ! -d "./pki" ] && easyrsa init-pki
[ ! -d "./pki" ] && easyrsa --use-algo=ec --curve=secp521r1 --digest=sha512 init-pki

# : - client
[ ! -f "$c_client_key" ] && echo "\n" | easyrsa gen-req $c_client nopass
[ ! -f "$c_client_csr" ] && openssl req -new -key $c_client_key -subj "/C=$c_country/ST=$c_state/L=$c_city/O=$c_name/OU=$c_unit/CN=$c_domain" -out $c_client_csr
[ ! -f "$c_client_crt" ] && openssl x509 -req -days $c_day -in $c_client_csr -signkey $c_client_key -out $c_client_crt

# : - server
[ ! -f "$c_server_key" ] && echo "\n" | easyrsa gen-req $c_server nopass
[ ! -f "$c_server_csr" ] && openssl req -new -key $c_server_key -subj "/C=$c_country/ST=$c_state/L=$c_city/O=$c_name/OU=$c_unit/CN=$c_domain" -out $c_server_csr
[ ! -f "$c_server_crt" ] && openssl x509 -req -days $c_day -in $c_server_csr -signkey $c_server_key -out $c_server_crt

# : - copy
[ -d "./pki" ] && $sudo cp -rvf ./pki/private/$c_client.key /etc/openvpn/client/
[ -d "./pki" ] && $sudo cp -rvf ./pki/private/$c_server.key /etc/openvpn/server/
