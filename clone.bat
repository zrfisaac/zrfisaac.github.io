@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion
rem # [ zrfisaac ]

rem # [ about ]
rem # - author : Isaac Caires Santana
rem # . - email : zrfisaac@gmail.com
rem # . - site : zrfisaac.github.io
rem # - version : zrfisaac.batch.clone : 26.5.1.1

rem # [ batch ]

rem # : - config
if exist %~dp0config.bat call %~dp0config.bat
if exist %~dp0_config.bat call %~dp0_config.bat
if exist %~dp0_.bat call %~dp0_.bat

rem # : - begin
echo # - : %~dpnx0
for %%z in (%c_clone%) do (
	echo # . - : %%z
	set _clone=%%z
	set _clone=!_clone:"=!
	git clone !_clone! >nul 2>&1
)

rem # : - end
echo # . - end
set /p _=
