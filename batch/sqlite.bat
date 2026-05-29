@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion
rem # [ zrfisaac ]

rem # [ about ]
rem # - author : Isaac Caires Santana
rem # . - email : zrfisaac@gmail.com
rem # . - site : zrfisaac.github.io
rem # - version : zrfisaac.batch.sqlite : 26.5.19.1

rem # [ batch ]

rem # : - config
set c_sqlite_database=_.db

rem # : - config - chocolatey
set c_chocolatey=
set c_chocolatey=!c_chocolatey! sqlite

rem # : - config
if exist %~dp0\config.bat call %~dp0\config.bat
if exist %~dp0\_config.bat call %~dp0\_config.bat
if exist %~dp0\_.bat call %~dp0\_.bat

rem # : - variable
set v_about=%~dp0\about.zrfi

rem # : - variable
set v_sqlite=sqlite.exe
for /f "delims=" %%i in ('where sqlite.exe 2^>nul') do set v_sqlite=sqlite.exe
for /f "delims=" %%i in ('where sqlite3.exe 2^>nul') do set v_sqlite=sqlite3.exe
if "%v_sqlite%" equ "" (
	set v_sqlite=%v_sqlite% C:\ProgramData\chocolatey\bin\sqlite.exe
	for %%z in (%v_sqlite%) do (
		if exist %%z (
			set v_sqlite=%%z
		)
	)
	if not exist "%v_sqlite%" set v_sqlite=
)

rem # : - variable
set v_message=
set v_administrator=0
net session >nul 2>&1
if "%errorlevel%" equ "0" set v_administrator=1
set v_message=

rem # : - begin
echo # - : %~dpnx0

rem # : - chocolatey
if "%v_administrator%" neq "0" if "!v_message!" equ "" if not exist "C:\ProgramData\chocolatey" (
	echo # . - chocolatey
	PowerShell -command "Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))"
	if exist "C:\ProgramData\chocolatey" set v_message=execute novamente
)

rem # : - package
if "%v_administrator%" neq "0" if "!v_message!" equ "" (
	echo # . - package
	for %%z in (%c_chocolatey%) do (
		if not exist "C:\ProgramData\chocolatey\lib\%%z" (
			echo # . - package : %%z
			choco install %%z --force --force-dependencies --confirm --ignore-checksums
		)
	)
)

rem # : - database
if "%v_administrator%" equ "0" if "!v_message!" equ "" (
	if "%v_sqlite%" equ "" (
		set v_message=sqlite not found
	) else (
		echo # . - database
		if not exist "!c_sqlite_database!" "%v_sqlite%" "!c_sqlite_database!" "SELECT 1;" > nul
	)
)

rem # : - script
if "%v_administrator%" equ "0" if "!v_message!" equ "" (
	if "%v_sqlite%" equ "" (
		set v_message=sqlite not found
	) else (
		echo # . - script
		for /r %%z in (*.sql) do (
			echo # . - script : %%z
			"%v_sqlite%" "!c_sqlite_database!" < "%%z"
		)
	)
)

rem # : - end
if "!v_message!" neq "" (
	echo # . - end : !v_message!
) else (
	echo # . - end
)
set /p _=
