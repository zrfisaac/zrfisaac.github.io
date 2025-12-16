@echo off 
setlocal enabledelayedexpansion
rem # [ zrfisaac ]

rem # [ about ]
rem # - author : Isaac Caires Santana
rem # - email : zrfisaac@gmail.com
rem # - site : zrfisaac.github.io
rem # - version : zrfisaac.r36s.png : 25.12.16.1

rem # [ batch ]
for /R %%z in (*.jpg *.jpeg *.webp) do (
	ffmpeg -i "%%~nxz" "%%~nz.png"
	del /q /s "%%~nxz"
)

rem # : - end
echo.
echo ### end ####
set /p _=
