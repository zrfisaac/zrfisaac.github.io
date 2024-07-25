#!/usr/bin/python
# : https://developer.pagbank.com.br/reference/listar-planos
#python -m pip install requests
import os
import requests
_pagbank_token = os.getenv('g_pagbank_token')

url = "https://sandbox.api.assinaturas.pagseguro.com/plans"

headers = {
    "accept": "application/json",
    "Authorization": f"Bearer {_pagbank_token}"
}

response = requests.get(url, headers=headers)

print(response.text)
