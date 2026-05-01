@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion
rem # [ zrfisaac ]

rem # [ about ]
rem # - author : Isaac Caires Santana
rem # . - email : zrfisaac@gmail.com
rem # . - site : zrfisaac.github.io
rem # - version : zrfisaac.batch.get : 26.5.1.2

rem # [ batch ]

rem # : - begin
echo # - : %~dpnx0
if not exist "%~d0\zrfisaac" git clone "https://github.com/zrfisaac/zrfisaac.github.io.git" "%~d0\zrfisaac"

rem # : - end
echo # . - end
set /p _=
