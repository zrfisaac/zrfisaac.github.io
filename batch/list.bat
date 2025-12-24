@echo off
setlocal
setlocal enabledelayedexpansion
chcp 65001 >NUL
rem # [ zrfisaac ]

rem # [ about ]
rem # - author : Isaac Caires Santana
rem # - email : zrfisaac@gmail.com
rem # - site : zrfisaac.github.io
rem # - version : zrfisaac.batch.list : 25.8.4.1

rem # [ batch ]

rem # : - list
echo # [ list ]
for /r %%z in (*.*) do (
    echo # . - : %%z
)
echo.

rem # : - end
echo # [ end ]
set /p _=
