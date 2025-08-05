@echo off
setlocal
setlocal enabledelayedexpansion
chcp 65001 >NUL
rem # [ zrfisaac ]

rem # [ about ]
rem # - author : Isaac Caires Santana
rem # - email : zrfisaac@gmail.com
rem # - site : zrfisaac.github.io
rem # - version : zrfisaac.batch.git : 25.8.5.1

rem # [ batch ]

rem # : - variable
set v_file=%~dp0\about.zrfi

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

rem # : - variable
set v_admin=0
net session >nul 2>&1
if "%errorlevel%" equ "0" set v_admin=1
set v_message=

rem # : - git
echo # [ git ]
if "%v_git%" equ "" (
	echo # - : git not found
) else (
	set _cut=
	set _read=
	set _section=
	set _source=
	set _target=
	for /f "usebackq delims=" %%z in ("%v_file%") do (
		set _source=
		set _cut=%%z
		set _cut=!_cut:~0,4!
		if "!_cut!" equ "# [ " (
			set _read=%%z
			set _section=!_read:~4,-2!
		)
		set _cut=%%z
		set _cut=!_cut:~0,6!
		if "!_cut!" equ "# - : " (
			set _read=%%z
			set _target=!_read:~6!
			set _target=!_target:/=\!
		)
		set _cut=%%z
		set _cut=!_cut:~0,8!
		if "!_cut!" equ "# . - : " (
			set _read=%%z
			set _source=!_read:~8!
		)
		if "!_section!" equ "git" if "!_source!" neq "" if not exist "!_target!" (
			echo # - : !_target!
			call "%v_git%" clone "!_source!" "!_target!"
		)
	)
)
echo.

rem # : - end
echo # [ end ]
set /p _=
