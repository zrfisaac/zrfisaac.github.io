@echo off
setlocal enabledelayedexpansion
REM [ zrfisaac ]

REM [ about ]
REM - author : Isaac Caires
REM . - email : zrfisaac@gmail.com
REM . - site : zrfisaac.github.io
REM version : zrfisaac.batch.base.v00 : 1.0.0

REM [ batch ]
rem # - about
echo [ about ]
echo - author : Isaac Caires
echo . - email : zrfisaac@gmail.com
echo . - site : https://sites.google.com/view/zrfisaac-en
echo - title : zrfisaac self research ^| shell ^| batch ^| base ^| 0.1.0
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

	rem # : - routine
	if "!v_info_error!" equ "0" (
		rem # : - title
		echo - routine

		rem # : - routine
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
