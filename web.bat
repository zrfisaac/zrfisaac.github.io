@echo off 
setlocal enabledelayedexpansion
rem # [ zrfisaac ]

rem # [ about ]
rem # - author : Isaac Caires Santana
rem # - email : zrfisaac@gmail.com
rem # - site : zrfisaac.github.io
rem # - version : zrfisaac.web : 25.8.12.1

rem # [ batch ]
set v_node_url=https://nodejs.org/dist/v24.5.0/node-v24.5.0-win-x64.zip
set v_node_folder=_node
set v_node_temp=node-v24.5.0-win-x64
set v_node_zip=node-v24.5.0-win-x64.zip
if not exist "%v_node_folder%" (
	call powershell -command "$zipPath = '%v_node_zip%';" "(New-Object Net.WebClient).DownloadFile('%v_node_url%', $zipPath);" "Expand-Archive -Path $zipPath -DestinationPath '.' -Force"
	ren "%v_node_temp%" "%v_node_folder%"
	del /q /s %v_node_zip%
	copy /y .\nodejs\run.js %v_node_folder%\run.js
)
if not exist "%v_node_folder%\node_modules\express\*" (
	pushd "%v_node_folder%"
	call npm.cmd install express
	popd
)
start http://localhost:8080
call %v_node_folder%\node.exe %v_node_folder%\run.js
