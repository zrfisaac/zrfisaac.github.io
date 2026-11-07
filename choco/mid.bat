@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion
rem # [ zrfisaac ]

rem # [ about ]
rem # - author : Isaac Caires Santana
rem # . - email : zrfisaac@gmail.com
rem # . - site : zrfisaac.github.io
rem # - version : zrfisaac.chocolatey.ytdlp : 26.9.16.1

rem # [ batch ]

rem # : - config - chocolatey
set c_chocolatey=
set c_chocolatey=!c_chocolatey! ffmpeg
set c_chocolatey=!c_chocolatey! fluidsynth

rem # : - config
if exist %~dp0\config.bat call %~dp0\config.bat
if exist %~dp0\_config.bat call %~dp0\_config.bat
if exist %~dp0\_.bat call %~dp0\_.bat

rem # : - variable
set v_about=%~dp0\about.zrfi

rem # : - variable
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

rem # : - variable
set v_message=
set v_administrator=0
net session >nul 2>&1
if "%errorlevel%" equ "0" set v_administrator=1
set v_message=

rem # : - begin
echo # - : %~dpnx0

rem # : - chocolatey
if "%v_administrator%" neq "0" if "!v_message!" equ "" if not exist "C:\ProgramData\chocolatey" (
	echo # . - chocolatey
	PowerShell -command "Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))"
	if exist "C:\ProgramData\chocolatey" set v_message=execute novamente
)

rem # : - package
if "%v_administrator%" neq "0" if "!v_message!" equ "" (
	echo # . - package
	for %%z in (%c_chocolatey%) do (
		if not exist "C:\ProgramData\chocolatey\lib\%%z" (
			echo # . - package : %%z
			choco install %%z --force --force-dependencies --confirm --ignore-checksums
		)
	)
)
rem # : - soundfont
if "%v_administrator%" neq "0" (
    echo # . - soundfont
    if not exist "%ProgramData%\zrfisaac\soundfonts\TimGM6mb.sf2" (
        powershell -NoProfile -Command "$ErrorActionPreference='Stop'; $p=Join-Path $env:ProgramData 'zrfisaac\soundfonts'; New-Item -ItemType Directory -Path $p -Force | Out-Null; $tmp=Join-Path $p 'TimGM6mb.download'; Invoke-WebRequest -UseBasicParsing -Uri 'https://raw.githubusercontent.com/craffel/pretty-midi/c58acefd146c2c6f33c4436d2d66859032bf3956/pretty_midi/TimGM6mb.sf2' -OutFile $tmp; if ((Get-FileHash -LiteralPath $tmp).Hash -ne '82475B91A76DE15CB28A104707D3247BA932E228BADA3F47BBA63C6B31AAF7A1') { throw 'Falha na verificacao do SoundFont' }; Move-Item -LiteralPath $tmp -Destination (Join-Path $p 'TimGM6mb.sf2')"
        if errorlevel 1 exit /b 1
    )
)

rem # : - end
echo # . - end
set /p _=
exit /b


rem # [ function ]

rem # : - lista
:lista
set "_lista_target=%~1"
set "_lista_source=%~2"
set "_lista_index=%~3"

rem # : - format
set "_lista_number=00000000%_lista_index%"
set "_lista_number=%_lista_number:~-8%"
set "_lista_name=%_lista_number:~0,2%-%_lista_number:~2,2%-%_lista_number:~4,2%-%_lista_number:~6,2%.mp4"
set "_lista_file=%_lista_target%\%_lista_name%"

rem # : - download
if not exist "%_lista_file%" (
	echo # . - ytdlp : %_lista_file%

	if exist "cookies.txt" (
		call "%v_ytdlp%" -f "bv*[height^<=760]+ba/b[height^<=760]" --cookies cookies.txt -o "%_lista_file%" "%_lista_source%"
	) else (
		call "%v_ytdlp%" -f "bv*[height^<=760]+ba/b[height^<=760]" -o "%_lista_file%" "%_lista_source%"
	)
)

exit /b
