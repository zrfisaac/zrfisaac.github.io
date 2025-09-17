unit main_data;

interface

uses
  SysUtils,
  Classes,
  DB,
  DBTables;

type
  TMainData = class(TDataModule)
    conBde: TDatabase;
  end;

var
  MainData: TMainData;

implementation

{$R *.dfm}

end.
