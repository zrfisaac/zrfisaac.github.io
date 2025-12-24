@echo off
setlocal
setlocal enabledelayedexpansion
chcp 65001 >NUL
rem # [ zrfisaac ]

rem # [ about ]
rem # - author : Isaac Caires Santana
rem # - email : zrfisaac@gmail.com
rem # - site : zrfisaac.github.io
rem # - version : zrfisaac.batch.count : 25.8.4.1

rem # [ batch ]

rem # : - count
echo # [ count ]
for /l %%z in (1,1,10) do (
	echo # - : %%z
)
echo.

rem # : - end
echo # [ end ]
set /p _=
