// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io

// # [ delphi2007 ]
unit umain;

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
  StdCtrls,
  ExtCtrls,
  Buttons;

type
  TfrmMain = class(TForm)
    pnBack: TPanel;
    meText: TMemo;
    pnFooter: TPanel;
    btRun: TBitBtn;
    procedure btRunClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  Self.Caption := Application.Title;
end;

procedure TfrmMain.btRunClick(Sender: TObject);
begin
  //
end;

end.
