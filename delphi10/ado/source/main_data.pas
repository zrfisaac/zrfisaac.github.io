unit main_data;

interface

uses
  System.SysUtils,
  System.Classes, Data.DB, Data.Win.ADODB;

type
  TMainData = class(TDataModule)
    conAdo: TADOConnection;
  end;

var
  MainData: TMainData;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
