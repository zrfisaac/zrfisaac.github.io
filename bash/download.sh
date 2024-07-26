#!/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.web.bash.download : 0.0.1

# [ bash ]
_list=$(dirname -- $0)/about.zrfi
if [ -f "${_list}" ]
then
	_download=0
	_file=
	while IFS="" read -r _line || [ -n "${_line}" ]
	do
		[ ${#_line} \> 0 ] && [ "${_download}" == "1" ] && [ "${_line:0:6}" == "# - : " ] && mkdir -p $(dirname -- $0)/$(dirname -- ${_line:6})
		[ ${#_line} \> 0 ] && [ "${_download}" == "1" ] && [ "${_line:0:6}" == "# - : " ] && _file=$(dirname -- $0)/${_line:6}
		[ ${#_line} \> 0 ] && [ "${_download}" == "1" ] && [ "${_line:0:6}" == "# - : " ] && [ ! -f "${_file}" ] && echo "# - : ${_file}"
		[ ${#_line} \> 0 ] && [ "${_download}" == "1" ] && [ "${_line:0:15}" == "# . - yt-dlp : " ] && [ ! -f "${_file}" ] && [ "${_file##*.}" == "mp3" ] && yt-dlp --output "${_file}" --extract-audio --audio-format mp3 "${_line:15}"
		[ ${#_line} \> 0 ] && [ "${_download}" == "1" ] && [ "${_line:0:15}" == "# . - yt-dlp : " ] && [ ! -f "${_file}" ] && [ "${_file##*.}" == "mp4" ] && yt-dlp --format "bestvideo+bestaudio[ext=m4a]/bestvideo+bestaudio/best" --merge-output-format mp4 --output "${_file}" "${_line:15}"
		[ "${_line:0:3}" == "# [" ] && _download=0
		[ "${_line:0:3}" == "# [" ] && _file=
		[ "${_line}" == "# [ download ]" ] && _download=1
	done < ${_list}
fi
