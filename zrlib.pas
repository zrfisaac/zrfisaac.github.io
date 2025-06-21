// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires Santana
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io
// # - version : zrfisaac.zrlib : 25.6.15.1

// # [ pascal ]
{$IFDEF FPC}
  {$DEFINE LAZARUS}
{$ELSE}
  {$DEFINE DELPHI}
  {$UNDEF LINUX}
  {$DEFINE WINDOWS}
{$ENDIF}
unit zrlib;

interface

uses
  // # : Delphi
  {$IFDEF WINDOWS}
  Windows,
  {$ENDIF}
  ExtCtrls,
  SysUtils,
  Classes,
  Variants,
  // # : Indy
  IdCoderMIME,
  IdTCPConnection,
  IdTCPClient,
  IdHTTP,
  IdBaseComponent,
  IdComponent,
  IdIOHandler,
  IdIOHandlerSocket,
  IdIOHandlerStack,
  IdSSL,
  IdSSLOpenSSL;


const
  ZR_INDY_AGENT = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36';
  ZR_INDY_JSON = 'application/json';
  ZR_INDY_PICTURE = 'application/octet-stream';


type
  TLanguageAndCodePage = record
    wLanguage: Word;
    wCodePage: Word;
  end;
  PLanguageAndCodePage = ^TLanguageAndCodePage;

function ZRDownload(_pURL: WideString; var _pStream: TMemoryStream): String;
function ZRFileVersion(_pFileName: string = ''): string; overload;
function ZRInternalName(_pFileName: string = ''): string; overload;
procedure ZRStreamSave(_pStream: TStream; _pFileName: String);


implementation

function ZRDownload(_pURL: WideString; var _pStream: TMemoryStream): String;
var
  _vResult: String;
  _vHTTP: TIdHTTP;
  _vResponse: TMemoryStream;
  _vSSL: TIdSSLIOHandlerSocketOpenSSL;
begin
  _vResult := '';
  try
    _vResponse := TMemoryStream.Create();
    _vHTTP := TIdHTTP.Create(Nil);
    _vSSL := TIdSSLIOHandlerSocketOpenSSL.Create(Nil);
    _vHTTP.IOHandler := _vSSL;
    _vSSL.SSLOptions.Method := sslvSSLv23;
    _vHTTP.Request.Clear;
    _vHTTP.Request.UserAgent := ZR_INDY_AGENT;
    _vHTTP.Request.ContentType := ZR_INDY_PICTURE;
    try
      _vHTTP.Get(_pURL, _vResponse);
      _vResult :=  IntToStr(_vHTTP.ResponseCode);
    except
      on e: EIdHTTPProtocolException do
        _vResult :=  IntToStr(_vHTTP.ResponseCode);
    end;
    _vResponse.Position := 0;
    _pStream := _vResponse;
    _vHTTP.Free;
    _vSSL.Free;
  except
    on e: Exception do
    begin
      _vResult := _vResult + e.Message;
    end;
  end;
  Result := _vResult;
end;

{$IFDEF LINUX}
function ZRFileVersion(_pFileName: string): string; overload;
begin
  Result := '';
end;
{$ENDIF}

{$IFDEF WINDOWS}
function ZRFileVersion(_pFileName: string): string; overload;
var
  InfoSize, Handle: DWORD;
  InfoData: Pointer;
  FileInfo: PVSFixedFileInfo;
  Len: UINT;
begin
  Result := '';
  if (_pFileName = '') then
    _pFileName := ParamStr(0);
  if FileExists(_pFileName) then
  begin
    Result := '';
    InfoSize := GetFileVersionInfoSize(PChar(_pFileName), Handle);
    if InfoSize = 0 then Exit;

    GetMem(InfoData, InfoSize);
    try
      if not GetFileVersionInfo(PChar(_pFileName), Handle, InfoSize, InfoData) then Exit;

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
{$ENDIF}

{$IFDEF LINUX}
function ZRInternalName(_pFileName: string = ''): string; overload;
begin
  Result := '';
end;
{$ENDIF}

{$IFDEF WINDOWS}
function ZRInternalName(_pFileName: string = ''): string; overload;
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
  if (_pFileName = '') then
    _pFileName := ParamStr(0);
  if FileExists(_pFileName) then
  begin
    InfoSize := GetFileVersionInfoSize(PChar(_pFileName), Handle);
    if InfoSize = 0 then Exit;

    GetMem(InfoData, InfoSize);
    try
      if not GetFileVersionInfo(PChar(_pFileName), Handle, InfoSize, InfoData) then Exit;

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
{$ENDIF}

procedure ZRStreamSave(_pStream: TStream; _pFileName: String);
var
  _vStream: TMemoryStream;
begin
  _vStream := TMemoryStream.Create;
  _vStream.LoadFromStream(_pStream);
  _vStream.SaveToFile(_pFileName);
  _vStream.Free;
end;

end.

