@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion
rem # [ zrfisaac ]

rem # [ about ]
rem # - author : Isaac Caires Santana
rem # . - email : zrfisaac@gmail.com
rem # . - site : zrfisaac.github.io
rem # - version : zrfisaac.batch.sample.csv : 26.5.19.1

rem # [ batch ]

rem # : - config
if exist %~dp0\config.bat call %~dp0\config.bat
if exist %~dp0\_config.bat call %~dp0\_config.bat
if exist %~dp0\_.bat call %~dp0\_.bat

rem # : - begin
echo # - : %~dpnx0

rem # : - csv
echo # . - csv
for /f "skip=1 tokens=1,2,3 delims=," %%a in (base.csv) do (
	set _name=%%a
	set _age=%%b
	set _city=%%c
	echo # . - csv : !_name! - !_age! - !_city!
)

rem # : - end
echo # . - end
set /p _=
