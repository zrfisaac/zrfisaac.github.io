@echo off
rem # [ zrfisaac ]

rem # [ about ]
rem # - author : Isaac Caires Santana
rem # . - email : zrfisaac@gmail.com
rem # . - site : zrfisaac.github.io
rem # - version : zrfisaac.batch.config : 26.3.6.1

rem # [ batch ]

rem # - config - chocolatey
set c_chocolatey=
set c_chocolatey=!c_chocolatey! ffmpeg
set c_chocolatey=!c_chocolatey! youtube-dl
set c_chocolatey=!c_chocolatey! yt-dlp
set c_chocolatey=!c_chocolatey! imagemagick

rem # - config - mssql
set c_mssql_shell=SQLCMD.exe
set c_mssql_server=localhost
set c_mssql_user=debug
set c_mssql_password=1234
set c_mssql_database=DEBUG
set c_mssql_target=C:\Bancos
