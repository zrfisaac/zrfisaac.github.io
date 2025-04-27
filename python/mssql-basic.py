#!/usr/bin/python
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.python.mssql.basic : 3.2.8

# [ install ]

# - : pip install pyodbc

# [ python ]

# - libraries
import json
from pathlib import Path
import pyodbc

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
        # : - connection
        print("# - connection")
        _connection = ""
        if v_config["active-directory"] == "":
            _connection = (
                f'DRIVER={{{v_config["driver"]}}};'
                f'SERVER={v_config["server"]};'
                f'DATABASE={v_config["database"]};'
                f'UID={v_config["user"]};'
                f'PWD={v_config["password"]};'
                f'Trusted_Connection=no;'
            )
        else:
            _connection = (
                f'DRIVER={{{v_config["driver"]}}};'
                f'SERVER={v_config["server"]};'
                f'Trusted_Connection=yes;'
            )
        _odbc = pyodbc.connect(_connection)

        # : - cursor
        print("# - cursor")
        _cursor = _odbc.cursor()
        _script = (
            f"\n SELECT 1 AS CL_ID,'AIKO' AS CL_NAME"
            f"\n UNION ALL"
            f"\n SELECT 2 AS CL_ID,'NARA' AS CL_NAME"
            f"\n UNION ALL"
            f"\n SELECT 3 AS CL_ID,'YUMI' AS CL_NAME"
        )
        _cursor.execute(_script)
        _result = _cursor.fetchall()

        # : - result
        if _result:
            print("# - result")
            for CL_ID,CL_NAME in _result:
                print(f'# . - {CL_ID} : {CL_NAME}')

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
