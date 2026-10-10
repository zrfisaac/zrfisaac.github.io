@echo off
chcp 65001 >nul
setlocal
rem # [ zrfisaac ]

rem # [ about ]
rem # - author : Isaac Caires Santana
rem # . - email : zrfisaac@gmail.com
rem # . - site : zrfisaac.github.io
rem # - version : zrfisaac.batch.lower : 26.9.12.1

rem # [ batch ]

rem # : - config
if exist %~dp0\config.bat call %~dp0\config.bat
if exist %~dp0\_config.bat call %~dp0\_config.bat
if exist %~dp0\_.bat call %~dp0\_.bat

rem # : - begin
echo # - : %~dpnx0

rem # : - lower
echo # . - lower
set "_lower_root=%~dp0"
set "_lower_script=%~f0"

rem # . - data
set "_lower_code=$ErrorActionPreference='Stop';$root=[IO.Path]::GetFullPath($env:_lower_root).TrimEnd([char]92);$script=[IO.Path]::GetFullPath($env:_lower_script);"
set "_lower_code=%_lower_code%$utf8=[Text.NormalizationForm]::FormD;$normal=[Text.NormalizationForm]::FormC;"

rem # . - items
set "_lower_code=%_lower_code%$items=@(Get-ChildItem -LiteralPath $root -Recurse -Force | Where-Object {$_.FullName-ne$script-and$_.FullName-notlike($root+'\.git\*')-and$_.FullName-notlike($root+'\.godot\*')} | Sort-Object {$_.FullName.Length} -Descending);"

rem # . - rename
set "_lower_code=%_lower_code%foreach($item in $items){$old=$item.FullName;$name=$item.Name.ToLowerInvariant().Normalize($utf8);"
set "_lower_code=%_lower_code%$name=-join @($name.ToCharArray() | Where-Object {[Globalization.CharUnicodeInfo]::GetUnicodeCategory($_)-ne[Globalization.UnicodeCategory]::NonSpacingMark});"
set "_lower_code=%_lower_code%$name=$name.Normalize($normal)-replace'\s+','-' -replace'[^a-z0-9._-]','' -replace'-+','-' -replace'-+\.','.';$name=$name.Trim('-');"
set "_lower_code=%_lower_code%if(!$name){Write-Host('# ! - nome vazio : '+$old);continue};$parent=[IO.Path]::GetDirectoryName($old);$new=Join-Path $parent $name;"
set "_lower_code=%_lower_code%if($old-ceq$new){continue};if($old-ieq$new){$temp=Join-Path $parent ('.lower-'+[guid]::NewGuid().ToString('N'));Rename-Item -LiteralPath $old -NewName $temp;Rename-Item -LiteralPath $temp -NewName $name;Write-Host('# . . - '+$item.Name+' : '+$name);continue};"
set "_lower_code=%_lower_code%if(Test-Path -LiteralPath $new){Write-Host('# ! - ja existe : '+$new);continue};Rename-Item -LiteralPath $old -NewName $name;Write-Host('# . . - '+$item.Name+' : '+$name)};"

powershell -NoProfile -ExecutionPolicy Bypass -Command "%_lower_code%"

if errorlevel 1 echo # ! - erro ao corrigir os nomes

rem # : - end
echo # . - end
set /p _=
