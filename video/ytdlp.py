#!/usr/bin/python
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# version : zrfisaac.python.ytdlp : 1.0.2

# [ python ]

# - libraries
import datetime
import os
import re
import subprocess

# - variable
v_config_file = [
	"__.zrfi",
	"_.zrfi",
	"__about.zrfi",
	"__about.classified.zrfi",
	"__about.private.zrfi",
	"_about.zrfi",
	"_about.classified.zrfi",
	"_about.private.zrfi",
	"about.zrfi",
	"about.classified.zrfi",
	"about.private.zrfi"
]
v_end_error = False
v_end_message = ""

# - variable
v_pattern_group = r"# \[ (.*?) \]"
v_pattern_name = r"# - : ([^\s]+)"
v_pattern_value = r"# . - : ([^\s]+)"

# : - about
print("# [ about ]")
print("# - author : Isaac Caires")
print("# . - email : zrfisaac@gmail.com")
print("# . - site : zrfisaac.github.io")
print("# - version : zrfisaac.python.ytdlp : 1.0.1")
print("")

# : - function - fn_filename
def fn_filename():
    for _vi0 in range(1, 10000):  # Arbitrary limit for filenames
        _filename = f"{_vi0:04}.mp4"
        if not os.path.exists(_filename):
            return _filename

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
					_section = ""
					for _line in _file:
						_line = _line.strip()
						_section_match = re.match(v_pattern_group, _line)
						if _section_match:
							_section = _section_match.group(1).lower()
						else:
							_section_match = ""
						if (_section == "video"):
							if (_line.startswith("http")):
								_value = _line
							else:
								_value = ""
							if _value:
								_name = fn_filename()
								if os.path.exists("cookies.txt"):
									subprocess.run([
										"yt-dlp",
										"-f",
										"bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best",
										"--cookies",
										"cookies.txt",
										"-o",
										_name,
										_value
									])
								else:
									subprocess.run([
										"yt-dlp",
										"-f",
										"bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best",
										"-o",
										_name,
										_value
									])
						elif (_section == "list"):
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
										if os.path.exists("cookies.txt"):
											subprocess.run([
												"yt-dlp",
												"-f",
												"bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best",
												"--cookies",
												"cookies.txt",
												"-o",
												_name,
												_value
											])
										else:
											subprocess.run([
												"yt-dlp",
												"-f",
												"bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best",
												"-o",
												_name,
												_value
											])
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
input("")
