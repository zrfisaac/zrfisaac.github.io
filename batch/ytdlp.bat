@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion
rem # [ zrfisaac ]

rem # [ about ]
rem # - author : Isaac Caires Santana
rem # . - email : zrfisaac@gmail.com
rem # . - site : zrfisaac.github.io
rem # - version : zrfisaac.batch.ytdlp : 26.5.19.1

rem # [ batch ]

rem # : - config - chocolatey
set c_chocolatey=
set c_chocolatey=!c_chocolatey! ffmpeg
set c_chocolatey=!c_chocolatey! youtube-dl
set c_chocolatey=!c_chocolatey! yt-dlp
set c_chocolatey=!c_chocolatey! imagemagick

rem # : - config
if exist %~dp0\config.bat call %~dp0\config.bat
if exist %~dp0\_config.bat call %~dp0\_config.bat
if exist %~dp0\_.bat call %~dp0\_.bat

rem # : - variable
set v_about=%~dp0\about.zrfi

rem # : - variable
set v_ytdlp=yt-dlp.exe
for /f "delims=" %%i in ('where yt-dlp.exe 2^>nul') do set v_ytdlp=yt-dlp.exe
if "%v_ytdlp%" equ "" (
	set v_ytdlp=%v_ytdlp% C:\ProgramData\chocolatey\bin\yt-dlp.exe
	for %%z in (%v_ytdlp%) do (
		if exist %%z (
			set v_ytdlp=%%z
		)
	)
	if not exist "%v_ytdlp%" set v_ytdlp=
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

rem # : - ytdlp
if "%v_administrator%" equ "0" if "!v_message!" equ "" (
	echo # . - ytdlp
	if not exist "%v_about%" (
		echo # . - ytdlp - : about not found
	) else if "%v_ytdlp%" equ "" (
		echo # . - ytdlp - : ytdlp not found
	) else (
		set _corte=
		set _read=
		set _section=
		set _source=
		set _target=
		for /f "usebackq delims=" %%z in ("%v_about%") do (
			set _source=
			set _corte=%%z
			set _corte=!_corte:~0,4!
			if "!_corte!" equ "# [ " (
				set _read=%%z
				set _section=!_read:~4,-2!
			)
			set _corte=%%z
			set _corte=!_corte:~0,6!
			if "!_corte!" equ "# - : " (
				set _read=%%z
				set _target=!_read:~6!
				set _target=!_target:/=\!
			)
			set _corte=%%z
			set _corte=!_corte:~0,8!
			if "!_corte!" equ "# . - : " (
				set _read=%%z
				set _source=!_read:~8!
			)
			if "!_section!" equ "video" if "!_source!" neq "" if not exist "!_target!" (
				echo # . - ytdlp : !_target!
				if exist "cookies.txt" (
					call "%v_ytdlp%" -f "bv*[height^<=760]+ba/b[height^<=760]" --cookies cookies.txt -o "!_target!" "!_source!"
				) else (
					call "%v_ytdlp%" -f "bv*[height^<=760]+ba/b[height^<=760]" -o "!_target!" "!_source!"
				)
			)
			if "!_section!" equ "music" if "!_source!" neq "" if not exist "!_target!" (
				echo # . - : ytdlp !_target!
				if exist "cookies.txt" (
					call "%v_ytdlp%" -f bestaudio --extract-audio --audio-format mp3 --cookies cookies.txt -o "!_target!" "!_source!"
				) else (
					call "%v_ytdlp%" -f bestaudio --extract-audio --audio-format mp3 -o "!_target!" "!_source!"
				)
			)
		)
	)
)

rem # : - end
echo # . - end
if "!v_message!" neq "" echo # . . - : !v_message!
set /p _=
