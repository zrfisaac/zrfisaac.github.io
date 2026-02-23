@echo off
setlocal enabledelayedexpansion
REM [ zrfisaac ]

REM [ about ]
REM - author : Isaac Caires Santana
REM . - email : zrfisaac@gmail.com
REM . - site : zrfisaac.github.io
REM version : zrfisaac.batch.reg.read : 26.2.23.1

REM [ batch ]
for /f "tokens=2,*" %%a in ('reg query "HKEY_CURRENT_USER\ZRFISAAC" /v Site 2^>nul ^| findstr Site') do set "value=%%b"
echo # - value : %value%
echo [ end ]
set /p _end=
echo.
