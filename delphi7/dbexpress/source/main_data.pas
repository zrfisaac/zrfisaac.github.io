unit main_data;

interface

uses
  SysUtils,
  Classes,
  DB,
  DBTables,
  DBXpress,
  SqlExpr;

type
  TMainData = class(TDataModule)
    conDbexpress: TSQLConnection;
  end;

var
  MainData: TMainData;

implementation

{$R *.dfm}

end.
