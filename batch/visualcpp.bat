@echo off
setlocal enabledelayedexpansion
REM [ zrfisaac ]

REM [ about ]
REM - author : Isaac Caires
REM . - email : zrfisaac@gmail.com
REM . - site : zrfisaac.github.io
REM version : zrfisaac.batch.visualcpp : 1.0.0

REM [ batch ]

rem # - about
echo [ about ]
echo - author : Isaac Caires
echo . - email : zrfisaac@gmail.com
echo . - site : https://sites.google.com/view/zrfisaac-en
echo - title : zrfisaac self research ^| shell ^| batch ^| visualcpp ^| 0.0.1
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
set c_visualcpp_local=!v_info_local_path!
set c_visualcpp_shell_01=C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Tools\MSVC\14.30.30705\bin\Hostx86\x86\cl.exe
set c_visualcpp_shell_02=C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Tools\MSVC\14.30.30705\bin\Hostx86\x64\cl.exe
set c_visualcpp_variable_01=C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars32.bat
set c_visualcpp_variable_02=C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars64.bat
set c_visualcpp_variable_03=C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvarsall.bat

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
	set _v_visualcpp_shell=
	set _v_visualcpp_variable=
	if "!v_info_error!" equ "0" (
		set _v_visualcpp_shell=
		if exist "!c_visualcpp_shell_01!" (
			set _v_visualcpp_shell=!c_visualcpp_shell_01!
		) else if exist "!c_visualcpp_shell_02!" (
			set _v_visualcpp_shell=!c_visualcpp_shell_02!
		)
	)
	if "!v_info_error!" equ "0" (
		set _v_visualcpp_variable=
		if exist "!c_visualcpp_variable_01!" (
			set _v_visualcpp_variable=!c_visualcpp_variable_01!
		) else if exist "!c_visualcpp_variable_02!" (
			set _v_visualcpp_variable=!c_visualcpp_variable_02!
		)
	)

	rem # : - routine
	if "!v_info_error!" equ "0" (
		rem # : - title
		echo - routine

		rem # : - routine
		cd "!c_visualcpp_local!"
		call "!_v_visualcpp_variable!"
		for /r %%z in (*.cpp) do (
			echo . - : %%z
			call  "!_v_visualcpp_shell!" /EHsc "%%z"
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
