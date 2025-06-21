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
  ActnList,
  StdCtrls,
  Buttons;

type
  TMenuMainForm = class(TForm)
    sbFooter: TStatusBar;
    pnBack: TPanel;
    sbBack: TScrollBox;
    pnFooter: TPanel;
    pnFooter03: TPanel;
    btClose: TBitBtn;
    pnFooter02: TPanel;
    pnFooter01: TPanel;
    acAction: TActionList;
    acClose: TAction;
    btRun: TBitBtn;
    pnServer: TPanel;
    lbServer: TLabel;
    edServer: TEdit;
    acRun: TAction;
    pnUser: TPanel;
    lbUser: TLabel;
    edUser: TEdit;
    pnPassword: TPanel;
    lbPassword: TLabel;
    edPassword: TEdit;
    pnDatabase: TPanel;
    lbDatabase: TLabel;
    edDatabase: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure acCloseExecute(Sender: TObject);
    procedure btRunClick(Sender: TObject);
    procedure acRunExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  public
    procedure fnClose;
    procedure fnRun;
    procedure fnScreen;
    procedure fnStatus(_pText: String);
  end;

var
  MenuMainForm: TMenuMainForm;

implementation

uses
  menu_main_data,
  zrlib, ADODB, DB;

{$R *.dfm}

procedure TMenuMainForm.fnClose;
begin
  Self.Close;
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
  Self.Close;
end;

procedure TMenuMainForm.fnRun;
begin
  try
    with (MenuMainData.adoConnection) do
    begin
      if (Connected) then
      begin
        Close;
        fnStatus('Stop');
      end
      else
      begin
        Close;
        LoginPrompt := False;
        Provider := 'SQLOLEDB.1';
        ConnectionString := (''
         + 'Provider=' + Provider + ';'
         + 'Data Source=' + Self.edServer.Text + ';'
         + 'User ID=' + Self.edUser.Text + ';'
         + 'Password=' + Self.edPassword.Text + ';'
         + 'Initial Catalog=' + Self.edDatabase.Text + ';'
         + 'Persist Security Info=True;'
        );
        Open;
        fnStatus('Run');
      end;
    end;
    Self.fnScreen;
  except
    on e: Exception do
    begin
      Self.fnScreen;
      Application.MessageBox(
         PChar(Format('An unexpected error has occurred:'#13#10'%s',[e.Message]))
        ,PChar('Application Error')
        ,MB_OK + MB_ICONERROR
      );
    end;
  end;
end;

procedure TMenuMainForm.btRunClick(Sender: TObject);
begin
  Self.fnRun;
end;

procedure TMenuMainForm.acRunExecute(Sender: TObject);
begin
  Self.fnRun;
end;

procedure TMenuMainForm.fnStatus(_pText: String);
begin
  if (Self.sbFooter.Panels.Count > 2) then
    Self.sbFooter.Panels[1].Text := FormatDateTime('yyyy-MM-dd hh:mm:ss.zzz',Now);
  if (Self.sbFooter.Panels.Count > 3) then
    Self.sbFooter.Panels[2].Text := _pText;
end;

procedure TMenuMainForm.fnScreen;
var
  _vDummy: Boolean;
begin
  // # : - ado
  if Assigned(MenuMainData) then
  begin
    _vDummy := MenuMainData.adoConnection.Connected;
    Self.edServer.ReadOnly := _vDummy;
    Self.edPassword.ReadOnly := _vDummy;
    Self.edUser.ReadOnly := _vDummy;
    Self.edDatabase.ReadOnly := _vDummy;
    if (_vDummy) then
      Self.btRun.Caption := 'Stop (F5)'
    else
      Self.btRun.Caption := 'Run (F5)';
  end;
end;

procedure TMenuMainForm.FormShow(Sender: TObject);
begin
  Self.fnScreen;
end;

end.
