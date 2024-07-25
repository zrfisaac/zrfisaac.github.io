#!/usr/bin/bash
# : https://developer.pagbank.com.br/reference/listar-planos
_pagbank_token="${g_pagbank_token}"
curl --request GET \
     --url https://sandbox.api.assinaturas.pagseguro.com/plans \
     --header "Authorization: Bearer ${_pagbank_token}" \
     --header "accept: application/json"
