@echo off 
setlocal enabledelayedexpansion
rem # [ zrfisaac ]

rem # [ about ]
rem # - author : Isaac Caires Santana
rem # . - email : zrfisaac@gmail.com
rem # . - site : zrfisaac.github.io
rem # - version : zrfisaac.batch.choco : 25.7.24.1

rem # [ batch ]

rem # - config
set c_download=
set c_download=%c_download% .
set c_path=%~dp0
set c_path=%c_path:~0,-1%

rem # - config - chocolatey
set c_chocolatey=
set c_chocolatey=!c_chocolatey! 7zip

rem # - special
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

rem # - variable
rem # . - admin
set v_admin=0
net session >nul 2>&1
if "%errorlevel%" equ "0" set v_admin=1
set v_message=
rem # . - info
set v_info_error=0
set v_info_local=%~0
set v_info_local_file=%~n0%~x0
set v_info_local_path=%~p0
set v_info_local_path=!v_info_local_path:~0,-1!
set v_info_local_config=!v_info_local_path!\config.bat
set v_info_local_extension=%~x0
set v_info_local_extension=!v_info_local_extension:~1!
set v_info_local_name=%~n0

rem # - config
if "!v_info_error!" equ "0" (
	rem # : - title
	echo # [ config ]

	rem # : - variable
	set _v_path=!v_info_local_path!\_config.bat

	rem # : - temp
	if exist !_v_path! (
		echo # - temp
		call "!_v_path!"
		set v_info_error=!errorlevel!
	)

	rem # : - default
	if not exist !_v_path! if exist !v_info_local_config! (
		echo # - default
		call "!v_info_local_config!"
		set v_info_error=!errorlevel!
	)

	rem # : - end
	echo.
)

rem # - begin
echo # [ begin ]
echo # - source : %~0
echo.

rem # - main
if "!v_info_error!" equ "0" (
	rem # : - title
	echo # [ main ]

	rem # : - chocolatey
	if "!v_info_error!" equ "0" if "%v_admin%" neq "0" if "!v_message!" equ "" if not exist "C:\ProgramData\chocolatey" (
		echo # - chocolatey
		PowerShell -command "Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))"
		if exist "C:\ProgramData\chocolatey" set v_message=run again
	)

	rem # : - package
	if "!v_info_error!" equ "0" if "%v_admin%" neq "0" if "!v_message!" equ "" (
		echo # - package
		for %%z in (%c_chocolatey%) do (
			if not exist "C:\ProgramData\chocolatey\lib\%%z" (
				echo # - package : %%z
				choco install %%z --force --force-dependencies --confirm --ignore-checksums
			)
		)
	)

	rem # : - message
	if "!v_info_error!" equ "0" if "%v_admin%" equ "0" if "!v_message!" equ "" (
		echo # - message
		set v_message=run as admin
	)

	rem # : - end
	echo.
)

rem # - end
echo # [ end ]
if "!v_info_error!" equ "0" (
	echo # - return : success
) else (
	echo # - return : error
)
set /p _end=
echo.
