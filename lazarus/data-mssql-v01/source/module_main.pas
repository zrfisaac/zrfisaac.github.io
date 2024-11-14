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
  SQLite3Conn,
  SQLDB,
  DB;

type

  { TModuleMain }

  TModuleMain = class(TDataModule)
    conData: TSQLite3Connection;
    dtsSelect: TDataSource;
    qryInsert: TSQLQuery;
    qryCreate: TSQLQuery;
    qrySelect: TSQLQuery;
    qryDelete: TSQLQuery;
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
    DatabaseName := (''
      + GetCurrentDir
      {$IFDEF WINDOWS}
      + '\'
      {$ENDIF}
      {$IFDEF LINUX}
      + '/'
      {$ENDIF}
      + 'database.db'
    );
    Open;
  end;
end;

procedure TModuleMain.DataSelect;
begin
  Self.qrySelect.Close;
  Self.qrySelect.Open;
end;

end.

