@echo off
setlocal enabledelayedexpansion
REM [ zrfisaac ]

REM [ about ]
REM - author : Isaac Caires
REM . - email : zrfisaac@gmail.com
REM . - site : zrfisaac.github.io
REM version : zrfisaac.batch.csharp : 1.0.0

REM [ batch ]

rem # - about
echo [ about ]
echo - author : Isaac Caires
echo . - email : zrfisaac@gmail.com
echo . - site : https://sites.google.com/view/zrfisaac-en
echo - title : zrfisaac self research ^| shell ^| batch ^| csharp ^| 0.0.1
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
set c_csharp_local=!v_info_local_path!
set c_csharp_shell_01=C:\Windows\Microsoft.NET\Framework\v3.5\csc.exe
set c_csharp_shell_02=C:\Windows\Microsoft.NET\Framework64\v3.5\csc.exe
set c_csharp_shell_03=C:\Windows\Microsoft.NET\Framework\v4.0.30319\csc.exe
set c_csharp_shell_04=C:\Windows\Microsoft.NET\Framework64\v4.0.30319\csc.exe

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
	set _v_csharp_shell=
	if "!v_info_error!" equ "0" (
		set _v_csharp_shell=
		if exist "!c_csharp_shell_01!" (
			set _v_csharp_shell=!c_csharp_shell_01!
		) else if exist "!c_csharp_shell_02!" (
			set _v_csharp_shell=!c_csharp_shell_02!
		) else if exist "!c_csharp_shell_03!" (
			set _v_csharp_shell=!c_csharp_shell_03!
		) else if exist "!c_csharp_shell_04!" (
			set _v_csharp_shell=!c_csharp_shell_04!
		)
	)

	rem # : - routine
	if "!v_info_error!" equ "0" (
		rem # : - title
		echo - routine

		rem # : - routine
		cd "!c_csharp_local!"
		for /r %%z in (*.cs) do (
			echo . - : %%z
			call  "!_v_csharp_shell!" /out:"!c_csharp_local!\%%~nz.exe" "%%z"
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
