// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io

// # [ lazarus ]
unit menu_main;

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
  Buttons, ActnList;

type

  { TMenuMain }

  TMenuMain = class(TForm)
    acAction: TActionList;
    acF1: TAction;
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
    procedure acF1Execute(Sender: TObject);
    procedure btRoutineClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  end;

var
  MenuMain: TMenuMain;

implementation

uses
  menu_about,
  module_main;

{$R *.lfm}

{ TMenuMain }

procedure TMenuMain.FormCreate(Sender: TObject);
begin
  // # : - title
  Self.Caption := Application.Title;

  // # : - data
  if not Assigned(ModuleMain) then
    ModuleMain := TModuleMain.Create(Application);
end;

procedure TMenuMain.btRoutineClick(Sender: TObject);
begin
  TMenuAbout.Start;
end;

procedure TMenuMain.acF1Execute(Sender: TObject);
begin
  TMenuAbout.Start;
end;

end.

