@echo off
setlocal
setlocal enabledelayedexpansion
chcp 65001 >NUL
rem # [ zrfisaac ]

rem # [ about ]
rem # - author : Isaac Caires Santana
rem # - email : zrfisaac@gmail.com
rem # - site : zrfisaac.github.io
rem # - version : zrfisaac.batch.choco : 25.8.7.1

rem # [ batch ]

rem # : - config - chocolatey
set c_chocolatey=
set c_chocolatey=!c_chocolatey! ffmpeg
set c_chocolatey=!c_chocolatey! youtube-dl
set c_chocolatey=!c_chocolatey! yt-dlp
set c_chocolatey=!c_chocolatey! imagemagick

rem # : - variable
set v_message=
set v_admin=0
net session >nul 2>&1
if "%errorlevel%" equ "0" set v_admin=1
set v_message=

rem # : - git
echo # [ git ]

rem # : - chocolatey
if "%v_admin%" neq "0" if "!v_message!" equ "" if not exist "C:\ProgramData\chocolatey" (
	echo # - chocolatey
	PowerShell -command "Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))"
	if exist "C:\ProgramData\chocolatey" set v_message=run again
)

rem # : - package
if "%v_admin%" neq "0" if "!v_message!" equ "" (
	echo # - package
	for %%z in (%c_chocolatey%) do (
		if not exist "C:\ProgramData\chocolatey\lib\%%z" (
			echo # - package : %%z
			choco install %%z --force --force-dependencies --confirm --ignore-checksums
		)
	)
)

rem # : - message
if "%v_admin%" equ "0" if "!v_message!" equ "" (
	echo # - message
	set v_message=run as admin
)
echo.

rem # : - end
echo # [ end ]
if "!v_message!" neq "" echo # - : !v_message!
set /p _=
