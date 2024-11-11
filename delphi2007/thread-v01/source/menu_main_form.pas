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
  ExtCtrls,
  StdCtrls,
  Buttons;

type
  TMenuMainForm = class(TForm)
    pnBack: TPanel;
    sbStatus: TStatusBar;
    miMenu: TMainMenu;
    pnFooter: TPanel;
    pnBody: TPanel;
    pnFooter03: TPanel;
    pnFooter02: TPanel;
    pnFooter01: TPanel;
    btRun: TBitBtn;
    meText: TMemo;
    lbThread: TListBox;
    spSplitter: TSplitter;
    procedure FormCreate(Sender: TObject);
    procedure btRunClick(Sender: TObject);
  end;

var
  MenuMainForm: TMenuMainForm;

implementation

uses
  menu_main_thread;

{$R *.dfm}

procedure TMenuMainForm.btRunClick(Sender: TObject);
begin
  TMenuMainThread.Run;
end;

procedure TMenuMainForm.FormCreate(Sender: TObject);
begin
  // # : - title
  Self.Caption := Application.Title
end;

end.
