#!/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.bash.png : 26.2.17.1

# [ bash ]

# : - begin
echo "# - : $(realpath "$0")"

# : - png
find . -type f \( -name "*.bmp" -o -name "*.jpeg" -o -name "*.jpg" -o -name "*.webp" \) | while read -r _file
do
	if [ -f "${_file}" ]
	then
		echo "# . - png : ${_file}"
		ffmpeg -i ${_file} ${_file%.*}.png
		[ -f "${_file}" ] && rm -rf "${_file}"
	fi
done

# : - end
echo "# . - end"
#read -p "" _
