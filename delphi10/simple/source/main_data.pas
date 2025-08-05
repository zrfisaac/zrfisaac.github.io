unit main_data;

interface

uses
  System.SysUtils,
  System.Classes;

type
  TMainData = class(TDataModule)
  end;

var
  MainData: TMainData;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
