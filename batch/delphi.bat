@echo off
setlocal
setlocal enabledelayedexpansion
chcp 65001 >NUL
rem # [ zrfisaac ]

rem # [ about ]
rem # - author : Isaac Caires Santana
rem # - email : zrfisaac@gmail.com
rem # - site : zrfisaac.github.io
rem # - version : zrfisaac.batch.delphi : 25.8.5.1

rem # [ batch ]

rem # : - variable
set v_dcc=dcc32.exe
for /f "delims=" %%i in ('where dcc32.exe 2^>nul') do set v_dcc=dcc32.exe
if "%v_dcc%" equ "" (
	set v_dcc=%v_dcc% C:\PROGRA~1\Borland\Delphi7\Bin\dcc32.exe
	set v_dcc=%v_dcc% C:\PROGRA~2\Borland\Delphi7\Bin\dcc32.exe
	for %%z in (%v_dcc%) do (
		if exist %%z (
			set v_dcc=%%z
		)
	)
	if not exist "%v_dcc%" set v_dcc=
)

rem # : - delphi
echo # [ delphi ]
if "%v_dcc%" equ "" (
	echo # - : delphi not found
) else (
	echo # - pas
	for /r %%z in (*.pas) do (
		echo # - pas - : %%z
		call "%v_dcc%" "%%z"
	)
	echo # - dpr
	for /r %%z in (*.dpr) do (
		echo # - dpr - : %%z
		call "%v_dcc%" -Q -B "%%z"
	)
	echo.
)

rem # : - end
echo # [ end ]
set /p _=
