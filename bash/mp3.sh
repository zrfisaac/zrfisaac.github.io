#!/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.web.bash.mp3 : 0.0.1

# [ bash ]
for _file in *.aiff *.ogg *.wav
do
	if [ "$_file" != "*.aiff" ] && [ "$_file" != "*.ogg" ] && [ "$_file" != "*.wav" ]
	then
		if [ ! -e "$_name.mp3" ]
		then
			echo "# - routine : $file"
			ffmpeg -i "$_file" "$_name.mp3"
		fi
    fi
done
