#!/usr/bin/python
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# version : zrfisaac.python.read.v01 : 1.0.0

# [ python ]

# - libraries
import datetime
import os

# - variable
v_end_error = False
v_end_message = ""

# : - about
print("# [ about ]")
print("# - author : Isaac Caires")
print("# . - email : zrfisaac@gmail.com")
print("# . - site : zrfisaac.github.io")
print("# - version : zrfisaac.python.read.v01 : 1.0.0")
print("")

# : - main
if not v_end_error:
    print("# [ main ]")
    try:
        # : - routine
        print("# - routine")
        _v_file = "about.zrfi"
        if os.path.exists(_v_file):
            with open(_v_file, 'r') as _file:
                for _line in _file:
                    print("# . - : ", _line.strip())
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
