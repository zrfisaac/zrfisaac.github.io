@echo off
setlocal enabledelayedexpansion
rem # [ zrfisaac ]

rem # [ about ]
rem # - author : Isaac Caires Santana
rem # - email : zrfisaac@gmail.com
rem # - site : zrfisaac.github.io
rem # - version : zrfisaac.flutter.favicon : 25.9.3.1

rem # [ batch ]
ffmpeg -y -i favicon.png -vf scale=72:72 android\app\src\main\res\mipmap-hdpi\ic_launcher.png
ffmpeg -y -i favicon.png -vf scale=48:48 android\app\src\main\res\mipmap-mdpi\ic_launcher.png
ffmpeg -y -i favicon.png -vf scale=96:96 android\app\src\main\res\mipmap-xhdpi\ic_launcher.png
ffmpeg -y -i favicon.png -vf scale=144:144 android\app\src\main\res\mipmap-xxhdpi\ic_launcher.png
ffmpeg -y -i favicon.png -vf scale=192:192 android\app\src\main\res\mipmap-xxxhdpi\ic_launcher.png
pause
