@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion
rem # [ zrfisaac ]

rem # [ about ]
rem # - author : Isaac Caires Santana
rem # . - email : zrfisaac@gmail.com
rem # . - site : zrfisaac.github.io
rem # - version : zrfisaac.batch.clone : 26.5.19.1

rem # [ batch ]

rem # : - config
if exist %~dp0\config.bat call %~dp0\config.bat
if exist %~dp0\_config.bat call %~dp0\_config.bat
if exist %~dp0\_.bat call %~dp0\_.bat

rem # : - begin
echo # - : %~dpnx0

rem # : - clone
echo # . - clone
for %%z in (%c_clone%) do (
	echo # . - clone : %%z
	set _clone=%%z
	set _clone=!_clone:"=!
	git clone !_clone! >nul 2>&1
)

rem # : - end
echo # . - end
set /p _=
