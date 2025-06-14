// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires Santana
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io
// # - version : zrfisaac.zrlib : 25.6.11.1

// # [ delphi ]
unit zrlib;

interface

uses
  Windows,
  SysUtils;

type
  TLanguageAndCodePage = record
    wLanguage: Word;
    wCodePage: Word;
  end;
  PLanguageAndCodePage = ^TLanguageAndCodePage;

function ZRFileVersion(AFileName: string = ''): string; overload;
function ZRInternalName(AFileName: string = ''): string; overload;


implementation

function ZRFileVersion(AFileName: string): string; overload;
var
  InfoSize, Handle: DWORD;
  InfoData: Pointer;
  FileInfo: PVSFixedFileInfo;
  Len: UINT;
begin
  Result := '';
  if (AFileName = '') then
    AFileName := ParamStr(0);
  if FileExists(AFileName) then
  begin
    Result := '';
    InfoSize := GetFileVersionInfoSize(PChar(AFileName), Handle);
    if InfoSize = 0 then Exit;

    GetMem(InfoData, InfoSize);
    try
      if not GetFileVersionInfo(PChar(AFileName), Handle, InfoSize, InfoData) then Exit;

      if VerQueryValue(InfoData, '\\', Pointer(FileInfo), Len) then
      begin
        Result := Format('%d.%d.%d.%d',
          [HiWord(FileInfo^.dwFileVersionMS), LoWord(FileInfo^.dwFileVersionMS),
           HiWord(FileInfo^.dwFileVersionLS), LoWord(FileInfo^.dwFileVersionLS)]);
      end;
    finally
      FreeMem(InfoData);
    end;
  end;
end;

function ZRInternalName(AFileName: string = ''): string; overload;
var
  InfoSize, Handle: DWORD;
  InfoData: Pointer;
  LangInfo: PLanguageAndCodePage;
  LangLen: UINT;
  QueryPath: string;
  Value: PChar;
  Len: UINT;
begin
  Result := '';
  if (AFileName = '') then
    AFileName := ParamStr(0);
  if FileExists(AFileName) then
  begin
    InfoSize := GetFileVersionInfoSize(PChar(AFileName), Handle);
    if InfoSize = 0 then Exit;

    GetMem(InfoData, InfoSize);
    try
      if not GetFileVersionInfo(PChar(AFileName), Handle, InfoSize, InfoData) then Exit;

      // Get language and code page
      if VerQueryValue(InfoData, '\\VarFileInfo\\Translation', Pointer(LangInfo), LangLen) then
      begin
        QueryPath := Format('\\StringFileInfo\\%.4x%.4x\\InternalName',
          [LangInfo^.wLanguage, LangInfo^.wCodePage]);
        if VerQueryValue(InfoData, PChar(QueryPath), Pointer(Value), Len) then
          Result := Value;
      end;
    finally
      FreeMem(InfoData);
    end;
  end;
end;

end.

