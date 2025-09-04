// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires Santana
// # - email : zrfisaac@gmail.com
// # - site : zrfisaac.github.io
// # - version : zrfisaac.uzrfidebug : 25.9.4.1

// # [ delphi ]
unit uzrfidebug;

interface

uses
  System.Classes,
  System.SysUtils;

procedure ZRFIDebug(_pValue: string);

var
  ZRFIDebugFile: string;

implementation

procedure ZRFIDebug(_pValue: string);
var
  _vFile: TStrings;
begin
  _vFile := TStringList.Create;
  if FileExists(ZRFIDebugFile) then
    _vFile.LoadFromFile(ZRFIDebugFile);
  _vFile.Add(FormatDateTime('yyyy-MM-dd hh:mm:ss.zzz',Now) + ' : ' + _pValue);
  _vFile.SaveToFile(ZRFIDebugFile);
end;

initialization
  ZRFIDebugFile := ExtractFileDir(ParamStr(0)) + '\Debug.txt';
  ZRFIDebugFile := 'C:\Temp\Debug.txt'
end.

