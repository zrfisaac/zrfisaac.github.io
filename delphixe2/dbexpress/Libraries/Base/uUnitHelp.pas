// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io

// # [ delphi ]
unit uUnitHelp;

interface

uses
  // Delphi
  System.Classes,
  System.SysUtils,
  Winapi.Windows;

type
  TUnitHelp = class
  public
    class function FloatToStr(const AValue: Extended; const AFormat: String = '0.###'): string;
    class function ListToString(AList: TStrings; ASeparator :string = ';'): string;
    class function StringToDateTime(AValue: string): TDateTime;
    class function StringToList(AString: string; ASeparator :string = ';'): TStrings;
    class function Version: string;
    class procedure VersionInfo(var ANumber1, ANumber2, ANumber3, ANumber4: Word);
  end;

  UnitHelp = class(TUnitHelp);

implementation

{ TUnitHelp }

class function TUnitHelp.FloatToStr(const AValue: Extended; const AFormat: string): string;
var
  ASettings: TFormatSettings;
begin
  GetLocaleFormatSettings(GetThreadLocale, ASettings);
  ASettings.DecimalSeparator := '.';
  Result := FormatFloat(AFormat, AValue, ASettings);
end;

class function TUnitHelp.ListToString(AList: TStrings; ASeparator: string): string;
var
  I: Integer;
begin
  Result := '';
  for I := 0 to AList.Count-1 do
  begin
    if Result = '' then
      Result := AList[I]
    else
      Result := Result + ASeparator + AList[I];
  end;
end;

class function TUnitHelp.StringToDateTime(AValue: string): TDateTime;
var
  ASettings: TFormatSettings;
begin
  ASettings.DateSeparator := '-';
  ASettings.ShortDateFormat := 'yyyy-MM-dd';
  ASettings.TimeSeparator := ':';
  ASettings.ShortTimeFormat := 'hh:mm';
  ASettings.LongTimeFormat := 'hh:mm:ss';
  Result := StrToDateTime(AValue, ASettings);
end;

class function TUnitHelp.StringToList(AString: string; ASeparator: string): TStrings;
begin

end;

class function TUnitHelp.Version: string;
var
  ANumber1, ANumber2, ANumber3, ANumber4: Word;
begin
  TUnitHelp.VersionInfo(ANumber1, ANumber2, ANumber3, ANumber4);
  Result := IntToStr(ANumber1) + '.' + IntToStr(ANumber2) + '.' + IntToStr(ANumber3) + '.' + IntToStr(ANumber4);
end;

class procedure TUnitHelp.VersionInfo(var ANumber1, ANumber2, ANumber3, ANumber4: Word);
var
  ADummy: DWORD;
  AVersionInfo: Pointer;
  AVersionInfoSize: DWORD;
  AVersionValue: PVSFixedFileInfo;
  AVersionValueSize: DWORD;
begin
  AVersionInfoSize := GetFileVersionInfoSize(PChar(ParamStr(0)), ADummy);
  if AVersionInfoSize > 0 then
  begin
    GetMem(AVersionInfo, AVersionInfoSize);
    try
      if GetFileVersionInfo(PChar(ParamStr(0)), 0, AVersionInfoSize, AVersionInfo) then
      begin
        VerQueryValue(AVersionInfo, '\', Pointer(AVersionValue), AVersionValueSize);
        with AVersionValue^ do
        begin
          ANumber1 := dwFileVersionMS shr 16;
          ANumber2 := dwFileVersionMS and $FFFF;
          ANumber3 := dwFileVersionLS shr 16;
          ANumber4 := dwFileVersionLS and $FFFF;
        end;
      end;
    finally
      FreeMem(AVersionInfo, AVersionInfoSize);
    end;
  end;
end;

end.

