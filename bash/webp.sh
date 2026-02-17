#!/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.bash.webp : 26.2.17.1

# [ bash ]

# : - begin
echo "# - : $(realpath "$0")"

# : - webp
find . -type f \( -name "*.bmp" -o -name "*.jpeg" -o -name "*.jpg" -o -name "*.png"  -o -name "*.jfif" \) | while read -r _file
do
	if [ -f "${_file}" ]
	then
		echo "# . - webp : ${_file}"
		ffmpeg -i ${_file} ${_file%.*}.webp
		[ -f "${_file}" ] && rm -rf "${_file}"
	fi
done

# : - end
echo "# . - end"
#read -p "" _
