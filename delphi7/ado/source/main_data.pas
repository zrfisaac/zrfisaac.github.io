unit main_data;

interface

uses
  SysUtils,
  Classes, DB, ADODB;

type
  TMainData = class(TDataModule)
    conAdo: TADOConnection;
  end;

var
  MainData: TMainData;

implementation

{$R *.dfm}

end.
