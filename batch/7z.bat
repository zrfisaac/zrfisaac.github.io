@echo off
setlocal enabledelayedexpansion
rem # [ zrfisaac ]

rem # [ about ]
rem # - author : Isaac Caires Santana
rem # . - email : zrfisaac@gmail.com
rem # . - site : zrfisaac.github.io
rem # version : zrfisaac.batch.rar : 26.2.23.1

rem # [ batch ]
set shell=
if not exist "%shell%" set "shell=C:\Program Files\7-Zip\7z.exe"
for %%z in (*.rar;*.zip) do (
	echo %shell%
	call "%shell%" x "%cd%\%%z"
)
pause
