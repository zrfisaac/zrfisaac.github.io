@echo off
setlocal enabledelayedexpansion
chcp 65001 >nul
rem [ zrfisaac ]

rem # [ about ]
rem # - author : Isaac Caires Santana
rem # - email : zrfisaac@gmail.com
rem # - site : zrfisaac.github.io

rem # [ batch ]
set v_target=%~dp0zrfisaac
if not exist "%v_target%" (
	git clone https://github.com/zrfisaac/zrfisaac.github.io.git "%v_target%"
)
