@echo off
rem # [ zrfisaac ]

rem # [ about ]
rem # - author : Isaac Caires Santana
rem # . - email : zrfisaac@gmail.com
rem # . - site : zrfisaac.github.io
rem # - base : zrfisaac.batch.config : 26.8.30.2

rem # [ batch ]

rem # : - config - clone
set c_clone=
set c_clone=%c_clone% "https://github.com/zrfisaac/zrfisaac.git %~dp0github"
set c_clone=%c_clone% "https://github.com/zrfisaac/zrfisaac.git %~dp0private"
set c_clone=%c_clone% "https://github.com/zrfisaac/zrfisaac.github.io.git %~dp0web"
set c_clone=%c_clone% "https://github.com/zrfisaac/wiki.git %~dp0wiki"
