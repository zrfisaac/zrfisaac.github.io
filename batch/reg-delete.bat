@echo off
setlocal enabledelayedexpansion
rem # [ zrfisaac ]

rem # [ about ]
rem # - author : Isaac Caires Santana
rem # . - email : zrfisaac@gmail.com
rem # . - site : zrfisaac.github.io
rem # version : zrfisaac.batch.reg.delete : 0.0.1

rem # [ batch ]
reg delete "HKEY_CURRENT_USER\ZRFISAAC" /v Site /f
reg delete "HKEY_CURRENT_USER\ZRFISAAC" /f
echo [ end ]
set /p _end=
echo.
