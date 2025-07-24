@echo off
setlocal enabledelayedexpansion
rem # [ zrfisaac ]

rem # [ about ]
rem # - author : Isaac Caires Santana
rem # . - email : zrfisaac@gmail.com
rem # . - site : zrfisaac.github.io
rem # - version : zrfisaac.batch.routine : 25.7.24.1

rem # [ batch ]

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

rem # - main
if "!v_info_error!" equ "0" (
	rem # : - title
	echo # [ main ]

	rem # : - routine
	if "!v_info_error!" equ "0" (
		rem # : - title
		echo # - routine

		rem # : - routine
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
