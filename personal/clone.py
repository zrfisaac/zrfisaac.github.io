#!/usr/bin/python
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.python.clone : 0.0.1

# [ python ]

# - libraries
import datetime
import os
import re
import subprocess

# - variable
v_config_file = [
	"__about.zrfi",
	"__about.classified.zrfi",
	"__about.private.zrfi",
	"_about.zrfi",
	"_about.classified.zrfi",
	"_about.private.zrfi",
	"about.zrfi",
	"about.classified.zrfi",
	"about.private.zrfi",
	"__clone.zrfi",
	"__clone.classified.zrfi",
	"__clone.private.zrfi",
	"_clone.zrfi",
	"_clone.classified.zrfi",
	"_clone.private.zrfi",
	"clone.zrfi",
	"clone.classified.zrfi",
	"clone.private.zrfi"
]
v_config_file = [item.replace("clone", os.path.splitext(os.path.basename(__file__))[0]) for item in v_config_file]
v_end_error = False
v_end_message = ""

# - variable
v_pattern_group = r"# \[ (.*?) \]"
v_pattern_name = r"# - : ([^\s]+)"
v_pattern_value = r"# . - : ([^\s]+)"

# : - main
if not v_end_error:
	print("# [ main ]")
	try:
		# : - routine
		print("# - routine")
		for _config in v_config_file:
			if os.path.exists(_config):
				with open(_config, 'r') as _file:
					_list = False
					_name = ""
					_value = ""
					for _line in _file:
						_line = _line.strip()
						_group = re.findall(v_pattern_group, _line)
						if len(_group) > 0:
							_list = False
							_group = _group[0]
							if _group.lower() == "list":
								_list = True
						else:
							_group = ""
						if _list:
							_match = re.match(v_pattern_name, _line)
							if _match:
								_name = ""
								_value = ""
								if _match.group(1):
									_name = _match.group(1)
							_match = re.match(v_pattern_value, _line)
							if _match:
								if _match.group(1):
									_value = _match.group(1)
									if not os.path.exists(_name):
										print("# . - :", _name)
										subprocess.run(["git", "clone", _value, _name])
	except Exception as _exception:
		v_end_error = True
		v_end_message = str(_exception)
	print("")

# : - end
print("# [ end ]")
if v_end_error:
	print("# - error")
else:
	print("# - success")
if v_end_message != "":
	print("# . - message : " + v_end_message)
