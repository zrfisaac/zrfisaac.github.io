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
    miMenu: TMainMenu;
    pnBack: TPanel;
    pnFooter: TPanel;
    pnFooter03: TPanel;
    pnFooter02: TPanel;
    pnFooter01: TPanel;
    btRun: TBitBtn;
    pnBody: TPanel;
    spSplitter: TSplitter;
    meText: TMemo;
    lbThread: TListBox;
    sbStatus: TStatusBar;
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
