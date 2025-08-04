@echo off
setlocal
setlocal enabledelayedexpansion
chcp 65001 >NUL
rem # [ zrfisaac ]

rem # [ about ]
rem # - author : Isaac Caires Santana
rem # - email : zrfisaac@gmail.com
rem # - site : zrfisaac.github.io
rem # - version : zrfisaac.batch.read : 25.8.4.1

rem # [ batch ]

rem # : - read
echo # [ read ]
set _file=state.txt
echo # - file : %~dpx0\%_file%
for /f "usebackq delims=" %%z in ("%_file%") do (
    echo # . - : %%z
)
echo.

rem # : - end
echo # [ end ]
set /p _=
