#!/usr/bin/python
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# - version : zrfisaac.python.mssql.backup.all : 3.2.0

# [ install ]

# - : pip install pyodbc

# [ python ]

# - libraries
import json
from pathlib import Path
import pyodbc
import os
import shutil

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
                f'DATABASE={v_config["database"]};'
                f'Trusted_Connection=yes;'
            )
        _odbc = pyodbc.connect(_connection)

        # : - clean
        print("# - clean")
        _path = Path('_')
        if (_path):
            if _path.exists() and _path.is_dir():
                shutil.rmtree(_path)

        # : - column
        _path = Path('mssql-backup.column.sql')
        if (_path):
            if (_path.exists()):
                print("# - column")
                _single = None
                with open(_path, 'r') as _file:
                    _single = _file.read()
                if (_single):
                    _cursor = _odbc.cursor()
                    _cursor.execute(_single)
                    _result = _cursor.fetchall()
                if _result:
                    for DATABASE,TABLE,COLUMN,SCRIPT in _result:
                        print(f'# - column - : {DATABASE} - {TABLE} - {COLUMN}')
                        _folder = f'_\\{DATABASE}\\02-column'
                        _target = f'{_folder}\\{TABLE}.sql'
                        _path = Path(_target)
                        os.makedirs(_folder, exist_ok=True)
                        with _path.open('a') as _file:
                            _file.write(f'-- # : {DATABASE} - {TABLE} - {COLUMN}')
                            _file.write(f'{SCRIPT}\n\n')

        # : - procedure
        _path = Path('mssql-backup.procedure.sql')
        if (_path):
            if (_path.exists()):
                print("# - procedure")
                _single = None
                with open(_path, 'r') as _file:
                    _single = _file.read()
                if (_single):
                    _cursor = _odbc.cursor()
                    _cursor.execute(_single)
                    _result = _cursor.fetchall()
                if _result:
                    for DATABASE,PROCEDURE in _result:
                        print(f'# - procedure - : {DATABASE} - {PROCEDURE}')
                        try:
                            __new = True
                            __file = None
                            __folder = f'_\\{DATABASE}\\08-procedure'
                            __target = f'{__folder}\\{PROCEDURE}.sql'
                            __path = Path(__target)
                            os.makedirs(__folder, exist_ok=True)
                            __connection = _connection.replace(f'DATABASE={v_config["database"]};', f'DATABASE={DATABASE};')
                            __odbc = pyodbc.connect(__connection)
                            __cursor = __odbc.cursor()
                            __cursor.execute(f'exec dbo.sp_helptext [{PROCEDURE}]')
                            __result = __cursor.fetchall()
                            if __result:
                                for __row in __result:
                                    with __path.open('a') as __file:
                                        if __new:
                                            __file.write(f'IF EXISTS (\n')
                                            __file.write(f'	SELECT TOP 1 NULL\n')
                                            __file.write(f'	FROM SYS.PROCEDURES WITH(NOLOCK)\n')
                                            __file.write(f'	WHERE SYS.PROCEDURES.NAME = \'{PROCEDURE}\'\n')
                                            __file.write(f') DROP PROCEDURE {PROCEDURE}\n')
                                            __file.write(f'GO\n')
                                            __file.write(f'\n')
                                        __file.write(f'{__row[0].rstrip()}\n')
                                        __new = False
                            if __path:
                                with __path.open('a') as __file:
                                    if __file:
                                        __file.write('GO\n')
                                        __file.write('\n')
                        except Exception as _exception:
                            print(str(_exception))
                            pass

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
#input("")
