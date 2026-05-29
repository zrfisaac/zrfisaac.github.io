@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion
rem # [ zrfisaac ]

rem # [ about ]
rem # - author : Isaac Caires Santana
rem # . - email : zrfisaac@gmail.com
rem # . - site : zrfisaac.github.io
rem # - version : zrfisaac.batch.tabela : 26.5.19.1

rem # [ batch ]

rem # : - config
if exist %~dp0\config.bat call %~dp0\config.bat
if exist %~dp0\_config.bat call %~dp0\_config.bat
if exist %~dp0\_.bat call %~dp0\_.bat

rem # : - special
set s_double_quotes="
set s_single_quotes='
set s_asterisk=*
set s_caret=^^
set s_space= 
set s_equals=^=
set s_greater=^>
set s_plus=+
set s_less=^<
set s_minus=-
set s_percentage=%%
set s_tab=	

rem # : - begin
echo # - : %~dpnx0
for /f "skip=1 tokens=1-6 delims=," %%a in (debug.table.csv) do (
	set "_tabela=%%a"
	if "!_tabela!" neq "" set "_tabela=!_tabela:%s_space%=!"
	if "!_tabela!" neq "" set "_tabela=!_tabela:%s_tab%=!"

	set "_campo=%%b"
	if "!_campo!" neq "" set "_campo=!_campo:%s_space%=!"
	if "!_campo!" neq "" set "_campo=!_campo:%s_tab%=!"

	set "_tipo=%%c"
	if "!_tipo!" neq "" set "_tipo=!_tipo:%s_space%=!"
	if "!_tipo!" neq "" set "_tipo=!_tipo:%s_tab%=!"

	set "_nulo=%%d"
	if "!_nulo!" neq "" set "_nulo=!_nulo:%s_space%=!"
	if "!_nulo!" neq "" set "_nulo=!_nulo:%s_tab%=!"

	set "_unico=%%e"
	if "!_unico!" neq "" set "_unico=!_unico:%s_space%=!"
	if "!_unico!" neq "" set "_unico=!_unico:%s_tab%=!"

	set "_padrao=%%f"
	if "!_padrao!" neq "" set "_padrao=!_padrao:%s_space%=!"
	if "!_padrao!" neq "" set "_padrao=!_padrao:%s_tab%=!"

	echo "!_tabela!" ^| "!_campo!" ^| "!_tipo!" ^| "!_nulo!" ^| "!_unico!" ^| "!_padrao!"
)

rem # : - end
echo # . - end
set /p _=
