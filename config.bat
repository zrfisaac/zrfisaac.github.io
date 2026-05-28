@echo off
rem # [ zrfisaac ]

rem # [ about ]
rem # - author : Isaac Caires Santana
rem # . - email : zrfisaac@gmail.com
rem # . - site : zrfisaac.github.io
rem # - base : zrfisaac.batch.config : 26.5.19.1

rem # [ batch ]

rem # : - config - clone
set c_clone=
set c_clone=%c_clone% "https://github.com/zrfisaac/zrfisaac.git %~d0\zrfisaac\github"
set c_clone=%c_clone% "https://github.com/zrfisaac/install.bde.git %~d0\zrfisaac\install\bde"
set c_clone=%c_clone% "https://github.com/zrfisaac/project.prnview.git %~d0\zrfisaac\project\prnview"
set c_clone=%c_clone% "https://github.com/zrfisaac/template.docsify.git %~d0\zrfisaac\template\docsify"
set c_clone=%c_clone% "https://github.com/zrfisaac/wiki.git %~d0\zrfisaac\wiki"

rem # : - config
if exist %~d0\zrfisaac\data\config.bat call %~d0\zrfisaac\data\config.bat
