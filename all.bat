@echo off 
setlocal enabledelayedexpansion
rem # [ zrfisaac ]

rem # [ about ]
rem # - author : Isaac Caires Santana
rem # - email : zrfisaac@gmail.com
rem # - site : zrfisaac.github.io
rem # - version : zrfisaac.all : 25.8.29.1

rem # [ batch ]
set _local=%~p0
set _local=%_local:\=%
call git pull
for /d %%z in (%~dp0*) do (
	if exist "%%z\about.zrfi" (
		if exist "%%z\all.bat" (
			echo %%z
			if "%_local%" equ "zrfisaac" copy all.bat "%%z\all.bat"
			cd "%%z"
			call %%z\all.bat
			cd "%~dp0"
		)
	) else (
		for /d %%y in (%%z\*) do (
			if exist "%%y\about.zrfi" (
				if exist "%%y\all.bat" (
					if exist "%%y\all.bat" (
						echo %%y
						if "%_local%" equ "zrfisaac" copy all.bat "%%y\all.bat"
						cd "%%y"
						call %%y\all.bat
						cd "%~dp0"
					)
				)
			)
		)
	)
)
rem pause
