@echo off
setlocal enabledelayedexpansion
chcp 65001 >nul
rem [ zrfisaac ]

rem # [ about ]
rem # - author : Isaac Caires Santana
rem # - email : zrfisaac@gmail.com
rem # - site : zrfisaac.github.io
rem # - version : zrfisaac.batch.for.variable : 25.10.15.1

rem # [ batch ]
set v_color=
set v_color=!v_color! Red
set v_color=!v_color! Green
set v_color=!v_color! Blue
for %%z in (%v_color%) do (
	echo %%z
)
set /p _end=
echo.
