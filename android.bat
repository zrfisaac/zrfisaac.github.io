@echo off 
setlocal enabledelayedexpansion
rem # [ zrfisaac ]

rem # [ about ]
rem # - author : Isaac Caires Santana
rem # - email : zrfisaac@gmail.com
rem # - site : zrfisaac.github.io
rem # - version : zrfisaac.android : 25.8.12.1

rem # [ batch ]
set v_sdk=%ANDROID_HOME%
set v_sdkmanager=%ANDROID_HOME%\tools\bin\sdkmanager.bat
if exist "%v_sdkmanager%" (
	call "%v_sdkmanager%" "platform-tools" "platforms;android-36" "build-tools;36.0.0"
	echo y | call %v_sdkmanager% --licenses --sdk_root=""
)
pause
