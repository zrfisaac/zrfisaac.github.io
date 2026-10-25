@echo off
chcp 65001 >nul
setlocal
rem # [ zrfisaac ]

rem # [ about ]
rem # - author : Isaac Caires Santana
rem # . - email : zrfisaac@gmail.com
rem # . - site : zrfisaac.github.io
rem # - version : zrfisaac.batch.private : 26.10.16.1

rem # [ batch ]

rem # : - config
set "c_clone=https://github.com/zrfisaac/private.git"
set "_path=%~dp0private"
set "_error=0"
set "GIT_TERMINAL_PROMPT=0"
set "GCM_INTERACTIVE=never"
set "GIT_ASKPASS="

rem # : - begin
echo # - : %~f0

rem # : - clone - private - local
if exist "%_path%\.git" (
	echo # . - clone - private : pasta ja existe
	goto end
)
if exist "%_path%" (
	echo # . - error : pasta private ja existe sem .git
	set "_error=1"
	goto end
)

rem # : - clone - private - authentication
git -c credential.interactive=false -c core.askPass= ls-remote "%c_clone%" >nul 2>&1
if errorlevel 1 (
	echo # . - error : sem acesso autenticado ao repositorio private ou Git indisponivel
	set "_error=1"
	goto end
)

rem # : - clone - private
echo # . - clone - private : %c_clone%
git -c credential.interactive=false -c core.askPass= clone "%c_clone%" "%_path%"
if errorlevel 1 set "_error=1"

rem # : - end
:end
echo # . - end
set /p _=
exit /b %_error%
