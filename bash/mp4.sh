#!/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.web.bash.mp4 : 0.0.1

# [ bash ]
for _file in *.avi *.mkv *.mpeg
do
	if [ "$_file" != "*.avi" ] && [ "$_file" != "*.mkv" ] && [ "$_file" != "*.mpeg" ]
	then
		if [ ! -e "$_name.mp4" ]
		then
			echo "# - routine : $file"
			ffmpeg -i "$_file" "$_name.mp4"
		fi
    fi
done
