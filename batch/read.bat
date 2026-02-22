@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion
rem # [ zrfisaac ]

rem # [ about ]
rem # - author : Isaac Caires Santana
rem # . - email : zrfisaac@gmail.com
rem # . - site : zrfisaac.github.io
rem # - version : zrfisaac.batch.read : 26.2.6.1

rem # [ batch ]

rem # : - begin
echo # - : %~dpnx0

rem # : - read
echo # . - read
for /f "usebackq delims=" %%z in ("state.txt") do (
    set "_line=%%z"
	echo # . - read : !_line!
)

rem # : - end
echo # . - end
set /p _=
