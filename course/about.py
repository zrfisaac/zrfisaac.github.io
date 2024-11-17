#!/usr/bin/python
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# version : zrfisaac.python.clone : 1.0.2

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
    "about.private.zrfi"
]
v_config_file = [item.replace("about", os.path.splitext(os.path.basename(__file__))[0]) for item in v_config_file]
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
print("# - version : zrfisaac.python.clone : 1.0.2")
print("")

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
                                        #subprocess.run(["git", "clone", _value, _name])
                                        subprocess.run(["git", "clone", "https://github.com/zrfisaac/course.coursera-microsoft-v01.git", "coursera-microsoft-v01"])
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
