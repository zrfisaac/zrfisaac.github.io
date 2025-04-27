// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires Santana
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io

// # [ delphi2007 ]
unit menu_main;

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
  ExtCtrls,
  ComCtrls,
  Menus,
  ActnList;

type
  TMenuMain = class(TForm)
    pnBack: TPanel;
    sbFooter: TStatusBar;
    miMenu: TMainMenu;
    miHelp: TMenuItem;
    miAbout: TMenuItem;
    acAction: TActionList;
    acAbout: TAction;
    procedure FormCreate(Sender: TObject);
    procedure acAboutExecute(Sender: TObject);
  end;

var
  MenuMain: TMenuMain;

implementation

uses
  zrlib;

{$R *.dfm}

procedure TMenuMain.acAboutExecute(Sender: TObject);
begin
  // # : - menu - help - about
  zrAbout;
end;

procedure TMenuMain.FormCreate(Sender: TObject);
begin
  // # : - title
  Self.Caption := Application.Title;

  // # : - footer
  if (Self.sbFooter.Panels.Count) > 0 then
  begin
    Self.sbFooter.Panels[0].Text := zrVersion;
    Self.sbFooter.Panels[0].BiDiMode := bdLeftToRight;
  end;
  if (Self.sbFooter.Panels.Count) > 1 then
  begin
    Self.sbFooter.Panels[Self.sbFooter.Panels.Count-1].Text := '     ' + zrInternalName;
    Self.sbFooter.Panels[Self.sbFooter.Panels.Count-1].BiDiMode := bdRightToLeft;
  end;
end;

end.
