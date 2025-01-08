// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io

// # [ delphi ]
unit uUnitConfig;

interface

uses
  // Delphi
  System.SysUtils,
  System.IniFiles,
  System.Win.Registry,
  System.Classes,
  Winapi.Windows;

type
  IConfig = interface
    ['{EC2853C3-ADB5-461B-9571-0A9522A4ADD8}']
    function Write(APath, AGroup, AName, AValue: string): string; overload;
    function Write(AGroup, AName, AValue: string): string; overload;
    function Write(AName, AValue: string): string; overload;
    function Write(AName: string): string; overload;
    function Read(APath, AGroup, AName, AValue: string): string; overload;
    function Read(AGroup, AName, AValue: string): string; overload;
    function Read(AName, AValue: string): string; overload;
    function Read(AName: string): string; overload;
  end;

  TConfigBase = class(TInterfacedObject, IConfig)
  private
    FPath: string;
    FGroup: string;
  public
    property Path: string read FPath write FPath;
    property Group: string read FGroup write FGroup;
    function Write(APath, AGroup, AName, AValue: string): string; overload; virtual;
    function Write(AGroup, AName, AValue: string): string; overload;
    function Write(AName, AValue: string): string; overload;
    function Write(AName: string): string; overload;
    function Read(APath, AGroup, AName, AValue: string): string; overload; virtual;
    function Read(AGroup, AName, AValue: string): string; overload;
    function Read(AName, AValue: string): string; overload;
    function Read(AName: string): string; overload;
  end;

  TConfigIni = class(TConfigBase)
  public
    function Write(APath, AGroup, AName, AValue: string): string; overload; override;
    function Read(APath, AGroup, AName, AValue: string): string; overload; override;
  end;

  TConfigReg = class(TConfigBase)
  public
    function Write(APath, AGroup, AName, AValue: string): string; overload; override;
    function Read(APath, AGroup, AName, AValue: string): string; overload; override;
  end;

function Config(AClass: TComponentClass = nil): TConfigBase;

implementation

var
  VConfig: TConfigBase;

function Config(AClass: TComponentClass = nil): TConfigBase;
var
  AResult: TConfigBase;
begin
  if (Assigned(AClass)) then
  begin
    AResult := TConfigBase(AClass.NewInstance);
    AResult.Create;
    VConfig := AResult;
  end
  else
  begin
    if not(Assigned(VConfig)) then
    begin
      VConfig := TConfigIni.Create;
      VConfig.FPath := GetCurrentDir + '\' + 'config.ini';
      VConfig.FGroup := 'main';
    end;
    AResult := VConfig
  end;
  Result := AResult;
end;

{ TConfigBase }

function TConfigBase.Write(APath, AGroup, AName, AValue: string): string;
begin
  // Virtual Method
end;

function TConfigBase.Write(AGroup, AName, AValue: string): string;
begin
  Result := Self.Write(Self.FPath, AGroup, AName, AValue);
end;

function TConfigBase.Write(AName, AValue: string): string;
begin
  Result := Self.Read(Self.FPath, Self.FGroup, AName, AValue);
end;

function TConfigBase.Write(AName: string): string;
begin
  Result := Self.Read(Self.FPath, Self.FGroup, AName, '');
end;

function TConfigBase.Read(APath, AGroup, AName, AValue: string): string;
begin
  // Virtual Method
end;

function TConfigBase.Read(AGroup, AName, AValue: string): string;
begin
  Result := Self.Read(Self.FPath, AGroup, AName, AValue);
end;

function TConfigBase.Read(AName, AValue: string): string;
begin
  Result := Self.Read(Self.FPath, Self.FGroup, AName, AValue);
end;

function TConfigBase.Read(AName: string): string;
begin
  Result := Self.Read(Self.FPath, Self.FGroup, AName, '');
end;

{ TConfigIni }

function TConfigIni.Write(APath, AGroup, AName, AValue: string): string;
var
  AResult: string;
  AIniFile: TIniFile;
begin
  AResult := '';
  AIniFile := TIniFile.Create(APath);
  try
    AIniFile.WriteString(AGroup, AName, AValue);
    AResult := AValue;
  finally
    AIniFile.Free;
  end;
  Result := AResult;
end;

function TConfigIni.Read(APath, AGroup, AName, AValue: string): string;
var
  AResult: string;
  AIniFile: TIniFile;
begin
  AResult := '';
  AIniFile := TIniFile.Create(APath);
  try
    AResult := AIniFile.ReadString(AGroup, AName, AValue);
    AIniFile.WriteString(AGroup, AName, AResult);
  finally
    AIniFile.Free;
  end;
  Result := AResult;
end;

{ TConfigReg }

function TConfigReg.Write(APath, AGroup, AName, AValue: string): string;
var
  AResult: string;
  ARegistry: TRegistry;
begin
  AResult := '';
  ARegistry := TRegistry.Create(KEY_ALL_ACCESS);
  try
    if (APath = 'HKEY_CLASSES_ROOT') then
      ARegistry.RootKey := HKEY_CLASSES_ROOT
    else if (APath = 'HKEY_CURRENT_USER') then
      ARegistry.RootKey := HKEY_CURRENT_USER
    else if (APath = 'HKEY_LOCAL_MACHINE') then
      ARegistry.RootKey := HKEY_LOCAL_MACHINE
    else if (APath = 'HKEY_USERS') then
      ARegistry.RootKey := HKEY_USERS
    else
      ARegistry.RootKey := HKEY_CURRENT_USER;
    if ARegistry.OpenKey(AGroup, True) then
    begin
      ARegistry.WriteString(AName, AValue);
      AResult := ARegistry.ReadString(AName);
      ARegistry.CloseKey;
    end;
  finally
    ARegistry.Free;
  end;
  Result := AResult;
end;

function TConfigReg.Read(APath, AGroup, AName, AValue: string): string;
var
  AResult: string;
  ARegistry: TRegistry;
begin
  AResult := '';
  ARegistry := TRegistry.Create(KEY_ALL_ACCESS);
  try
    if (APath = 'HKEY_CLASSES_ROOT') then
      ARegistry.RootKey := HKEY_CLASSES_ROOT
    else if (APath = 'HKEY_CURRENT_USER') then
      ARegistry.RootKey := HKEY_CURRENT_USER
    else if (APath = 'HKEY_LOCAL_MACHINE') then
      ARegistry.RootKey := HKEY_LOCAL_MACHINE
    else if (APath = 'HKEY_USERS') then
      ARegistry.RootKey := HKEY_USERS
    else
      ARegistry.RootKey := HKEY_CURRENT_USER;
    if ARegistry.OpenKey(AGroup, True) then
    begin
      AResult := ARegistry.ReadString(AName);
      if (AResult = '') then
        AResult := AValue;
      ARegistry.WriteString(AName, AResult);
      ARegistry.CloseKey;
    end;
  finally
    ARegistry.Free;
  end;
  Result := AResult;
end;

end.

