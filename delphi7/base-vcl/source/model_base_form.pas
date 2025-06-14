// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires Santana
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io

// # [ delphi7 ]
unit model_base_form;

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
  ExtCtrls, StdCtrls;

type
  TModelBaseForm = class(TForm)
    pnBack: TPanel;
    pnTitle: TPanel;
    imIcon: TImage;
    imVoid: TImage;
    lbTitle: TLabel;
  end;

var
  ModelBaseForm: TModelBaseForm;

implementation

{$R *.dfm}

end.
