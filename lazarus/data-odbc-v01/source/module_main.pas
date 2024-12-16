// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io

// # [ lazarus ]
unit module_main;

{$mode ObjFPC}
{$H+}

interface

uses
  // # : - lazarus
  Classes,
  SysUtils,
  odbcconn,
  SQLDB,
  DB;

type

  { TModuleMain }

  TModuleMain = class(TDataModule)
    dtsSelect: TDataSource;
    conData: TODBCConnection;
    qryInsert: TSQLQuery;
    qryCreate: TSQLQuery;
    qrySelect: TSQLQuery;
    qryDelete: TSQLQuery;
    SQLQuery1: TSQLQuery;
    traData: TSQLTransaction;
  public
    procedure DataClose;
    procedure DataCreate;
    procedure DataDelete;
    procedure DataInsert;
    procedure DataOpen;
    procedure DataSelect;
  end;

var
  ModuleMain: TModuleMain;

implementation

{$R *.lfm}

{ TModuleMain }

procedure TModuleMain.DataClose;
begin
  Self.qrySelect.Close;
  Self.conData.Close;
end;

procedure TModuleMain.DataCreate;
begin
  Self.qryCreate.ExecSQL;
end;

procedure TModuleMain.DataDelete;
begin
  Self.qryInsert.ExecSQL;
end;

procedure TModuleMain.DataInsert;
begin
  Self.qryInsert.ExecSQL;
end;

procedure TModuleMain.DataOpen;
begin
  with (Self.conData) do
  begin
    Close;
    Driver := 'ODBC Driver 18 for SQL Server';
    Params.Values['Server'] := 'localhost';
    Params.Values['Database'] := 'master';
    Params.Values['Uid'] := 'sa';
    Params.Values['Pwd'] := 'ABcd!@34';
    Params.Values['Encrypt'] := 'yes';
    Params.Values['TrustServerCertificate'] := 'yes';
    Open;
  end;
end;

procedure TModuleMain.DataSelect;
begin
  Self.qrySelect.Close;
  Self.qrySelect.Open;
end;

end.

