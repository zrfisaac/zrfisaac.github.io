@echo off
setlocal enabledelayedexpansion
rem # [ zrfisaac ]

rem # [ about ]
rem # - author : Isaac Caires Santana
rem # . - email : zrfisaac@gmail.com
rem # . - site : zrfisaac.github.io
rem # version : zrfisaac.batch.reg.read : 0.0.1

rem # [ batch ]
for /f "tokens=2,*" %%a in ('reg query "HKEY_CURRENT_USER\ZRFISAAC" /v Site 2^>nul ^| findstr Site') do set "value=%%b"
echo # - value : %value%
echo [ end ]
set /p _end=
echo.
