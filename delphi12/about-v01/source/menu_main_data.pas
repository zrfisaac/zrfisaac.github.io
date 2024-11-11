// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io

// # [ delphi12 ]
unit menu_main_data;

interface

uses
  // # : - delphi
  System.SysUtils,
  System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client;

type
  TMenuMainData = class(TDataModule)
    conMain: TFDConnection;
    traMain: TFDTransaction;
  end;

var
  MenuMainData: TMenuMainData;

implementation

{$R *.dfm}

end.
