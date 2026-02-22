// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires Santana
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io
// # - version : zrfisaac.delphi7.base : 26.2.21.1

// # [ delphi7 ]
unit base;

interface

uses
  Classes,
  ShellAPI,
  Forms,
  SysUtils,
  Windows;

function fnConfig: TStrings; overload;
function fnConfig(_pName: string): string; overload;
function fnConfigB(_pName: string): Boolean; overload;
function fnConfigB(_pName: string; _pValue: Boolean): Boolean; overload;
function  fnConfigPath: string; overload;
procedure fnConfigWrite; overload;
procedure fnConfigRead; overload;
procedure fnFileAdd(_pPath: string; _pText: string = '');
procedure fnFolderDelete(_pPath: string);
function fnReplace(_pText: string; _pOld : string; _pNew : string): string;
function fnVersion(_pName: string = ''; _pPath: string = ''): string;

implementation

var
  vConfig: TStrings;

function fnConfig: TStrings;
begin
  if not Assigned(vConfig) then
  begin
    vConfig := TStringList.Create;
    if not FileExists(fnConfigPath) then
      fnConfigWrite;
  end;
  Result := vConfig;
end;

function fnConfig(_pName: string): string;
begin
  Result := fnConfig.Values[_pName];
end;

function fnConfigB(_pName: string): Boolean; overload;
begin
  Result := StrToBoolDef(fnConfig(_pName),False);
end;

function fnConfigB(_pName: string; _pValue: Boolean): Boolean; overload;
begin
  fnConfig.Values[_pName] := BoolToStr(_pValue,True);
  fnConfigWrite;
  Result := _pValue;
end;

function fnConfigPath: string;
begin
  Result := ExtractFileDir(ParamStr(0)) + '\config.cfg';
end;

procedure fnConfigWrite;
begin
  fnConfig.SaveToFile(fnConfigPath);
end;

procedure fnConfigRead;
begin
  fnConfig.LoadFromFile(fnConfigPath);
end;

procedure fnFileAdd(_pPath: string; _pText: string = '');
var
  _vFile: TStrings;
begin
  try
    _vFile := TStringList.Create;
    if FileExists(_pPath) then
      _vFile.LoadFromFile(_pPath);
    _vFile.Add(_pText);
    _vFile.SaveToFile(_pPath);
    _vFile.Free;
  except
  end;
end;

procedure fnFolderDelete(_pPath: string);
var
  _vOp: TSHFileOpStruct;
begin
  FillChar(_vOp, SizeOf(_vOp), 0);
  _vOp.wFunc  := FO_DELETE;
  _vOp.pFrom  := PChar(_pPath + #0);
  _vOp.fFlags := FOF_NOCONFIRMATION or
                FOF_NOERRORUI or
                FOF_SILENT;

  SHFileOperation(_vOp);
end;

function fnReplace(
  _pText : string;
  _pOld  : string;
  _pNew  : string
): string;
var
  _vSearchText : string;
  _vSearchOld  : string;
  _vPos        : Integer;
begin
  Result := _pText;

  if _pOld = '' then
    Exit;

  _vSearchText := AnsiLowerCase(Result);
  _vSearchOld  := AnsiLowerCase(_pOld);

  _vPos := Pos(_vSearchOld, _vSearchText);

  while _vPos > 0 do
  begin
    Delete(Result, _vPos, Length(_pOld));
    Insert(_pNew, Result, _vPos);

    Delete(_vSearchText, _vPos, Length(_pOld));
    Insert(_pNew, _vSearchText, _vPos);

    _vPos := Pos(_vSearchOld, _vSearchText);
  end;
end;

function fnVersion(_pName: string = ''; _pPath: string = ''): string;
var
  _vSize: DWORD;
  _vHandle: DWORD;
  _vBuffer: Pointer;
  _vLang: Pointer;
  _vLangSize: UINT;
  _vQuery: string;
  _vValue: PChar;
  _vValueSize: UINT;
  _vLangID: string;
begin
  Result := '';

  if (_pName = '') then
    _pName := 'FileVersion';
  if (_pPath = '') then
    _pPath := ParamStr(0);

  if not FileExists(_pPath) then
    Exit;

  _vSize := GetFileVersionInfoSize(PChar(_pPath), _vHandle);
  if _vSize = 0 then
    Exit;

  GetMem(_vBuffer, _vSize);
  try
    if not GetFileVersionInfo(PChar(_pPath), 0, _vSize, _vBuffer) then
      Exit;

    if not VerQueryValue(
      _vBuffer,
      '\VarFileInfo\Translation',
      _vLang,
      _vLangSize
    ) then
      Exit;

    _vLangID :=
      IntToHex(LoWord(Longint(_vLang^)), 4) +
      IntToHex(HiWord(Longint(_vLang^)), 4);

    _vQuery :=
      '\StringFileInfo\' + _vLangID + '\' + _pName;

    if VerQueryValue(
      _vBuffer,
      PChar(_vQuery),
      Pointer(_vValue),
      _vValueSize
    ) then
      Result := _vValue;

  finally
    FreeMem(_vBuffer);
  end;
end;

initialization
  fnConfigRead;
finalization
  fnConfigWrite;
end.

