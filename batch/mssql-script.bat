@echo off
setlocal enabledelayedexpansion
rem # [ zrfisaac ]

rem # [ about ]
rem # - author : Isaac Caires Santana
rem # . - email : zrfisaac@gmail.com
rem # . - site : zrfisaac.github.io
rem # version : zrfisaac.batch.mssql.script : 25.6.7.1

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
set c_mssql_local=!v_info_local_path!
set c_mssql_shell=SQLCMD.exe
set c_mssql_server=localhost
set c_mssql_user=debug
set c_mssql_password=1234
set c_mssql_database=DEBUG
set c_mssql_target=C:\Bancos

rem # - config
if "!v_info_error!" equ "0" (
	rem # : - title
	echo [ config ]

	rem # : - temp
	set _v_path=!v_info_local_path!\_config.bat
	if exist !_v_path! (
		echo - temp
		call "!_v_path!"
		set v_info_error=!errorlevel!
	)

	rem # : - temp
	set _v_path=!v_info_local_path!\_.bat
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
		set _script=
		set _script=!_script! IF DB_ID^('P_DATABASE'^) IS NULL CREATE DATABASE [P_DATABASE]
		for %%a in (!c_mssql_database!) do set "_script=!_script:P_DATABASE=%%a!"
		call !c_mssql_shell! -S "!c_mssql_server!" -U "!c_mssql_user!" -P "!c_mssql_password!" -Q "!_script!" -r1 > nul

		rem # : - error
		set v_info_error=!errorlevel!
	)

	rem # : - script
	if "!v_info_error!" equ "0" (
		rem # : - title
		echo - script

		rem # : - routine
		cd "!c_mssql_local!"
		for /r %%z in (*.sql) do (
			echo . - : %%z
			call "!c_mssql_shell!" -S "!c_mssql_server!" -U "!c_mssql_user!" -P "!c_mssql_password!" -d "!c_mssql_database!" -i "%%z" -r1 > nul
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
