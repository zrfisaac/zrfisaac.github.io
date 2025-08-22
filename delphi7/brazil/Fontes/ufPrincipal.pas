// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires Santana
// # - email : zrfisaac@gmail.com
// # - site : zrfisaac.github.io

// # [ delphi7 ]
unit ufPrincipal;

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
  ComCtrls,
  ExtCtrls;

type
  TFrmPrincipal = class(TForm)
    sbRodape: TStatusBar;
    sbFundo: TScrollBox;
    pnRodape: TPanel;
    procedure FormCreate(Sender: TObject);
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses
  udPrincipal;

{$R *.dfm}

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  // # : Titulo
  Self.Caption := Application.Title;

  // # : DataModule
  if not Assigned(DtmPrincipal) then
    DtmPrincipal := TDtmPrincipal.Create(Application);
end;

end.
