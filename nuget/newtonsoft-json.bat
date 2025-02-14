@echo off 
setlocal enabledelayedexpansion
rem # [ zrfisaac ]

rem # [ about ]
rem # - author : Isaac Caires
rem # . - email : zrfisaac@gmail.com
rem # . - site : zrfisaac.github.io
rem # - version : zrfisaac.nuget.newtonsoft.json : 0.0.1

rem # [ batch ]

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

	rem # : - admin
	if "0" equ "0" if "%v_admin%" neq "0" if "!v_message!" equ "" (
		echo # - admin
		PowerShell -command "Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser"
		PowerShell -command "dotnet add package Newtonsoft.Json"
	)

	rem # : - message
	if "0" equ "0" if "%v_admin%" equ "0" if "!v_message!" equ "" (
		echo # - message
		set v_message=run as admin
	)

	rem # : - end
	echo.
)

rem # : - end
echo # [ end ]
if "!v_message!" neq "" echo # - message : !v_message!
set /p _=
