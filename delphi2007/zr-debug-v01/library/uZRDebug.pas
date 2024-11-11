// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io
// # - version : zrfisaac.delphi2007.zr.debug.v01 : 1.0.0

// # [ delphi2007 ]
unit uZRDebug;

interface

uses
  Classes,
  SysUtils;

procedure fnZRDebug(_pValue: String); overload;

implementation

var
  vI0: Integer;
  vPath: string;

procedure fnZRDebug(_pValue: String); overload;
var
  _vList: TStrings;
begin
  _vList := TStringList.Create;
  if (FileExists(vPath)) then
    _vList.LoadFromFile(vPath);
  _vList.Add(_pValue);
  _vList.SaveToFile(vPath);
  _vList.Free;
end;

initialization
  vI0 := 0;
  repeat
    Inc(vI0);
    vPath := GetCurrentDir + '\' + '_LOG-' + Format('%.4d', [vI0]) + '.txt';
  until not FileExists(vPath);
finalization
end.

