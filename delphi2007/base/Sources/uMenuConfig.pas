// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io

// # [ delphi ]
unit uMenuConfig;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  ExtCtrls,
  // .\Sources
  uModelForm, ComCtrls;

type
  TMenuConfig = class(TModelForm)
    pcBack: TPageControl;
    tsMain: TTabSheet;
  end;

var
  MenuConfig: TMenuConfig;

implementation

{$R *.dfm}

end.
