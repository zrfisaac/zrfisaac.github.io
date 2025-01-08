unit uMenuConfigData;

interface

uses
  System.SysUtils,
  System.Classes,
  Data.DB,
  Data.SqlExpr;

type
  TMenuConfigData = class(TDataModule)
    conDbexpress: TSQLConnection;
  end;

var
  MenuConfigData: TMenuConfigData;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

end.
