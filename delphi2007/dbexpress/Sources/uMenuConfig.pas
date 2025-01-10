// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io

// # [ delphi ]
unit uMenuConfig;

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
  StdCtrls,
  Buttons,
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
  try
    if (Self.cbDbexpress.Text = 'DevartSQLServer Native Client') then
    begin
      with (MenuConfigData.conDbexpress) do
      begin
        Close;
        LoginPrompt := False;
        DriverName := 'DevartSQLServer';
        ConnectionName := 'Devart SQLServer';
        GetDriverFunc := 'getSQLDriverSQLServer';
        LibraryName := 'dbexpsda40.dll';
        VendorLib := 'sqlncli.dll';
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
    if (Self.cbDbexpress.Text = 'DevartSQLServer OLE DB') then
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
    if (Self.cbDbexpress.Text = 'DevartODBCSQLServer') then
    begin
      with (MenuConfigData.conDbexpress) do
      begin
        Close;
        LoginPrompt := False;
        DriverName := 'DevartSQLServer';
        ConnectionName := 'Devart SQLServer';
        GetDriverFunc := 'getSQLDriverSQLServer';
        LibraryName := 'dbexpsda40.dll';
        VendorLib := 'DevartODBCSQLServer.dll';
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
    ShowMessage('Success!');
  except
    on e: Exception do
    begin
      ShowMessage(e.Message);
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
