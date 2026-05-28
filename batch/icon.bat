@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion
rem # [ zrfisaac ]

rem # [ about ]
rem # - author : Isaac Caires Santana
rem # . - email : zrfisaac@gmail.com
rem # . - site : zrfisaac.github.io
rem # - version : zrfisaac.batch.icon : 26.5.19.1

rem # [ batch ]

rem # : - begin
echo # - : %~dpnx0
magick "%~n0.png" -define icon:auto-resize=256,128,64,48,32,16 "%~n0.ico"

rem # : - end
echo # . - end
set /p _=
