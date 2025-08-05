unit main_data;

interface

uses
  System.SysUtils,
  System.Classes,
  Data.DB,
  Data.Win.ADODB,
  frxClass, frxADOComponents;

type
  TMainData = class(TDataModule)
    conAdo: TADOConnection;
    frxReport: TfrxReport;
    frxAdo: TfrxADOComponents;
  end;

var
  MainData: TMainData;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
