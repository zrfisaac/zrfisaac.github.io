@echo off
setlocal
setlocal enabledelayedexpansion
chcp 65001 >NUL
rem # [ zrfisaac ]

rem # [ about ]
rem # - author : Isaac Caires Santana
rem # - email : zrfisaac@gmail.com
rem # - site : zrfisaac.github.io
rem # - version : zrfisaac.batch.git.long : 25.8.5.1

rem # [ batch ]

rem # : - variable
set v_admin=0
net session >nul 2>&1
if "%errorlevel%" equ "0" set v_admin=1
set v_message=

rem # : - variable
set v_git=git.exe
for /f "delims=" %%i in ('where git.exe 2^>nul') do set v_git=git.exe
if "%v_git%" equ "" (
	set v_git=%v_git% C:\PROGRA~1\Git\cmd\git.exe
	set v_git=%v_git% C:\PROGRA~2\Git\cmd\git.exe
	for %%z in (%v_git%) do (
		if exist %%z (
			set v_git=%%z
		)
	)
	if not exist "%v_git%" set v_git=
)

rem # : - git
echo # [ git ]
if "%v_git%" equ "" (
	echo # - : git not found
) else if "%v_admin%" equ "0" (
	echo # - : run as admin
) else (
	echo # - : execution
	call "%v_git%" config --system core.longpaths true
)
echo.

rem # : - end
echo # [ end ]
set /p _=
