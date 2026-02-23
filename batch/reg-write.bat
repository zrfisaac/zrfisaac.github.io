@echo off
setlocal enabledelayedexpansion
REM [ zrfisaac ]

REM [ about ]
REM - author : Isaac Caires Santana
REM . - email : zrfisaac@gmail.com
REM . - site : zrfisaac.github.io
REM version : zrfisaac.batch.reg.write : 26.2.23.1

REM [ batch ]
reg add "HKEY_CURRENT_USER\ZRFISAAC" /v Site /t REG_SZ /d "https://zrfisaac.github.io" /f
echo [ end ]
set /p _end=
echo.
