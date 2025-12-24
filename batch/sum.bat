@echo off
setlocal
setlocal enabledelayedexpansion
chcp 65001 >NUL
rem # [ zrfisaac ]

rem # [ about ]
rem # - author : Isaac Caires Santana
rem # - email : zrfisaac@gmail.com
rem # - site : zrfisaac.github.io
rem # - version : zrfisaac.batch.sum : 25.8.4.1

rem # [ batch ]

rem # : - sum
echo # [ sum ]
set /a _a=10
set /a _b=7
set /a _result=%_a% + %_b%
echo # - : %_a% + %_b% = %_result%
echo.

rem # : - end
echo # [ end ]
set /p _=
