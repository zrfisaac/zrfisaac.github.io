@echo off
setlocal enabledelayedexpansion
REM [ zrfisaac ]

REM [ about ]
REM - author : Isaac Caires
REM . - email : zrfisaac@gmail.com
REM . - site : zrfisaac.github.io

REM [ batch ]
set LIBRARY_PATH=C:\MinGW\lib
set C_INCLUDE_PATH=C:\MinGW\include
if exist object\data.o del object\data.o
if exist object\function.o del object\function.o
if exist object\main.o del object\main.o
if exist binary\zrfisaac.exe del binary\zrfisaac.exe
nasm -f win32 source\data.asm -o object\data.o
nasm -f win32 source\function.asm -o object\function.o
nasm -f win32 source\main.asm -o object\main.o
rem gcc -m32 -mconsole -o binary\zrfisaac.exe object\data.o object\function.o object\main.o
rem ld -m i386pe -o binary\zrfisaac.exe object\data.o object\function.o object\main.o -e _start -L %LIBRARY_PATH% -lkernel32 -luser32
ld -m i386pe -o binary\zrfisaac.exe object\data.o object\function.o object\main.o -e _start -L %LIBRARY_PATH% -L %C_INCLUDE_PATH% -L .\source
pause
