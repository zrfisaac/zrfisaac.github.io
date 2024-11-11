@echo off
setlocal enabledelayedexpansion
REM [ zrfisaac ]

REM [ about ]
REM - author : Isaac Caires
REM . - email : zrfisaac@gmail.com
REM . - site : zrfisaac.github.io
REM version : zrfisaac.batch.mysql : 1.0.0

REM [ batch ]

rem # - about
echo [ about ]
echo - author : Isaac Caires
echo . - email : zrfisaac@gmail.com
echo . - site : https://sites.google.com/view/zrfisaac-en
echo - title : zrfisaac self research ^| shell ^| batch ^| mysql ^| 0.0.1
echo.

rem # [ batch ]

rem # - variable
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
set c_mysql_local=!v_info_local_path!
set c_mysql_shell=mysql.exe
set c_mysql_server=localhost
set c_mysql_user=root
set c_mysql_password=1234
set c_mysql_database=TEST

rem # - config
if "!v_info_error!" equ "0" (
	rem # : - title
	echo [ config ]

	rem # : - variable
	set _v_path=!v_info_local_path!\_config.bat

	rem # : - temp
	if exist !_v_path! (
		echo - temp
		call "!_v_path!"
		set v_info_error=!errorlevel!
	)

	rem # : - default
	if not exist !_v_path! if exist !v_info_local_config! (
		echo - default
		call "!v_info_local_config!"
		set v_info_error=!errorlevel!
	)

	rem # : - end
	echo.
)

rem # - routine
if "!v_info_error!" equ "0" (
	rem # : - title
	echo [ routine ]

	rem # : - database
	if "!v_info_error!" equ "0" (
		rem # : - title
		echo - database

		rem # : - routine
		set _v_script=
		set _v_script=!_v_script! CREATE DATABASE IF NOT EXISTS `P_DATABASE`;
		for %%a in (!c_mysql_database!) do set "_v_script=!_v_script:P_DATABASE=%%a!"
		call "!c_mysql_shell!" -h "!c_mysql_server!" -u "!c_mysql_user!" -p"!c_mysql_password!" -e "!_v_script!" > nul

		rem # : - error
		set v_info_error=!errorlevel!
	)

	rem # : - script
	if "!v_info_error!" equ "0" (
		rem # : - title
		echo - script

		rem # : - routine
		cd "!c_mysql_local!"
		for /r %%z in (*.sql) do (
			echo . - : %%z
			call "!c_mysql_shell!" -h "!c_mysql_server!" -u "!c_mysql_user!" -p"!c_mysql_password!" -D "!c_mysql_database!" < "%%z" > nul
		)
		cd "!v_info_local_path!"

		rem # : - error
		set v_info_error=!errorlevel!
	)

	rem # : - end
	echo.
)

rem # - end
echo [ end ]
if "!v_info_error!" equ "0" (
	echo - return : success
) else (
	echo - return : error
)
set /p _end=
echo.
