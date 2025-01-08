// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io

// # [ delphi ]
unit uMenuConfig;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
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
