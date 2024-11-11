// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io

// # [ delphi2007 ]
unit menu_main_form;

interface

uses
  // # : - delphi
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  Menus,
  ComCtrls,
  ExtCtrls, Grids, ValEdit;

type
  TMenuMainForm = class(TForm)
    pnBack: TPanel;
    StatusBar1: TStatusBar;
    miMenu: TMainMenu;
    tmTimer: TTimer;
    vleData: TValueListEditor;
    procedure FormCreate(Sender: TObject);
    procedure tmTimerTimer(Sender: TObject);
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

procedure TMenuMainForm.tmTimerTimer(Sender: TObject);
begin
  // # : - clock
  Self.vleData.Values['Left'] := IntToStr(Self.Left);
  Self.vleData.Values['Top'] := IntToStr(Self.Top);
end;

end.
