@echo off
setlocal enabledelayedexpansion
REM [ zrfisaac ]

REM [ about ]
REM - author : Isaac Caires Santana
REM . - email : zrfisaac@gmail.com
REM . - site : zrfisaac.github.io
REM version : zrfisaac.batch.reg.delete : 0.0.1

REM [ batch ]
reg delete "HKEY_CURRENT_USER\ZRFISAAC" /v Site /f
reg delete "HKEY_CURRENT_USER\ZRFISAAC" /f
echo [ end ]
set /p _end=
echo.
