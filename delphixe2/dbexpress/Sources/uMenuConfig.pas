// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io

// # [ delphi ]
unit uMenuConfig;

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
  Vcl.ExtCtrls,
  ComCtrls,
  Vcl.StdCtrls,
  Vcl.Buttons,
  // .\Sources
  uModelForm;

type
  TMenuConfig = class(TModelForm)
    pcBack: TPageControl;
    tsMain: TTabSheet;
    tsDbrexpress: TTabSheet;
    pnDbrexpressFooter: TPanel;
    pnDbexpress: TPanel;
    Panel3: TPanel;
    pcDbexpress: TPageControl;
    tsDbexpressMssql: TTabSheet;
    cbDbexpress: TComboBox;
    pnDbrexpressFooter03: TPanel;
    pnDbrexpressFooter02: TPanel;
    pnDbrexpressFooter01: TPanel;
    btDbrexpressConnect: TBitBtn;
    btDbrexpressClose: TBitBtn;
    pnDbexpressMssql: TPanel;
    sbDbexpressMssql: TScrollBox;
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    Label2: TLabel;
    Panel4: TPanel;
    Label3: TLabel;
    Panel5: TPanel;
    Label4: TLabel;
    edDbexpressMssqlDatabase: TEdit;
    edDbexpressMssqlServer: TEdit;
    edDbexpressMssqlUser: TEdit;
    edDbexpressMssqlPassword: TEdit;
    procedure btDbrexpressConnectClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  end;

var
  MenuConfig: TMenuConfig;

implementation

uses
  uMenuConfigData;

{$R *.dfm}

procedure TMenuConfig.btDbrexpressConnectClick(Sender: TObject);
begin
  inherited;
  if (Self.cbDbexpress.Text = 'MSSQL') then
  begin
    with (MenuConfigData.conDbexpress) do
    begin
      Close;
      LoginPrompt := False;
      DriverName := 'DevartSQLServer';
      ConnectionName := 'Devart SQLServer';
      GetDriverFunc := 'getSQLDriverSQLServer';
      LibraryName := 'dbexpsda40.dll';
      VendorLib := 'sqloledb.dll';
      Params.Values['DriverName'] := DriverName;
      Params.Values['ConnectionName'] := ConnectionName;
      Params.Values['GetDriveFunc'] := GetDriverFunc;
      Params.Values['LibraryName'] := LibraryName;
      Params.Values['VendorLib'] := VendorLib;
      Params.Values['HostName'] := Self.edDbexpressMssqlServer.Text;
      Params.Values['User_Name'] := Self.edDbexpressMssqlUser.Text;
      Params.Values['Password'] := Self.edDbexpressMssqlPassword.Text;
      Params.Values['Database'] := Self.edDbexpressMssqlDatabase.Text;
      Open;
    end;
  end;
end;

procedure TMenuConfig.FormCreate(Sender: TObject);
begin
  inherited;
  if not(Assigned(MenuConfigData)) then
    MenuConfigData := TMenuConfigData.Create(Application);
end;

end.
