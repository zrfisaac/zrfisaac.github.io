#!/usr/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# version : zrfisaac.npm.native : 1.0.0

# [ bash ]
command -v sudo >/dev/null 2>&1 && sudo="sudo" || sudo=""
${sudo} npm install -g react 
${sudo} npm install -g react-dom
${sudo} npm install -g react-native-cli
${sudo} npm install -g react-native-web
${sudo} npm install -g @react-native-community/cli
