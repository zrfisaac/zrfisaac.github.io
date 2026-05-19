@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion
rem # [ zrfisaac ]

rem # [ about ]
rem # - author : Isaac Caires Santana
rem # . - email : zrfisaac@gmail.com
rem # . - site : zrfisaac.github.io
rem # - version : zrfisaac.batch.mssql : 26.5.19.1

rem # [ batch ]

rem # : - config
if exist %~dp0\config.bat call %~dp0\config.bat
if exist %~dp0\_config.bat call %~dp0\_config.bat
if exist %~dp0\_.bat call %~dp0\_.bat

rem # - config - mssql
set c_mssql_local=%~0
set c_mssql_shell=SQLCMD.exe
set c_mssql_server=localhost
set c_mssql_user=sa
set c_mssql_password=1234
set c_mssql_database=DEBUG

rem # : - begin
echo # - : %~dpnx0

rem # : - database
echo # . - database
set _script=
set _script=!_script! IF DB_ID^('P_DATABASE'^) IS NULL CREATE DATABASE [P_DATABASE]
for %%a in (!c_mssql_database!) do set "_script=!_script:P_DATABASE=%%a!"
call !c_mssql_shell! -C -S "!c_mssql_server!" -U "!c_mssql_user!" -P "!c_mssql_password!" -Q "!_script!" -r1 > nul

rem # : - script
echo # . - script
for /r %%z in (*.sql) do (
	echo # . - script : %%z
	call "!c_mssql_shell!" -C -S "!c_mssql_server!" -U "!c_mssql_user!" -P "!c_mssql_password!" -d "!c_mssql_database!" -i "%%z" -r1 > nul
)

rem # : - end
echo # . - end
set /p _=
