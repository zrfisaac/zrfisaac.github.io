@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion
rem # [ zrfisaac ]

rem # [ about ]
rem # - author : Isaac Caires Santana
rem # . - email : zrfisaac@gmail.com
rem # . - site : zrfisaac.github.io
rem # - version : zrfisaac.batch.all : 26.8.30.3

rem # [ batch ]

rem # : - config
set c_clone=
set c_clone=%c_clone% "https://github.com/zrfisaac/zrfisaac.github.io.git %~d0\zrfisaac"
set c_clone=%c_clone% "https://github.com/zrfisaac/zrfisaac.git %~d0\zrfisaac\github"
set c_clone=%c_clone% "https://github.com/zrfisaac/private.git %~d0\zrfisaac\private"
set c_clone=%c_clone% "https://github.com/zrfisaac/zrfisaac.github.io.git %~d0\zrfisaac\web"
set c_clone=%c_clone% "https://github.com/zrfisaac/wiki.git %~d0\zrfisaac\wiki"

rem # : - begin
echo # - : %~dpnx0

rem # : - all - public
echo # . - all - public
for %%z in (%c_clone%) do (
	echo # . - all - public : %%z
	set _clone=%%z
	set _clone=!_clone:"=!
	git clone !_clone! >nul 2>&1
)

rem # : - config - private
if exist %~d0\private\config.bat call %~d0\private\config.bat
if exist %~d0\private\_config.bat call %~d0\private\_config.bat
if exist %~d0\private\_.bat call %~d0\private\_.bat

rem # : - all - private
if exist (%~d0\private) (
	echo # . - all - private
	for %%z in (%c_clone%) do (
		echo # . - all - private : %%z
		set _clone=%%z
		set _clone=!_clone:"=!
		git clone !_clone! >nul 2>&1
	)
)

rem # : - end
echo # . - end
set /p _=
