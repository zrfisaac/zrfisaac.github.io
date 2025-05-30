#!/usr/bin/python
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.python.config : 3.2.8

# [ python ]

# - libraries
import json
from pathlib import Path

# - config
print("# [ config ]")
v_config = None
v_config_path = None
v_config_list = [""
    ,"__config.json"
    ,"_config.json"
    ,"config.json"
]
for _config in v_config_list:
    if not _config == "":
        if v_config_path is None:
            v_config = None
            v_config_path = Path(_config)
            if v_config_path.exists():
                with open(v_config_path, 'r') as _file:
                    v_config = json.load(_file)
                    print("# - config :",v_config_path)
            else:
                v_config_path = None
print("")

# - variable
v_end_error = False
v_end_message = ""

# : - main
if not v_end_error:
    print("# [ main ]")
    try:
        # : - routine
        print("# - routine")
        print("zrfisaac :", v_config["zrfisaac"])

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
