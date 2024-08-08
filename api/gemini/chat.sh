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
curl -H 'Content-Type: application/json' \
     -H "x-goog-api-key: ${c_gemini_token}" \
     -d '{"contents":[
            {"role": "user",
              "parts":[{"text": "Give me five subcategories of jazz?"}]}]}' \
     "https://generativelanguage.googleapis.com/v1/models/gemini-pro:generateContent"
