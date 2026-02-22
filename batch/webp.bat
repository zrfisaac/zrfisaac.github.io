@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion
rem # [ zrfisaac ]

rem # [ about ]
rem # - author : Isaac Caires Santana
rem # . - email : zrfisaac@gmail.com
rem # . - site : zrfisaac.github.io
rem # - version : zrfisaac.batch.webp : 26.2.6.1

rem # [ batch ]

rem # : - begin
echo # - : %~dpnx0

rem # : - webp
for %%z in (*.avif;*.bmp;*.jpeg;*.jpg) do (
	echo # . - webp : "%%~nxz"
	ffmpeg -i "%%~nxz" "%%~nz.webp"
	del /q /s "%%~nxz"
)

rem # : - end
echo # . - end
set /p _=
