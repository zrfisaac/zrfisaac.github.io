// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io

// # [ delphi12 ]
unit menu_main;

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
  Vcl.ExtCtrls, System.Actions, Vcl.ActnList;

type
  TMenuMain = class(TForm)
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
    acAction: TActionList;
    acF1: TAction;
    procedure FormCreate(Sender: TObject);
    procedure btRoutineClick(Sender: TObject);
    procedure acF1Execute(Sender: TObject);
  end;

var
  MenuMain: TMenuMain;

implementation

uses
  module_main,
  uMenuAbout;

{$R *.dfm}

procedure TMenuMain.acF1Execute(Sender: TObject);
begin
  TMenuAbout.Start;
end;

procedure TMenuMain.btRoutineClick(Sender: TObject);
begin
  TMenuAbout.Start;
end;

procedure TMenuMain.FormCreate(Sender: TObject);
begin
  // # : - title
  Self.Caption := Application.Title;

  // # : - data
  if not Assigned(ModuleMain) then
    ModuleMain := TModuleMain.Create(Application);
end;

end.

