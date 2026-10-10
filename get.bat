@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion
rem # [ zrfisaac ]

rem # [ about ]
rem # - author : Isaac Caires Santana
rem # . - email : zrfisaac@gmail.com
rem # . - site : zrfisaac.github.io
rem # - version : zrfisaac.batch.get : 26.8.30.3

rem # [ batch ]

rem # : - config
if exist %~dp0\config.bat call %~dp0\config.bat
if exist %~dp0\_config.bat call %~dp0\_config.bat
if exist %~dp0\_.bat call %~dp0\_.bat

rem # : - begin
echo # - : %~dpnx0

rem # : - begin
echo # . - get
git clone "https://github.com/zrfisaac/zrfisaac.github.io.git" "%~d0\zrfisaac" >nul 2>&1

rem # : - end
echo # . - end
set /p _=
