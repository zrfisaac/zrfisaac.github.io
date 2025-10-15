@echo off
setlocal enabledelayedexpansion
chcp 65001 >nul
rem [ zrfisaac ]

rem # [ about ]
rem # - author : Isaac Caires Santana
rem # - email : zrfisaac@gmail.com
rem # - site : zrfisaac.github.io
rem # - version : zrfisaac.batch.variable.replace : 25.10.15.1

rem # [ batch ]
set v_name=One Two Three
set v_name=%v_name:One=Isaac%
set v_name=%v_name:Two=Caires%
set v_name=%v_name:Three=Santana%
echo %v_name%
set /p _end=
echo.
