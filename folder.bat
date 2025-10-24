@echo off
setlocal enabledelayedexpansion
chcp 65001 >nul
rem [ zrfisaac ]

rem # [ about ]
rem # - author : Isaac Caires Santana
rem # - email : zrfisaac@gmail.com
rem # - site : zrfisaac.github.io

rem # [ batch ]
set l_folder=
set l_folder=%l_folder% %~d0\Antigos
set l_folder=%l_folder% %~d0\Assets
set l_folder=%l_folder% %~d0\Assets\Audio
set l_folder=%l_folder% %~d0\Assets\Cores
set l_folder=%l_folder% %~d0\Assets\Textura
set l_folder=%l_folder% %~d0\Assets\Sprites
set l_folder=%l_folder% %~d0\Backups
set l_folder=%l_folder% %~d0\Bancos
set l_folder=%l_folder% %~d0\Exemplos
set l_folder=%l_folder% %~d0\Exemplos\Bash
set l_folder=%l_folder% %~d0\Exemplos\Batch
set l_folder=%l_folder% %~d0\Exemplos\Delphi7
set l_folder=%l_folder% %~d0\Exemplos\Godot3
set l_folder=%l_folder% %~d0\Exemplos\Godot4
set l_folder=%l_folder% %~d0\Exemplos\InnoSetup
set l_folder=%l_folder% %~d0\Exemplos\NSIS
set l_folder=%l_folder% %~d0\Exemplos\PixelArt
set l_folder=%l_folder% %~d0\Filmes
set l_folder=%l_folder% %~d0\Filmes\Acao
set l_folder=%l_folder% %~d0\Filmes\Animacao
set l_folder=%l_folder% %~d0\Filmes\Comedia
set l_folder=%l_folder% %~d0\Filmes\Heroi
set l_folder=%l_folder% %~d0\Filmes\Fantasia
set l_folder=%l_folder% %~d0\Filmes\Ficsao
set l_folder=%l_folder% %~d0\Filmes\Terror
set l_folder=%l_folder% %~d0\Jogos
set l_folder=%l_folder% %~d0\Jogos\Atari
set l_folder=%l_folder% %~d0\Jogos\Bios
set l_folder=%l_folder% %~d0\Jogos\Cube
set l_folder=%l_folder% %~d0\Jogos\DOS
set l_folder=%l_folder% %~d0\Jogos\GB
set l_folder=%l_folder% %~d0\Jogos\GBC
set l_folder=%l_folder% %~d0\Jogos\GBA
set l_folder=%l_folder% %~d0\Jogos\Genesis
set l_folder=%l_folder% %~d0\Jogos\J2ME
set l_folder=%l_folder% %~d0\Jogos\MS
set l_folder=%l_folder% %~d0\Jogos\N64
set l_folder=%l_folder% %~d0\Jogos\NDS
set l_folder=%l_folder% %~d0\Jogos\NES
set l_folder=%l_folder% %~d0\Jogos\PC
set l_folder=%l_folder% %~d0\Jogos\Pico
set l_folder=%l_folder% %~d0\Jogos\Port
set l_folder=%l_folder% %~d0\Jogos\PS1
set l_folder=%l_folder% %~d0\Jogos\PS2
set l_folder=%l_folder% %~d0\Jogos\PS3
set l_folder=%l_folder% %~d0\Jogos\PSP
set l_folder=%l_folder% %~d0\Jogos\R36S
set l_folder=%l_folder% %~d0\Jogos\SNES
set l_folder=%l_folder% %~d0\Jogos\Wii
set l_folder=%l_folder% %~d0\Lixos
set l_folder=%l_folder% %~d0\Memorias
set l_folder=%l_folder% %~d0\OS
set l_folder=%l_folder% %~d0\OS\ArchLinux
set l_folder=%l_folder% %~d0\OS\Manjaro
set l_folder=%l_folder% %~d0\OS\Windows
set l_folder=%l_folder% %~d0\Programas
set l_folder=%l_folder% %~d0\Prototipos
set l_folder=%l_folder% %~d0\Prototipos\Bash
set l_folder=%l_folder% %~d0\Prototipos\Batch
set l_folder=%l_folder% %~d0\Prototipos\Delphi7
set l_folder=%l_folder% %~d0\Prototipos\Godot3
set l_folder=%l_folder% %~d0\Prototipos\Godot4
set l_folder=%l_folder% %~d0\Prototipos\InnoSetup
set l_folder=%l_folder% %~d0\Prototipos\Lazarus
set l_folder=%l_folder% %~d0\Prototipos\NSIS
set l_folder=%l_folder% %~d0\Prototipos\PixelArt
set l_folder=%l_folder% %~d0\Temp
set l_folder=%l_folder% %~d0\Videos
set l_folder=%l_folder% %~d0\Wallpapers
for %%z in (%l_folder%) do (
	if not exist "%%z" (
		echo %%z
		mkdir %%z
	)
)
