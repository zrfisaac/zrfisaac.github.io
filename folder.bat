@echo off 
setlocal enabledelayedexpansion
rem # [ zrfisaac ]

rem # [ about ]
rem # - author : Isaac Caires Santana
rem # - email : zrfisaac@gmail.com
rem # - site : zrfisaac.github.io
rem # - version : zrfisaac.folder : 25.8.20.1

rem # [ batch ]

rem # - config - folder
set c_folder=
set c_folder=%c_folder% Antigos
set c_folder=%c_folder% Lixos
set c_folder=%c_folder% Programas
set c_folder=%c_folder% Programas\ArchLinux
set c_folder=%c_folder% Programas\AnyDesk
set c_folder=%c_folder% Programas\GB300
set c_folder=%c_folder% Programas\Manjaro
set c_folder=%c_folder% Programas\Windows
set c_folder=%c_folder% ROMs
set c_folder=%c_folder% ROMs\NintendoCube
set c_folder=%c_folder% ROMs\NintendoSuper
set c_folder=%c_folder% Temp

rem # - config - target
set c_target=..\

rem # - run
for %%z in (%c_folder%) do (
	if not exist "%c_target%%%z" (
		mkdir "%c_target%%%z"
		echo %%z
	)
)
echo ### FIM ###
set /p _=
