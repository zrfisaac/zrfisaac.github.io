@echo off
setlocal enabledelayedexpansion
REM [ zrfisaac ]

REM [ about ]
REM - author : Isaac Caires
REM . - email : zrfisaac@gmail.com
REM . - site : zrfisaac.github.io
REM version : zrfisaac.batch.delphi7 : 0.0.1

REM [ batch ]

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
set c_delphi7_local=!v_info_local_path!
set c_delphi7_shell_01=C:\Program Files\Borland\Delphi7\Bin\DCC32.exe
set c_delphi7_shell_02=C:\Program Files (x86)\Borland\Delphi7\Bin\DCC32.exe

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

	rem # : - variable
	set _v_delphi7_shell=
	if "!v_info_error!" equ "0" (
		set _v_delphi7_shell=
		if exist "!c_delphi7_shell_01!" (
			set _v_delphi7_shell=!c_delphi7_shell_01!
		) else if exist "!c_delphi7_shell_02!" (
			set _v_delphi7_shell=!c_delphi7_shell_02!
		)
	)

	rem # : - routine
	if "!v_info_error!" equ "0" (
		rem # : - title
		echo - routine

		rem # : - routine
		cd "!c_delphi7_local!"
		for /r %%z in (*.dpr) do (
			echo . - : %%z
			call  "!_v_delphi7_shell!" -Q -B "%%z"
		)
		cd "!v_info_local_path!"
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
