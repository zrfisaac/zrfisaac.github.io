// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io

// # [ delphixe2 ]
unit menu_main_form;

interface

uses
  // # : - delphi
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Menus,
  Vcl.ComCtrls,
  Vcl.StdCtrls,
  Vcl.Buttons,
  Vcl.ExtCtrls;

type
  TMenuMainForm = class(TForm)
    pnBack: TPanel;
    StatusBar1: TStatusBar;
    miMenu: TMainMenu;
    pnFooter: TPanel;
    pnBody: TPanel;
    pnFooter03: TPanel;
    pnFooter02: TPanel;
    pnFooter01: TPanel;
    btRoutine: TBitBtn;
    meText: TMemo;
    procedure FormCreate(Sender: TObject);
  end;

var
  MenuMainForm: TMenuMainForm;

implementation

{$R *.dfm}

procedure TMenuMainForm.FormCreate(Sender: TObject);
begin
  // # : - title
  Self.Caption := Application.Title
end;

end.
