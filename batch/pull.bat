@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion
rem # [ zrfisaac ]

rem # [ about ]
rem # - author : Isaac Caires Santana
rem # . - email : zrfisaac@gmail.com
rem # . - site : zrfisaac.github.io
rem # - version : zrfisaac.batch.pull : 26.5.1.1

rem # [ batch ]

rem # : - begin
echo # - : %~dpnx0
git pull

rem # : - end
echo # . - end
set /p _=
