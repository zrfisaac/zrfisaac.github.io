// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires Santana
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io

// # [ lazarus ]
unit model_base_form;

{$mode ObjFPC}
{$H+}

interface

uses
  Classes,
  SysUtils,
  Forms,
  Controls,
  Graphics,
  Dialogs, ExtCtrls, StdCtrls;

type

  { TModelBaseForm }

  TModelBaseForm = class(TForm)
    imIcon: TImage;
    imVoid: TImage;
    lbTitle: TLabel;
    pnTitle: TPanel;
    pnBack: TPanel;
  end;

var
  ModelBaseForm: TModelBaseForm;

implementation

{$R *.lfm}

end.

