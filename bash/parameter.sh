#!/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.web.bash.parameter : 0.0.1

# [ shell ]
# - : sh parameter.sh --color verde --value

# [ bash ]
v_color=""
v_value="0"
_s0=""
_s1=""
for i in "$@"
do
	# : - variable
	_s1="$i"

	# : - color
	[ "$_s0" = "--color" ] && v_color="$_s1"

	# : - value
	[ "$_s1" = "--value" ] && v_value="1"

	# : - variable
	_s0="$i"
done

echo "# - color : ${v_color}"
echo "# - value : ${v_value}"
