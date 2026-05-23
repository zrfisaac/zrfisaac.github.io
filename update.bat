@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion
rem # [ zrfisaac ]

rem # [ about ]
rem # - author : Isaac Caires Santana
rem # . - email : zrfisaac@gmail.com
rem # . - site : zrfisaac.github.io
rem # - version : zrfisaac.batch.update : 26.5.23.1

rem # [ batch ]

rem # : - config
if exist %~dp0\config.bat call %~dp0\config.bat
if exist %~dp0\_config.bat call %~dp0\_config.bat
if exist %~dp0\_.bat call %~dp0\_.bat

rem # : - begin
echo # - : %~dpnx0
for /d /r %%z in (.git) do (
	set "_git=%%z"
	echo !_git! | find /i "\.git\" >nul
	if "!errorlevel!" neq "0" (
		set "_github=%%z"
		echo !_github! | find /i "\.github\" >nul
		if "!errorlevel!" neq "0" (
			set "_path=%%z"
			set "_path=!_path:\.git=!"
			echo # . - : !_path!
			pushd "!_path!"
			git pull >nul
			popd
		)
	)
)

rem # : - end
echo # . - end
set /p _=
