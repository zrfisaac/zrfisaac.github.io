@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion
rem # [ zrfisaac ]

rem # [ about ]
rem # - author : Isaac Caires Santana
rem # . - email : zrfisaac@gmail.com
rem # . - site : zrfisaac.github.io
rem # - version : zrfisaac.batch.git.long.path : 26.5.19.1

rem # [ batch ]

rem # : - begin
echo # - : %~dpnx0

rem # : - git
echo # . - git
git config --system core.longpaths true

rem # : - end
echo # . - end
set /p _=
