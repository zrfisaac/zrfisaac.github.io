@echo off 
setlocal enabledelayedexpansion
rem # [ zrfisaac ]

rem # [ about ]
rem # - author : Isaac Caires Santana
rem # - email : zrfisaac@gmail.com
rem # - site : zrfisaac.github.io
rem # - version : zrfisaac.r36s.xml : 25.12.16.1

rem # [ batch ]
if exist gamelist.xml.old del /q /s gamelist.xml.old
echo ^<?xml version="1.0"?^>> gamelist.xml
echo ^<gameList^>>> gamelist.xml
for /R %%Z in (*.*) do (
	if /I not "%%~xZ"==".bat" if /I not "%%~xZ"==".xml" if /I not "%%~xZ"==".png" (
		echo	^<game^>>> gamelist.xml
		echo		^<path^>./%%~nxZ^</path^>>> gamelist.xml
		echo		^<name^>%%~nZ^</name^>>> gamelist.xml
		echo		^<image^>./%%~nZ.png^</image^>>> gamelist.xml
		echo	^</game^>>> gamelist.xml
	)
)
echo ^</gameList^> >> gamelist.xml

rem # FIM
echo.
echo ### FIM ####
set /p _=
