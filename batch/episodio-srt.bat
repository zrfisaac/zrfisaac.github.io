@echo off
setlocal enabledelayedexpansion
rem # [ zrfisaac ]

rem # [ about ]
rem # - author : Isaac Caires Santana
rem # - email : zrfisaac@gmail.com
rem # - site : zrfisaac.github.io
rem # - version : zrfisaac.batch.episodio.srt : 25.8.23.2

rem # [ batch ]
set end=.srt
set /a _result=0
set _number=
for %%z in (*!end!) do (
	set /a _result=!_result! + 1
	set _number=00!_result!
	set _number=!_number:~-2!
	if not exist "Episodio!_number!!end!" ren %%z Episodio!_number!!end!
)
pause
