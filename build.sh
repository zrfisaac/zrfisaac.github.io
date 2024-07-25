#!/bin/bash
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.gihub.io.build : 0.0.1

# [ bash ]

# : - variable
_locale="$(pwd)/locale"
_path="$(pwd)"
_source="$(pwd)/source"

# : - build
for _folder in $_locale/*
do
	# : - title
	echo "# - $_lang"

	# : - variable
	_lang=$(basename "$_folder")
	_target=$_path/$_lang

	# : - copy
	echo "# . - copy"
	find "$_source" -type f | while read -r _html
	do
		_code="${_html#$_source/}"
		cp -rf "$_html" "$_target/$_code"
	done

	# : - replace
	echo "# . - replace"
	for _file in $_folder/*
	do
		if [ -f $_file ]
		then
			while IFS="" read -r _line || [ -n "${_line}" ]
			do
				_name=$(echo "$_line" | awk -F'\t' '{print $1}')
				_text=$(echo "$_line" | awk -F'\t' '{sub(/^[^\t]+\t/, ""); print}')
				_text=$(echo "$_text" | sed 's/^[ \t]*//')
				#echo ". . - name : $_name"
				#echo ". . - text : $_text"
				#find "$_target" -type f | while read -r _html; do sed -i "s/$_name/$_text/g" "$_html"; done
				find "$_target" -type f | while read -r _html; do sed -i "s/$(printf '%s\n' "$_name" | sed 's/[\/&]/\\&/g')/$(printf '%s\n' "$_text" | sed 's/[\/&]/\\&/g')/g" "$_html"; done
			done < $_file
		fi
	done
done
