@echo off 
setlocal enabledelayedexpansion
rem # [ zrfisaac ]

rem # [ about ]
rem # - author : Isaac Caires
rem # . - email : zrfisaac@gmail.com
rem # . - site : zrfisaac.github.io
rem # - version : zrfisaac.windows : 1.0.0

rem # [ batch ]

REM : - about
echo # [ about ]
echo # - author : Isaac Caires
echo # . - email : zrfisaac@gmail.com
echo # . - site : zrfisaac.github.io
echo # - version : zrfisaac.windows : 1.0.0
echo.

rem # : - config
set c_download=
set c_download=%c_download% .
set c_path=%~dp0
set c_path=%c_path:~0,-1%

rem # : - config - chocolatey
set c_chocolatey=
set c_chocolatey=!c_chocolatey! 7zip.install
set c_chocolatey=!c_chocolatey! sqlite
set c_chocolatey=!c_chocolatey! git
set c_chocolatey=!c_chocolatey! github-desktop
set c_chocolatey=!c_chocolatey! notepadplusplus
set c_chocolatey=!c_chocolatey! geany
set c_chocolatey=!c_chocolatey! googlechrome
set c_chocolatey=!c_chocolatey! eclipse
set c_chocolatey=!c_chocolatey! godot
set c_chocolatey=!c_chocolatey! ffmpeg
set c_chocolatey=!c_chocolatey! youtube-dl
set c_chocolatey=!c_chocolatey! yt-dlp
set c_chocolatey=!c_chocolatey! imagemagick
set c_chocolatey=!c_chocolatey! android-sdk
set c_chocolatey=!c_chocolatey! androidstudio
set c_chocolatey=!c_chocolatey! visualstudio2022buildtools
set c_chocolatey=!c_chocolatey! visualstudio2022community
set c_chocolatey=!c_chocolatey! vscode
set c_chocolatey=!c_chocolatey! python
set c_chocolatey=!c_chocolatey! nodejs
set c_chocolatey=!c_chocolatey! flutter
set c_chocolatey=!c_chocolatey! qbittorrent
set c_chocolatey=!c_chocolatey! ilspy
set c_chocolatey=!c_chocolatey! sumatrapdf.install
set c_chocolatey=!c_chocolatey! filezilla
set c_chocolatey=!c_chocolatey! gnuwin32-coreutils.install
set c_chocolatey=!c_chocolatey! zettlr
set c_chocolatey=!c_chocolatey! steam
set c_chocolatey=!c_chocolatey! epicgameslauncher
set c_chocolatey=!c_chocolatey! snes9x
set c_chocolatey=!c_chocolatey! mgba
set c_chocolatey=!c_chocolatey! freepascal
set c_chocolatey=!c_chocolatey! lazarus
rem set c_chocolatey=!c_chocolatey! project64
set c_chocolatey=!c_chocolatey! dolphin
set c_chocolatey=!c_chocolatey! gnucobol
set c_chocolatey=!c_chocolatey! embarcaderodevcpp
set c_chocolatey=!c_chocolatey! dbeaver
set c_chocolatey=!c_chocolatey! pgadmin4
set c_chocolatey=!c_chocolatey! sql-server-management-studio
set c_chocolatey=!c_chocolatey! mysql.workbench
set c_chocolatey=!c_chocolatey! oracle-sql-developer
set c_chocolatey=!c_chocolatey! zebradesigner-developers

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
				choco install %%z --force --force-dependencies --confirm --ignore-checksums
			)
		)
	)

	rem # : - message
	if "0" equ "0" if "%v_admin%" equ "0" if "!v_message!" equ "" (
		echo # - message
		set v_message=run as admin
	)

	rem # : - iis
	if "0" equ "0" if "%v_admin%" equ "1" if "!v_message!" equ "" (
		echo # - iis
		dism /online /Get-FeatureInfo /FeatureName:IIS-WebServerRole >nul 2>&1
		if %errorlevel% neq 0 (
			dism /online /Enable-Feature /FeatureName:TelnetClient /All /LimitAccess /NoRestart
			dism /online /Enable-Feature /FeatureName:Microsoft-Windows-Subsystem-Linux /All /LimitAccess /NoRestart
			dism /online /Enable-Feature /FeatureName:VirtualMachinePlatform /All /LimitAccess /NoRestart
			dism /online /Enable-Feature /FeatureName:IIS-WebServerRole /All /LimitAccess /NoRestart
			dism /online /Enable-Feature /FeatureName:IIS-CommonHttpFeatures /All /LimitAccess /NoRestart
			dism /online /Enable-Feature /FeatureName:IIS-WebServer /All /LimitAccess /NoRestart
			dism /online /Enable-Feature /FeatureName:IIS-ManagementConsole /All /LimitAccess /NoRestart
		)
	)

	rem # : - wsl
	if "0" equ "0" if "%v_admin%" equ "1" if "!v_message!" equ "" (
		echo # - wsl
		wsl --list >nul 2>&1
		if %errorlevel% neq 0 (
			PowerShell -command "wsl --install"
			PowerShell -command "wsl --install -d Debian"
			PowerShell -command "wsl --set-default Debian"
		)
	)

	rem # : - end
	echo.
)

rem # : - end
echo # [ end ]
if "!v_message!" neq "" echo # - message : !v_message!
set /p _=
