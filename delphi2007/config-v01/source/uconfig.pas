// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io

// # [ delphi2007 ]
unit uconfig;

interface

uses
  // : - delphi
  Classes,
  IniFiles,
  ExtCtrls,
  Forms,
  StdCtrls;

type
  TConfigHelp = class
    class function Base64ToStream(ABase64: String): TStream;
    class function CsvToList(ACsv: TStrings): TStrings;
    class function JsonToList(AJson: TStrings): TStrings;
    class function ListToCsv(AList: TStrings): TStrings;
    class function ListToString(AList: TStrings): String;
    class function ListToXml(AList: TStrings): TStrings;
    class function StreamToBase64(AStream: TStream): String;
    class function StringToList(AString: String): TStrings;
    class function XmlToList(AXml: TStrings): String;
  end;

  IConfig = interface
  ['{9800F853-7BC0-45A1-A693-A332435A15DA}']

    // Read Methods - String
    function Read(ALocal: String; AGroup: String; AName: String; AValue: String): String; overload;
    function Read(AGroup: String; AName: String; AValue: String): String; overload;
    function Read(AName: String; AValue: String): String; overload;
    function Read(AName: String): String; overload;

    // Read Methods - Integer
    function Read(ALocal: String; AGroup: String; AName: String; AValue: Integer): Integer; overload;
    function Read(AGroup: String; AName: String; AValue: Integer): Integer; overload;
    function Read(AName: String; AValue: Integer): Integer; overload;

    // Read Methods - Real
    function Read(ALocal: String; AGroup: String; AName: String; AValue: Real): Real; overload;
    function Read(AGroup: String; AName: String; AValue: Real): Real; overload;
    function Read(AName: String; AValue: Real): Real; overload;

    // Read Methods - Boolean
    function Read(ALocal: String; AGroup: String; AName: String; AValue: Boolean): Boolean; overload;
    function Read(AGroup: String; AName: String; AValue: Boolean): Boolean; overload;
    function Read(AName: String; AValue: Boolean): Boolean; overload;

    // Read Methods - TForm
    function Read(ALocal: String; AGroup: String; AName: String; AValue: TForm): TForm; overload;
    function Read(AGroup: String; AName: String; AValue: TForm): TForm; overload;
    function Read(AName: String; AValue: TForm): TForm; overload;

    // Read Methods - TPanel
    function Read(ALocal: String; AGroup: String; AName: String; AValue: TPanel): TPanel; overload;
    function Read(AGroup: String; AName: String; AValue: TPanel): TPanel; overload;
    function Read(AName: String; AValue: TPanel): TPanel; overload;

    // Read Methods - TEdit
    function Read(ALocal: String; AGroup: String; AName: String; AValue: TEdit): TEdit; overload;
    function Read(AGroup: String; AName: String; AValue: TEdit): TEdit; overload;
    function Read(AName: String; AValue: TEdit): TEdit; overload;

    // Write Methods - String
    function Write(ALocal: String; AGroup: String; AName: String; AValue: String): String; overload;
    function Write(AGroup: String; AName: String; AValue: String): String; overload;
    function Write(AName: String; AValue: String): String; overload;

    // Write Methods - Integer
    function Write(ALocal: String; AGroup: String; AName: String; AValue: Integer): Integer; overload;
    function Write(AGroup: String; AName: String; AValue: Integer): Integer; overload;
    function Write(AName: String; AValue: Integer): Integer; overload;

    // Write Methods - Real
    function Write(ALocal: String; AGroup: String; AName: String; AValue: Real): Real; overload;
    function Write(AGroup: String; AName: String; AValue: Real): Real; overload;
    function Write(AName: String; AValue: Real): Real; overload;

    // Write Methods - Boolean
    function Write(ALocal: String; AGroup: String; AName: String; AValue: Boolean): Boolean; overload;
    function Write(AGroup: String; AName: String; AValue: Boolean): Boolean; overload;
    function Write(AName: String; AValue: Boolean): Boolean; overload;

    // Write Methods - TForm
    function Write(ALocal: String; AGroup: String; AName: String; AValue: TForm): TForm; overload;
    function Write(AGroup: String; AName: String; AValue: TForm): TForm; overload;
    function Write(AName: String; AValue: TForm): TForm; overload;

    // Write Methods - TPanel
    function Write(ALocal: String; AGroup: String; AName: String; AValue: TPanel): TPanel; overload;
    function Write(AGroup: String; AName: String; AValue: TPanel): TPanel; overload;
    function Write(AName: String; AValue: TPanel): TPanel; overload;

    // Write Methods - TEdit
    function Write(ALocal: String; AGroup: String; AName: String; AValue: TEdit): TEdit; overload;
    function Write(AGroup: String; AName: String; AValue: TEdit): TEdit; overload;
    function Write(AName: String; AValue: TEdit): TEdit; overload;
  end;

  TConfigBase = class(TInterfacedObject, IConfig)
  private
  private
    // Variables
    FLocal: String;
    FGroup: String;
    FName: String;

    // Get Methods
    function GetLocal: String; overload; virtual; abstract;
    function GetGroup: String; overload; virtual; abstract;
    function GetName: String; overload; virtual; abstract;

    // Set Methods
    procedure SetLocal(ALocal: String); virtual; abstract;
    procedure SetGroup(AGroup: String); virtual; abstract;
    procedure SetName(AName: String); virtual; abstract;
  public
    // Attributes
    property Local: String read GetLocal write SetLocal;
    property Group: String read GetGroup write SetGroup;
    property Name: String read GetName write SetName;

    // Constructors
    constructor Create; virtual; abstract;

    // Read Methods - String
    function Read(ALocal: String; AGroup: String; AName: String; AValue: String): String; overload; virtual; abstract;
    function Read(AGroup: String; AName: String; AValue: String): String; overload; virtual; abstract;
    function Read(AName: String; AValue: String): String; overload; virtual; abstract;
    function Read(AName: String): String; overload; virtual; abstract;

    // Read Methods - Integer
    function Read(ALocal: String; AGroup: String; AName: String; AValue: Integer): Integer; overload; virtual; abstract;
    function Read(AGroup: String; AName: String; AValue: Integer): Integer; overload; virtual; abstract;
    function Read(AName: String; AValue: Integer): Integer; overload; virtual; abstract;

    // Read Methods - Real
    function Read(ALocal: String; AGroup: String; AName: String; AValue: Real): Real; overload; virtual; abstract;
    function Read(AGroup: String; AName: String; AValue: Real): Real; overload; virtual; abstract;
    function Read(AName: String; AValue: Real): Real; overload; virtual; abstract;

    // Read Methods - Boolean
    function Read(ALocal: String; AGroup: String; AName: String; AValue: Boolean): Boolean; overload; virtual; abstract;
    function Read(AGroup: String; AName: String; AValue: Boolean): Boolean; overload; virtual; abstract;
    function Read(AName: String; AValue: Boolean): Boolean; overload; virtual; abstract;

    // Read Methods - TForm
    function Read(ALocal: String; AGroup: String; AName: String; AValue: TForm): TForm; overload; virtual; abstract;
    function Read(AGroup: String; AName: String; AValue: TForm): TForm; overload; virtual; abstract;
    function Read(AName: String; AValue: TForm): TForm; overload; virtual; abstract;

    // Read Methods - TPanel
    function Read(ALocal: String; AGroup: String; AName: String; AValue: TPanel): TPanel; overload; virtual; abstract;
    function Read(AGroup: String; AName: String; AValue: TPanel): TPanel; overload; virtual; abstract;
    function Read(AName: String; AValue: TPanel): TPanel; overload; virtual; abstract;

    // Read Methods - TEdit
    function Read(ALocal: String; AGroup: String; AName: String; AValue: TEdit): TEdit; overload; virtual; abstract;
    function Read(AGroup: String; AName: String; AValue: TEdit): TEdit; overload; virtual; abstract;
    function Read(AName: String; AValue: TEdit): TEdit; overload; virtual; abstract;

    // Write Methods - String
    function Write(ALocal: String; AGroup: String; AName: String; AValue: String): String; overload; virtual; abstract;
    function Write(AGroup: String; AName: String; AValue: String): String; overload; virtual; abstract;
    function Write(AName: String; AValue: String): String; overload; virtual; abstract;

    // Write Methods - Integer
    function Write(ALocal: String; AGroup: String; AName: String; AValue: Integer): Integer; overload; virtual; abstract;
    function Write(AGroup: String; AName: String; AValue: Integer): Integer; overload; virtual; abstract;
    function Write(AName: String; AValue: Integer): Integer; overload; virtual; abstract;

    // Write Methods - Real
    function Write(ALocal: String; AGroup: String; AName: String; AValue: Real): Real; overload; virtual; abstract;
    function Write(AGroup: String; AName: String; AValue: Real): Real; overload; virtual; abstract;
    function Write(AName: String; AValue: Real): Real; overload; virtual; abstract;

    // Write Methods - Boolean
    function Write(ALocal: String; AGroup: String; AName: String; AValue: Boolean): Boolean; overload; virtual; abstract;
    function Write(AGroup: String; AName: String; AValue: Boolean): Boolean; overload; virtual; abstract;
    function Write(AName: String; AValue: Boolean): Boolean; overload; virtual; abstract;

    // Write Methods - TForm
    function Write(ALocal: String; AGroup: String; AName: String; AValue: TForm): TForm; overload; virtual; abstract;
    function Write(AGroup: String; AName: String; AValue: TForm): TForm; overload; virtual; abstract;
    function Write(AName: String; AValue: TForm): TForm; overload; virtual; abstract;

    // Write Methods - TPanel
    function Write(ALocal: String; AGroup: String; AName: String; AValue: TPanel): TPanel; overload; virtual; abstract;
    function Write(AGroup: String; AName: String; AValue: TPanel): TPanel; overload; virtual; abstract;
    function Write(AName: String; AValue: TPanel): TPanel; overload; virtual; abstract;

    // Write Methods - TEdit
    function Write(ALocal: String; AGroup: String; AName: String; AValue: TEdit): TEdit; overload; virtual; abstract;
    function Write(AGroup: String; AName: String; AValue: TEdit): TEdit; overload; virtual; abstract;
    function Write(AName: String; AValue: TEdit): TEdit; overload; virtual; abstract;
  end;

  (*
  TConfigIni = class(TConfigBase)
  end;

  TConfigJson = class(TConfigBase)
  end;

  TConfigReg = class(TConfigBase)
  end;

  TConfigXml = class(TConfigBase)
  end;
  *)

implementation

{ TConfigHelp }

class function TConfigHelp.Base64ToStream(ABase64: String): TStream;
begin

end;

class function TConfigHelp.CsvToList(ACsv: TStrings): TStrings;
begin

end;

class function TConfigHelp.JsonToList(AJson: TStrings): TStrings;
begin

end;

class function TConfigHelp.ListToCsv(AList: TStrings): TStrings;
begin

end;

class function TConfigHelp.ListToString(AList: TStrings): String;
begin

end;

class function TConfigHelp.ListToXml(AList: TStrings): TStrings;
begin

end;

class function TConfigHelp.StreamToBase64(AStream: TStream): String;
begin

end;

class function TConfigHelp.StringToList(AString: String): TStrings;
begin

end;

class function TConfigHelp.XmlToList(AXml: TStrings): String;
begin

end;

end.

