@echo off
setlocal enabledelayedexpansion
REM [ zrfisaac ]

REM [ about ]
REM - author : Isaac Caires Santana
REM . - email : zrfisaac@gmail.com
REM . - site : zrfisaac.github.io
REM version : zrfisaac.batch.folder : 26.2.23.1

REM [ batch ]

rem # [ batch ]

rem # - variable
rem # . - info
set v_info_error=0
set v_info_local=%~0
set v_info_local_file=%~n0%~x0
set v_info_local_path=%~p0
set v_info_local_path=!v_info_local_path:~0,-1!
set v_info_local_config=!v_info_local_path!\config.bat
set v_info_local_extension=%~x0
set v_info_local_extension=!v_info_local_extension:~1!
set v_info_local_name=%~n0

rem # - config
set c_folder=
set c_folder=%c_folder% Animes
set c_folder=%c_folder% Assets
set c_folder=%c_folder% Backups
set c_folder=%c_folder% Bash
set c_folder=%c_folder% Batch
set c_folder=%c_folder% Binarios
set c_folder=%c_folder% Componentes
set c_folder=%c_folder% Crack
set c_folder=%c_folder% Desenhos
set c_folder=%c_folder% DLLs
set c_folder=%c_folder% Documentos
set c_folder=%c_folder% Drives
set c_folder=%c_folder% Filmes
set c_folder=%c_folder% GSI
set c_folder=%c_folder% Jogos
set c_folder=%c_folder% Linux
set c_folder=%c_folder% Lixo
set c_folder=%c_folder% Meshs
set c_folder=%c_folder% Minerva
set c_folder=%c_folder% OpusNet
set c_folder=%c_folder% OS
set c_folder=%c_folder% OS\MacOS
set c_folder=%c_folder% OS\Linux
set c_folder=%c_folder% OS\Windows
set c_folder=%c_folder% Playground
set c_folder=%c_folder% Playground\Delphi5
set c_folder=%c_folder% Playground\Delphi7
set c_folder=%c_folder% Playground\Delphi10
set c_folder=%c_folder% Playground\Delphi12
set c_folder=%c_folder% Playground\Delphi2005
set c_folder=%c_folder% Playground\Delphi2008
set c_folder=%c_folder% Playground\Delphi2010
set c_folder=%c_folder% Playground\DelphiXE
set c_folder=%c_folder% Playground\DelphiXE2
set c_folder=%c_folder% Playground\Godot3
set c_folder=%c_folder% Playground\Godot4
set c_folder=%c_folder% Playground\Lazarus
set c_folder=%c_folder% Playground\MSSQL
set c_folder=%c_folder% Playground\SQLite
set c_folder=%c_folder% Programas
set c_folder=%c_folder% Publico
set c_folder=%c_folder% Python
set c_folder=%c_folder% Registros
set c_folder=%c_folder% Roms
set c_folder=%c_folder% Roms\GameCube
set c_folder=%c_folder% Roms\Nintendo64
set c_folder=%c_folder% Roms\PlayStation1
set c_folder=%c_folder% Roms\PlayStation2
set c_folder=%c_folder% Roms\SuperNintendo
set c_folder=%c_folder% Scripts
set c_folder=%c_folder% Series
set c_folder=%c_folder% Softwell
set c_folder=%c_folder% Sprites
set c_folder=%c_folder% TechSallus
set c_folder=%c_folder% Temp
set c_folder=%c_folder% Torrent

rem # - config
if "!v_info_error!" equ "0" (
	rem # : - title
	echo [ config ]

	rem # : - variable
	set _v_path=!v_info_local_path!\_config.bat

	rem # : - temp
	if exist !_v_path! (
		echo - temp
		call "!_v_path!"
		set v_info_error=!errorlevel!
	)

	rem # : - default
	if not exist !_v_path! if exist !v_info_local_config! (
		echo - default
		call "!v_info_local_config!"
		set v_info_error=!errorlevel!
	)

	rem # : - end
	echo.
)

rem # - main
if "!v_info_error!" equ "0" (
	rem # : - title
	echo [ main ]

	rem # : - routine
	if "!v_info_error!" equ "0" (
		rem # : - title
		echo - routine

		rem # : - routine
		for %%z in (!c_folder!) do (
			if not exist %%z ( 
				echo . - : %%z
				mkdir %%z
			)
		)
	)

	rem # : - end
	echo.
)

rem # - end
echo [ end ]
if "!v_info_error!" equ "0" (
	echo - return : success
) else (
	echo - return : error
)
set /p _end=
echo.
