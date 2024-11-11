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
  Buttons,
  Grids,
  DBGrids,
  ActnList,
  ValEdit;

type
  TMenuMainForm = class(TForm)
    pnBack: TPanel;
    StatusBar1: TStatusBar;
    miMenu: TMainMenu;
    pnFooter: TPanel;
    pnBody: TPanel;
    pnFooter03: TPanel;
    pnFooter02: TPanel;
    pnFooter01: TPanel;
    btRoutine: TBitBtn;
    Panel1: TPanel;
    Memo1: TMemo;
    DBGrid1: TDBGrid;
    Splitter1: TSplitter;
    acAction: TActionList;
    acF5: TAction;
    vleConfig: TValueListEditor;
    Splitter2: TSplitter;
    procedure FormCreate(Sender: TObject);
    procedure acF5Execute(Sender: TObject);
    procedure btRoutineClick(Sender: TObject);
  public
    procedure fnRun;
  end;

var
  MenuMainForm: TMenuMainForm;

implementation

uses
  menu_main_data;

{$R *.dfm}

procedure TMenuMainForm.acF5Execute(Sender: TObject);
begin
  // # : - F5
  Self.fnRun;
end;

procedure TMenuMainForm.btRoutineClick(Sender: TObject);
begin
  Self.fnRun;
end;

procedure TMenuMainForm.fnRun;
begin
  with (MenuMainData.conMain) do
  begin
    Close;
    LoginPrompt := False;
    ConnectionName := Self.vleConfig.Strings.Values['ConnectionName'];
    GetDriverFunc := Self.vleConfig.Strings.Values['GetDriverFunc'];
    LibraryName := Self.vleConfig.Strings.Values['LibraryName'];
    VendorLib := Self.vleConfig.Strings.Values['VendorLib'];
    Params.Text := Self.vleConfig.Strings.Text;
    DriverName := Self.vleConfig.Strings.Values['DriverName'];
    Params.Values['DriverName'] := Self.vleConfig.Strings.Values['DriverName'];
    Open;
  end;
end;

procedure TMenuMainForm.FormCreate(Sender: TObject);
begin
  // # : - title
  Self.Caption := Application.Title

  // # : - title
end;

end.
