unit uMenuConfigData;

interface

uses
  SysUtils,
  Classes,
  DB,
  SqlExpr, WideStrings;

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
