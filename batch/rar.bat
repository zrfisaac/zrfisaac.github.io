@echo off
setlocal enabledelayedexpansion
REM [ zrfisaac ]

REM [ about ]
REM - author : Isaac Caires Santana
REM . - email : zrfisaac@gmail.com
REM . - site : zrfisaac.github.io
REM version : zrfisaac.batch.rar : 0.0.1

REM [ batch ]
set shell=
if not exist "%shell%" set "shell=C:\Program Files\7-Zip\7z.exe"
for %%z in (*.rar) do (
	echo %shell%
	call "%shell%" x "%cd%\%%z"
)
pause
