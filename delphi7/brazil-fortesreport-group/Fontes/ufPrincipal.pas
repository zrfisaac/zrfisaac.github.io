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
  StdCtrls,
  ExtCtrls;

type
  TFrmPrincipal = class(TForm)
    sbRodape: TStatusBar;
    sbFundo: TScrollBox;
    pnRodape: TPanel;
    btVisualizar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btVisualizarClick(Sender: TObject);
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses
  udPrincipal,
  ufRelatorio;

{$R *.dfm}

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  // # : Titulo
  Self.Caption := Application.Title;

  // # : DataModule
  if not Assigned(DtmPrincipal) then
    DtmPrincipal := TDtmPrincipal.Create(Application);
end;

procedure TFrmPrincipal.btVisualizarClick(Sender: TObject);
begin
  TFrmRelatorio.Visualizar;
end;

end.
