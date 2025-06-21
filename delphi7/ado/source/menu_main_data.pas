// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires Santana
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io

// # [ delphi7 ]
unit menu_main_data;

interface

uses
  SysUtils,
  Classes,
  DB,
  ADODB;

type
  TMenuMainData = class(TDataModule)
    adoConnection: TADOConnection;
  end;

var
  MenuMainData: TMenuMainData;

implementation

{$R *.dfm}

end.
 