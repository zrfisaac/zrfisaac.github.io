@echo off
setlocal enabledelayedexpansion
chcp 65001 >nul
rem [ zrfisaac ]

rem # [ about ]
rem # - author : Isaac Caires Santana
rem # - email : zrfisaac@gmail.com
rem # - site : zrfisaac.github.io
rem # - version : zrfisaac.batch.for.file : 25.10.15.1

rem # [ batch ]
for /r %%z in (*.*) do (
	echo %%z
)
set /p _end=
echo.
