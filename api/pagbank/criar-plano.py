#!/usr/bin/python
# : https://developer.pagbank.com.br/reference/criar-plano
#python -m pip install requests
import os
import requests
_pagbank_token = os.getenv('g_pagbank_token')

url = "https://sandbox.api.assinaturas.pagseguro.com/plans"

payload = {
    "amount": {
		"currency": "BRL",
		"value": 1000
	},
    "interval": {
        "unit": "MONTH",
        "length": 1
    },
    "name" : "ZRFISAAC",
    "trial": {
        "enabled": False,
        "hold_setup_fee": False
    },
    "payment_method": ["CREDIT_CARD"]
}
headers = {
    "accept": "application/json",
    "Authorization": f"Bearer {_pagbank_token}",
    "content-type": "application/json"
}

response = requests.post(url, json=payload, headers=headers)

print(response.text)
