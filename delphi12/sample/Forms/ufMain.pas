// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires Santana
// # - email : zrfisaac@gmail.com
// # - site : zrfisaac.github.io

// # [ delphi12 ]
unit ufMain;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  System.Actions,
  Vcl.ActnList,
  Vcl.Menus,
  Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.StdCtrls;

type
  TFrmMain = class(TForm)
    pnBack: TPanel;
    miMenu: TMainMenu;
    acAction: TActionList;
    tiTray: TTrayIcon;
    sbFooter: TStatusBar;
    miHelp: TMenuItem;
    miAbout: TMenuItem;
    miConfig: TMenuItem;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

uses
  uHelp;

{$R *.dfm}

procedure TFrmMain.FormCreate(Sender: TObject);
begin
  // # : Title
  Self.Caption := Application.Title;

  // # : Debug
  //fnTranslate(Self);
end;

end.
