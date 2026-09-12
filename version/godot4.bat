@echo off
chcp 65001 >nul
setlocal
rem # [ zrfisaac ]

rem # [ about ]
rem # - author : Isaac Caires Santana
rem # . - email : zrfisaac@gmail.com
rem # . - site : zrfisaac.github.io
rem # - version : zrfisaac.version.godot4 : 26.9.12.1

rem # [ batch ]

rem # : - config
if exist %~dp0\config.bat call %~dp0\config.bat
if exist %~dp0\_config.bat call %~dp0\_config.bat
if exist %~dp0\_.bat call %~dp0\_.bat

rem # : - begin
echo # - : %~dpnx0

rem # : - version
echo # . - version
for /f "tokens=1,* delims=|" %%a in ('powershell -NoProfile -Command "$line = @([IO.File]::ReadAllLines('%~dp0about.zrfi') -match '^\s*#\s*-\s*version\s*:')[0]; if ($line -match '^\s*#\s*-\s*version\s*:\s*(.*?)\s*:\s*([0-9]+(?:\.[0-9]+){1,3})\s*$') { $matches[1] + '|' + $matches[2] }"') do (
	set "_version_id=%%a"
	set "_version_number=%%b"
)

for /f "delims=" %%a in ('powershell -NoProfile -Command "$line = @([IO.File]::ReadAllLines('%~dp0about.zrfi') -match '^\s*#\s*-\s*name\s*:')[0]; if ($line -match '^\s*#\s*-\s*name\s*:\s*(.*?)\s*$') { $matches[1] }"') do set "_version_name=%%a"

for /f "delims=" %%a in ('powershell -NoProfile -Command "$line = @([IO.File]::ReadAllLines('%~dp0about.zrfi') -match '^\s*#\s*-\s*code\s*:')[0]; if ($line -match '^\s*#\s*-\s*code\s*:\s*([1-9][0-9]*)\s*$') { $matches[1] }"') do set "_version_code=%%a"

if not defined _version_id (
	echo # ! - about.zrfi invalido
	echo # ! . use: # - version : nome.unico.do.jogo : 26.9.12.1
	goto :end
)

if not defined _version_name (
	echo # ! - about.zrfi invalido
	echo # ! . use: # - name : Nome do Jogo
	goto :end
)

if not defined _version_code (
	echo # ! - about.zrfi invalido
	echo # ! . use: # - code : 1
	goto :end
)

set "_version_root=%~dp0"

rem # . - data
set "_version_script=$ErrorActionPreference='Stop';$r=$env:_version_root;$id=$env:_version_id;$n=$env:_version_name;$v=$env:_version_number;$vc=[int64]$env:_version_code;"
set "_version_script=%_version_script%$u=New-Object System.Text.UTF8Encoding($false);"
set "_version_script=%_version_script%function read($f){[IO.File]::ReadAllText((Join-Path $r $f))}"
set "_version_script=%_version_script%function save($f,$t){[IO.File]::WriteAllText((Join-Path $r $f),$t,$u)}"
set "_version_script=%_version_script%$gn=$n.Replace([string][char]92,([string][char]92+[char]92)).Replace([string][char]34,([string][char]92+[char]34));"

rem # . - export name
set "_version_script=%_version_script%$en=($n-replace'[\x00-\x1F\x22<>:/\\|?*]','-')-replace'[ .]+$','';"
set "_version_script=%_version_script%$pn=(($id.ToLowerInvariant()-replace'[^a-z0-9_.]+','.')-replace'^\.+|\.+$','');"
set "_version_script=%_version_script%$pp=@($pn-split'\.').Where({$_});"
set "_version_script=%_version_script%$pp=@($pp.ForEach({if($_-match'^[0-9]'){'v'+$_}else{$_}}));$pn=$pp-join'.';"
set "_version_script=%_version_script%if(!$en-or!$pn){throw'O nome da versao nao gera um nome de exportacao valido.'};"

rem # . - android code
set "_version_script=%_version_script%if($vc-gt2100000000){throw'A versao gera um version/code maior que o limite do Android.'};"

rem # . - project
set "_version_script=%_version_script%$p=read 'project.godot';"
set "_version_script=%_version_script%$p=$p-replace'(?m)^config/name=.*$',('config/name='+[char]34+$gn+[char]34);"
set "_version_script=%_version_script%$p=$p-replace'(?m)^config/version=.*$',('config/version='+[char]34+$v+[char]34);save 'project.godot' $p;"

rem # . - presets
set "_version_script=%_version_script%$e=read 'export_presets.cfg';$ep='(?m)^(export_path=.*/)[^/]+(\.[^.\r\n]+)'+[char]34+'$';"
set "_version_script=%_version_script%$e=$e-replace $ep,('${1}'+$en+'$2'+[char]34);$e=$e-replace'(?m)^version/code=.*$',('version/code='+$vc);"
set "_version_script=%_version_script%$m=@{'version/name'=$v;'package/unique_name'=$pn;'package/name'=$gn;'application/file_version'=$v;'application/product_version'=$v;'application/product_name'=$gn;'application/file_description'=$id};"
set "_version_script=%_version_script%foreach($k in $m.Keys){$e=$e-replace('(?m)^'+[regex]::Escape($k)+'=.*$'),($k+'='+[char]34+$m[$k]+[char]34)};save 'export_presets.cfg' $e;"

rem # . - locale
set "_version_script=%_version_script%$c=read 'locale\version.csv';$ci=$id.Replace([string][char]34,([string][char]34+[char]34));"
set "_version_script=%_version_script%$cm=@{'AL_VERSION'=($ci+' : '+$v);'AL_VERSION_NAME'=$ci;'AL_VERSION_NUMBER'=$v};"
set "_version_script=%_version_script%foreach($k in $cm.Keys){$q=[char]34;$c=$c-replace('(?m)^'+$q+$k+$q+',.*$'),($q+$k+$q+','+$q+$cm[$k]+$q+','+$q+$cm[$k]+$q)};save 'locale\version.csv' $c;"

powershell -NoProfile -ExecutionPolicy Bypass -Command "%_version_script%"

if errorlevel 1 (
	echo # ! - erro ao atualizar a versao
	goto :end
)

echo # . . - nome : %_version_name%
echo # . . - unico : %_version_id%
echo # . . - numero : %_version_number%
echo # . . - android code : %_version_code%

rem # : - end
:end
echo # . - end
set /p _=
