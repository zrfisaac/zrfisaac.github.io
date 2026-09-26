@echo off
rem # [ zrfisaac ]

rem # [ about ]
rem # - author : Isaac Caires Santana
rem # . - email : zrfisaac@gmail.com
rem # . - site : zrfisaac.github.io

rem # [ batch ]

rem # : - config - clone
set c_clone=
set c_clone=%c_clone% "https://github.com/zrfisaac/zrfisaac.git %~dp0github"
set c_clone=%c_clone% "https://github.com/zrfisaac/mvp.home-chef.git %~dp0mvp\home-chef"
set c_clone=%c_clone% "https://github.com/zrfisaac/private.git %~dp0private"
set c_clone=%c_clone% "https://github.com/zrfisaac/public.lfs.git %~dp0public\lfs"
set c_clone=%c_clone% "https://github.com/zrfisaac/site.git %~dp0site"
set c_clone=%c_clone% "https://github.com/zrfisaac/zrfisaac.github.io.git %~dp0web"
set c_clone=%c_clone% "https://github.com/zrfisaac/wiki.git %~dp0wiki"

set c_clone=%c_clone% "https://github.com/zrfisaac/install.godot4.git %~dp0install\godot4"

set c_clone=%c_clone% "https://github.com/zrfisaac/fork.assembler-simulator.git %~dp0fork\assembler-simulator"
set c_clone=%c_clone% "https://github.com/zrfisaac/fork.ps4-v01.git %~dp0fork\ps4-v01"
set c_clone=%c_clone% "https://github.com/zrfisaac/fork.ps4-v02.git %~dp0fork\ps4-v02"
