#!/usr/bin/python
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires Santana
# . - email : zrfisaac@gmail.com
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
    ,"_.json"
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

        # : - column : 02
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
                    for CL_DATABASE,CL_TABLE,CL_COLUMN,CL_TYPE,CL_SIZE,CL_NULL,CL_DEFAULT,CL_ORDER in _result:
                        print(f'# - column - : {CL_DATABASE} - {CL_TABLE} - {CL_COLUMN}')
                        _folder = f'_\\{CL_DATABASE}\\02-Campo'
                        _target = f'{_folder}\\{CL_TABLE}.sql'
                        _path = Path(_target)
                        os.makedirs(_folder, exist_ok=True)
                        with _path.open('a') as _file:
                            _file.write(f'-- # : {CL_DATABASE} - {CL_TABLE} - {CL_COLUMN}\n')
                            _file.write(f'IF NOT EXISTS(SELECT TOP 1 NULL FROM INFORMATION_SCHEMA.TABLES WITH(NOLOCK) WHERE TABLE_NAME = \'{CL_TABLE}\')\n')
                            _file.write(f'CREATE TABLE [{CL_TABLE}] ([{CL_COLUMN}] [{CL_TYPE}] {CL_SIZE} {CL_NULL} {CL_DEFAULT})\n')
                            _file.write(f'IF NOT EXISTS(SELECT TOP 1 NULL FROM INFORMATION_SCHEMA.COLUMNS WITH(NOLOCK) WHERE TABLE_NAME = \'{CL_TABLE}\' AND COLUMN_NAME = \'{CL_COLUMN}\')\n')
                            _file.write(f'ALTER TABLE [{CL_TABLE}] ADD [{CL_COLUMN}] [{CL_TYPE}] {CL_SIZE} {CL_NULL} {CL_DEFAULT}\n')
                            _file.write(f'\n')

        # : - view : 04
        _path = Path('mssql-backup.view.sql')
        if (_path):
            if (_path.exists()):
                print("# - view")
                _single = None
                with open(_path, 'r') as _file:
                    _single = _file.read()
                if (_single):
                    _cursor = _odbc.cursor()
                    _cursor.execute(_single)
                    _result = _cursor.fetchall()
                if _result:
                    for DATABASE,VIEW in _result:
                        print(f'# - view - : {DATABASE} - {VIEW}')
                        try:
                            __new = True
                            __file = None
                            __folder = f'_\\{DATABASE}\\04-View'
                            __target = f'{__folder}\\{VIEW}.sql'
                            __path = Path(__target)
                            os.makedirs(__folder, exist_ok=True)
                            __odbc = pyodbc.connect(_connection)
                            __cursor = __odbc.cursor()
                            __cursor.execute(f'exec dbo.sp_helptext [{VIEW}]')
                            __result = __cursor.fetchall()
                            if __result:
                                for __row in __result:
                                    with __path.open('a') as __file:
                                        if __new:
                                            __file.write(f'IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N\'[dbo].[{VIEW}]\') AND OBJECTPROPERTY(id, N\'IsView\') = 1)\n')
                                            __file.write(f'DROP VIEW {VIEW}\n')
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

        # : - trigger : 09
        _path = Path('mssql-backup.trigger.sql')
        if (_path):
            if (_path.exists()):
                print("# - trigger")
                _single = None
                with open(_path, 'r') as _file:
                    _single = _file.read()
                if (_single):
                    _cursor = _odbc.cursor()
                    _cursor.execute(_single)
                    _result = _cursor.fetchall()
                if _result:
                    for DATABASE,TRIGGER in _result:
                        print(f'# - trigger - : {DATABASE} - {TRIGGER}')
                        try:
                            __new = True
                            __file = None
                            __folder = f'_\\{DATABASE}\\09-Trigger'
                            __target = f'{__folder}\\{TRIGGER}.sql'
                            __path = Path(__target)
                            os.makedirs(__folder, exist_ok=True)
                            __odbc = pyodbc.connect(_connection)
                            __cursor = __odbc.cursor()
                            __cursor.execute(f'exec dbo.sp_helptext [{TRIGGER}]')
                            __result = __cursor.fetchall()
                            if __result:
                                for __row in __result:
                                    with __path.open('a') as __file:
                                        if __new:
                                            __file.write(f'IF  EXISTS (SELECT * FROM sysobjects WHERE id = OBJECT_ID(N\'[dbo].[{TRIGGER}]\'))\n')
                                            __file.write(f'DROP TRIGGER [dbo].[{TRIGGER}]\n')
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

        # : - function : 10
        _path = Path('mssql-backup.function.sql')
        if (_path):
            if (_path.exists()):
                print("# - function")
                _single = None
                with open(_path, 'r') as _file:
                    _single = _file.read()
                if (_single):
                    _cursor = _odbc.cursor()
                    _cursor.execute(_single)
                    _result = _cursor.fetchall()
                if _result:
                    for DATABASE,FUNCTION in _result:
                        print(f'# - function - : {DATABASE} - {FUNCTION}')
                        try:
                            __new = True
                            __file = None
                            __folder = f'_\\{DATABASE}\\10-Funcao'
                            __target = f'{__folder}\\{FUNCTION}.sql'
                            __path = Path(__target)
                            os.makedirs(__folder, exist_ok=True)
                            __odbc = pyodbc.connect(_connection)
                            __cursor = __odbc.cursor()
                            __cursor.execute(f'exec dbo.sp_helptext [{FUNCTION}]')
                            __result = __cursor.fetchall()
                            if __result:
                                for __row in __result:
                                    with __path.open('a') as __file:
                                        if __new:
                                            __file.write(f' IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N\'[dbo].[{FUNCTION}]\') AND xtype in (N\'FN\', N\'IF\', N\'TF\'))\n')
                                            __file.write(f'	DROP FUNCTION [dbo].[{FUNCTION}]\n')
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

        # : - procedure : 11
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
                            __folder = f'_\\{DATABASE}\\11-Procedure'
                            __target = f'{__folder}\\{PROCEDURE}.sql'
                            __path = Path(__target)
                            os.makedirs(__folder, exist_ok=True)
                            __odbc = pyodbc.connect(_connection)
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
