#!/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.web.bash.vdi : 0.0.1

# [ bash ]
for _file in *.vdi
do
	VBoxManage internalcommands sethduuid "${_file}"
done
