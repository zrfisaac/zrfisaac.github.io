#!/usr/bin/python
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.python.csv : 25.7.6.1

# [ python ]

# - library
import csv
import platform

# - function
def fn_strip(_p_value):
	if _p_value is None:
		return ''
	else:
		return _p_value.strip()

# - routine
with open('data-csv.csv', newline='', encoding='utf-8') as _file:
	_csv = csv.DictReader(_file)
	for _row in _csv:
		if len(_row) >= 2:
			_value = list(_row.values())
			if not _value[0] is None and not _value[1] is None:
				print(fn_strip(_value[0]),fn_strip(_value[1]))

# - end
if platform.system() == 'Windows':
    input("")
