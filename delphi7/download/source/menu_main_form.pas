// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires Santana
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io

// # [ delphi7 ]
unit menu_main_form;

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
  ActnList, StdCtrls, Buttons;

type
  TMenuMainForm = class(TForm)
    sbFooter: TStatusBar;
    pnUrl: TPanel;
    lbUrl: TLabel;
    edUrl: TEdit;
    pbDownload: TProgressBar;
    pnFooter: TPanel;
    pnFooter03: TPanel;
    btClose: TBitBtn;
    pnFooter02: TPanel;
    pnFooter01: TPanel;
    btRun: TBitBtn;
    acAction: TActionList;
    acClose: TAction;
    acRun: TAction;
    procedure FormCreate(Sender: TObject);
    procedure acCloseExecute(Sender: TObject);
    procedure btCloseClick(Sender: TObject);
    procedure btRunClick(Sender: TObject);
    procedure acRunExecute(Sender: TObject);
  public
    procedure fnClose;
    procedure fnRun;
  end;

var
  MenuMainForm: TMenuMainForm;

implementation

uses
  menu_main_data,
  zrlib;

{$R *.dfm}

procedure TMenuMainForm.fnClose;
begin
  Self.Close;
end;

procedure TMenuMainForm.fnRun;
var
  _vStream: TMemoryStream;
begin
  ZRDownload(Self.edUrl.Text,_vStream);
  ZRStreamSave(_vStream, ExtractFileDir(ParamStr(0)) + '\favicon.png');
end;

procedure TMenuMainForm.FormCreate(Sender: TObject);
begin
  // # : - title
  Self.Caption := Application.Title;

  // # : - footer
  if (Self.sbFooter.Panels.Count > 0) then
    Self.sbFooter.Panels[0].Text := ZRFileVersion;
  if (Self.sbFooter.Panels.Count > 1) then
    Self.sbFooter.Panels[Self.sbFooter.Panels.Count - 1].Text := ZRInternalName + '     .';

  // # : - datamodule
  if not Assigned(MenuMainData) then
    MenuMainData := TMenuMainData.Create(Self);
end;

procedure TMenuMainForm.acCloseExecute(Sender: TObject);
begin
  Self.fnClose;
end;

procedure TMenuMainForm.btCloseClick(Sender: TObject);
begin
  Self.fnClose;
end;

procedure TMenuMainForm.btRunClick(Sender: TObject);
begin
  Self.fnRun;
end;

procedure TMenuMainForm.acRunExecute(Sender: TObject);
begin
  Self.fnRun;
end;

end.
