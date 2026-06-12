@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion
rem # [ zrfisaac ]

rem # [ sobre ]
rem # - autor : Isaac Caires Santana
rem # . - email : zrfisaac@gmail.com
rem # . - site : zrfisaac.github.io
rem # - versao : zrfisaac.batch.webp : 26.6.12.1

rem # [ batch ]

rem # : - configuracao
set c_corrige=0
set c_limpa=1
set c_tamanho=600

rem # : - configuracao - tipo
set c_tipo=
set c_tipo=%c_tipo% bmp
set c_tipo=%c_tipo% jfif
set c_tipo=%c_tipo% jpeg
set c_tipo=%c_tipo% jpg
set c_tipo=%c_tipo% png

rem # : - config - chocolatey
set c_chocolatey=
set c_chocolatey=!c_chocolatey! ffmpeg
set c_chocolatey=!c_chocolatey! youtube-dl
set c_chocolatey=!c_chocolatey! yt-dlp
set c_chocolatey=!c_chocolatey! imagemagick

rem # : - variavel
set v_sobre=%~dp0\sobre.zrfi

rem # : - variavel
set v_ytdlp=yt-dlp.exe
for /f "delims=" %%i in ('where yt-dlp.exe 2^>nul') do set v_ytdlp=yt-dlp.exe
if "%v_ytdlp%" equ "" (
	set v_ytdlp=%v_ytdlp% C:\ProgramData\chocolatey\bin\yt-dlp.exe
	for %%z in (%v_ytdlp%) do (
		if exist %%z (
			set v_ytdlp=%%z
		)
	)
	if not exist "%v_ytdlp%" set v_ytdlp=
)

rem # : - variavel
set v_mensagem=
set v_administrador=0
net session >nul 2>&1
if "%errorlevel%" equ "0" set v_administrador=1
set v_mensagem=

rem # : - inicio
echo # - : %~dpnx0

rem # : - chocolatey
if "%v_administrador%" neq "0" if "!v_mensagem!" equ "" if not exist "C:\ProgramData\chocolatey" (
	echo # . - chocolatey
	PowerShell -command "Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))"
	if exist "C:\ProgramData\chocolatey" set v_mensagem=execute novamente
)

rem # : - pacote
if "%v_administrador%" neq "0" if "!v_mensagem!" equ "" (
	echo # . - pacote
	for %%z in (%c_chocolatey%) do (
		if not exist "C:\ProgramData\chocolatey\lib\%%z" (
			echo # . - pacote : %%z
			choco install %%z --force --force-dependencies --confirm --ignore-checksums
		)
	)
)

rem # : - inicio
echo # - : %~dpnx0

rem # : - webp
if "%v_administrador%" equ "0" if "!v_mensagem!" equ "" (
	echo # . - webp
	for %%z in (%c_tipo%) do (
		echo # . - webp : %%z
		for %%y in (*.%%z) do (
			if not exist "%%~ny.webp" (
				ffmpeg -i "%%y"  -vf "scale=%c_tamanho%:%c_tamanho%:force_original_aspect_ratio=decrease"  "%%~ny.webp"
			)
			if "%c_limpa%" neq "0" (
				del /q "%%y"
			)
		)
	)
	if "%c_corrige%" neq "0" (
		echo # . - webp - fix
		for %%y in (*.webp) do (
			ffmpeg -i "%%y"  -vf "scale=%c_tamanho%:%c_tamanho%:force_original_aspect_ratio=decrease"  "_.webp"
			if exist "_.webp" (
				del /q "%%y"
				ren "_.webp" "%%y"
			)
		)
	)
)

rem # : - fim
echo # . - fim
if "!v_mensagem!" neq "" echo # . . - : !v_mensagem!
set /p _=
