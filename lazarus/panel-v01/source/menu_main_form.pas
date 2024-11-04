// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io

// # [ lazarus ]
unit menu_main_form;

{$mode objfpc}
{$H+}

interface

uses
  // # : - lazarus
  Classes,
  SysUtils,
  Forms,
  Controls,
  Graphics,
  Dialogs,
  ExtCtrls,
  ComCtrls,
  Menus,
  StdCtrls,
  Buttons;

type

  { TMenuMainForm }

  TMenuMainForm = class(TForm)
    btRoutine: TBitBtn;
    meText: TMemo;
    miMenu: TMainMenu;
    pnBack: TPanel;
    pnBody: TPanel;
    pnFooter: TPanel;
    pnFooter01: TPanel;
    pnFooter02: TPanel;
    pnFooter03: TPanel;
    StatusBar1: TStatusBar;
    procedure FormCreate(Sender: TObject);
  end;

var
  MenuMainForm: TMenuMainForm;

implementation

uses
  menu_main_data;

{$R *.lfm}

{ TMenuMainForm }

procedure TMenuMainForm.FormCreate(Sender: TObject);
begin
  // # : - title
  Self.Caption := Application.Title;

  // # : - data
  if not Assigned(MenuMainData) then
    MenuMainData := TMenuMainData.Create(Application);
end;

end.

