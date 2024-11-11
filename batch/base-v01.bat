@echo off
REM [ zrfisaac ]

REM [ about ]
REM - author : Isaac Caires
REM . - email : zrfisaac@gmail.com
REM . - site : zrfisaac.github.io
REM version : zrfisaac.batch.base.v01 : 1.0.0

REM [ batch ]

REM - variable
set v_end_error=false
set v_end_message=

REM : - about
echo # [ about ]
echo # - author : Isaac Caires
echo # . - email : zrfisaac@gmail.com
echo # . - site : zrfisaac.github.io
echo # - version : zrfisaac.batch.base.v01 : 1.0.0
echo.

REM : - main
if "%v_end_error%" == "false" (
    echo # [ main ]
    (
        REM : - routine
        echo # - routine
    ) || (
        set v_end_error=true
        set v_end_message=An error occurred during the routine.
    )
    echo.
)

REM : - end
echo # [ end ]
if "%v_end_error%" == "true" (
    echo # - error
) else (
    echo # - success
)
if defined v_end_message (
    echo # . - message : %v_end_message%
)
pause
