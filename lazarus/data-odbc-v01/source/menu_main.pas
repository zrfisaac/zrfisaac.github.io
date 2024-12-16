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
  Buttons,
  ActnList,
  DBGrids;

type

  { TMenuMain }

  TMenuMain = class(TForm)
    acAction: TActionList;
    acF1: TAction;
    btCreate: TBitBtn;
    btInsert: TBitBtn;
    btAll: TBitBtn;
    btSelect: TBitBtn;
    btOpen: TBitBtn;
    btClose: TBitBtn;
    btDelete: TBitBtn;
    dbgData: TDBGrid;
    miMenu: TMainMenu;
    pnBack: TPanel;
    pnBody: TPanel;
    pnFooter: TPanel;
    pnFooter01: TPanel;
    pnFooter02: TPanel;
    pnFooter03: TPanel;
    StatusBar1: TStatusBar;
    procedure acF1Execute(Sender: TObject);
    procedure btAllClick(Sender: TObject);
    procedure btCloseClick(Sender: TObject);
    procedure btCreateClick(Sender: TObject);
    procedure btDeleteClick(Sender: TObject);
    procedure btOpenClick(Sender: TObject);
    procedure btInsertClick(Sender: TObject);
    procedure btSelectClick(Sender: TObject);
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

procedure TMenuMain.btOpenClick(Sender: TObject);
begin
  ModuleMain.DataOpen;
end;

procedure TMenuMain.btInsertClick(Sender: TObject);
begin
  ModuleMain.DataInsert;
end;

procedure TMenuMain.btSelectClick(Sender: TObject);
begin
  ModuleMain.DataSelect;
end;

procedure TMenuMain.acF1Execute(Sender: TObject);
begin
  TMenuAbout.Start;
end;

procedure TMenuMain.btAllClick(Sender: TObject);
begin
  try
    ModuleMain.DataClose;
    ModuleMain.DataOpen;
    try
      ModuleMain.DataCreate;
    except
    end;
    ModuleMain.DataDelete;
    ModuleMain.DataInsert;
    ModuleMain.DataSelect;
  except
    on e: Exception do
    begin
      ShowMessage(e.Message);
    end;
  end;
end;

procedure TMenuMain.btCloseClick(Sender: TObject);
begin
  ModuleMain.DataClose;
end;

procedure TMenuMain.btCreateClick(Sender: TObject);
begin
  ModuleMain.DataCreate;
end;

procedure TMenuMain.btDeleteClick(Sender: TObject);
begin
  ModuleMain.DataDelete;
end;

end.

