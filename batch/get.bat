@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion
rem # [ zrfisaac ]

rem # [ about ]
rem # - author : Isaac Caires Santana
rem # . - email : zrfisaac@gmail.com
rem # . - site : zrfisaac.github.io
rem # - version : zrfisaac.batch.get : 26.5.19.1

rem # [ batch ]

rem # : - config
if exist %~dp0\config.bat call %~dp0\config.bat
if exist %~dp0\_config.bat call %~dp0\_config.bat
if exist %~dp0\_.bat call %~dp0\_.bat

rem # : - begin
echo # - : %~dpnx0

rem # . - get
set _target=%~d0\zrfisaac
set _source=https://github.com/zrfisaac/zrfisaac.github.io.git
echo # . - get : %_target%
if not exist "%_target%" git clone %_source% %_target%

rem # : - end
echo # . - end
set /p _=
