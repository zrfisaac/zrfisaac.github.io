@echo off
setlocal enabledelayedexpansion
rem # [ zrfisaac ]

rem # [ about ]
rem # - author : Isaac Caires Santana
rem # . - email : zrfisaac@gmail.com
rem # . - site : zrfisaac.github.io
rem # version : zrfisaac.batch.reg.write : 0.0.1

rem # [ batch ]
reg add "HKEY_CURRENT_USER\ZRFISAAC" /v Site /t REG_SZ /d "https://zrfisaac.github.io" /f
echo [ end ]
set /p _end=
echo.
