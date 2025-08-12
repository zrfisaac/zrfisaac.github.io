@echo off 
setlocal enabledelayedexpansion
rem # [ zrfisaac ]

rem # [ about ]
rem # - author : Isaac Caires Santana
rem # - email : zrfisaac@gmail.com
rem # - site : zrfisaac.github.io
rem # - version : zrfisaac.choco.windows : 25.8.12.1

rem # [ batch ]

rem # : - config
set c_download=
set c_download=%c_download% .
set c_path=%~dp0
set c_path=%c_path:~0,-1%

rem # : - config - chocolatey
set c_chocolatey=
set c_chocolatey=!c_chocolatey! 7zip
set c_chocolatey=!c_chocolatey! googlechrome
set c_chocolatey=!c_chocolatey! notepadplusplus
set c_chocolatey=!c_chocolatey! git
set c_chocolatey=!c_chocolatey! github-desktop
set c_chocolatey=!c_chocolatey! ffmpeg
set c_chocolatey=!c_chocolatey! youtube-dl
set c_chocolatey=!c_chocolatey! yt-dlp
set c_chocolatey=!c_chocolatey! imagemagick
set c_chocolatey=!c_chocolatey! sql-server-2019
set c_chocolatey=!c_chocolatey! sql-server-management-studio
set c_chocolatey=!c_chocolatey! nsis
set c_chocolatey=!c_chocolatey! lazarus
set c_chocolatey=!c_chocolatey! libresprite
set c_chocolatey=!c_chocolatey! inkscape
set c_chocolatey=!c_chocolatey! vlc
set c_chocolatey=!c_chocolatey! retroarch
set c_chocolatey=!c_chocolatey! vscode
set c_chocolatey=!c_chocolatey! anydesk
set c_chocolatey=!c_chocolatey! dbeaver
set c_chocolatey=!c_chocolatey! ventoy
set c_chocolatey=!c_chocolatey! curl
set c_chocolatey=!c_chocolatey! visualstudio2022community
set c_chocolatey=!c_chocolatey! visualstudio2022-workload-netweb
set c_chocolatey=!c_chocolatey! androidstudio
set c_chocolatey=!c_chocolatey! flutter
set c_chocolatey=!c_chocolatey! nodejs
set c_chocolatey=!c_chocolatey! python
set c_chocolatey=!c_chocolatey! imageglass
set c_chocolatey=!c_chocolatey! radmin-vpn
set c_chocolatey=!c_chocolatey! sharex
set c_chocolatey=!c_chocolatey! qbittorrent
set c_chocolatey=!c_chocolatey! audacity
set c_chocolatey=!c_chocolatey! dosbox
set c_chocolatey=!c_chocolatey! virtualbox
set c_chocolatey=!c_chocolatey! sumatrapdf
set c_chocolatey=!c_chocolatey! ollama
set c_chocolatey=!c_chocolatey! godot3

rem # : - special
set s_double_quotes="
set s_single_quotes='
set s_asterisk=*
set s_caret=^^
set s_space= 
set s_equals=^=
set s_greater=^>
set s_plus=+
set s_less=^<
set s_minus=-
set s_percentage=%%
set s_tab=	

rem # : - variable
set v_admin=0
net session >nul 2>&1
if "%errorlevel%" equ "0" set v_admin=1
set v_message=

rem # : - begin
echo # [ begin ]
echo # - source : %~0
echo.

rem # : - main
if "0" equ "0" (
	rem # : - title
	echo # [ main ]

	rem # : - chocolatey
	if "0" equ "0" if "%v_admin%" neq "0" if "!v_message!" equ "" if not exist "C:\ProgramData\chocolatey" (
		echo # - chocolatey
		PowerShell -command "Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))"
		if exist "C:\ProgramData\chocolatey" set v_message=run again
	)

	rem # : - package
	if "0" equ "0" if "%v_admin%" neq "0" if "!v_message!" equ "" (
		echo # - package
		for %%z in (%c_chocolatey%) do (
			if not exist "C:\ProgramData\chocolatey\lib\%%z" (
				echo # - package : %%z
				if "%%z" equ "godot3" (
					choco install godot --version=3.6.1 --force --force-dependencies --confirm --ignore-checksums
				) else (
					choco install %%z --force --force-dependencies --confirm --ignore-checksums
				)
			)
		)
	)

	rem # : - message
	if "0" equ "0" if "%v_admin%" equ "0" if "!v_message!" equ "" (
		echo # - message
		set v_message=run as admin
	)

	rem # : - end
	echo.
)

rem # : - end
echo # [ end ]
if "!v_message!" neq "" echo # - message : !v_message!
set /p _=
