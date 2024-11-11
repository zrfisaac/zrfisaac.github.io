// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io

// # [ delphi2007 ]
unit menu_main_data;

interface

uses
  // # : - delphi
  SysUtils,
  Classes, WideStrings, FMTBcd, DB, SqlExpr;

type
  TMenuMainData = class(TDataModule)
    conMain: TSQLConnection;
    dtsMain: TDataSource;
    qryMain: TSQLQuery;
  end;

var
  MenuMainData: TMenuMainData;

implementation

{$R *.dfm}

end.
