unit main_form;

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
  ComCtrls,
  StdCtrls,
  ExtCtrls,
  ActnList,
  U_Cipher;

const
  C_KEY = 'D41D8CD98F00B204E9800998ECF8427E';

type
  TMainForm = class(TForm)
    sbFooter: TStatusBar;
    sbBack: TScrollBox;
    pnFooter: TPanel;
    pnFooter03: TPanel;
    pnFooter01: TPanel;
    pnFooter02: TPanel;
    btRun01: TButton;
    acAction: TActionList;
    acEsc: TAction;
    acRun01: TAction;
    pnServer: TPanel;
    edServer: TEdit;
    lbServer: TLabel;
    pnDatabase: TPanel;
    lbDatabase: TLabel;
    edDatabase: TEdit;
    pnAlias: TPanel;
    lbAlias: TLabel;
    edAlias: TEdit;
    pnUser: TPanel;
    lbUser: TLabel;
    edUser: TEdit;
    pnPassword: TPanel;
    lbPassword: TLabel;
    edPassword: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure acEscExecute(Sender: TObject);
    procedure acRun01Execute(Sender: TObject);
    procedure btRun01Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  public
    Config: TStrings;
    ConfigPath: string;
    procedure ConfigRead;
    procedure ConfigWrite;
    function Decrypt(_pText: string; _pKey: String = C_KEY): string;
    function Encrypt(_pText: string; _pKey: String = C_KEY): string;
  end;

var
  MainForm: TMainForm;

implementation

uses
  main_data;

{$R *.dfm}

procedure TMainForm.ConfigRead;
begin
  // # : - config - read
  if not(Self.ConfigPath = '') then
  begin
    if not Assigned(Self.Config) then
      Self.Config := TStringList.Create;
    if FileExists(Self.ConfigPath) then
      Self.Config.LoadFromFile(Self.ConfigPath)
    else
    begin
      Self.Config.Values['alias'] := Self.edAlias.Text;
      Self.Config.Values['server'] := Self.edServer.Text;
      Self.Config.Values['database'] := Self.edDatabase.Text;
      Self.Config.Values['user'] := Self.edUser.Text;
      Self.Config.Values['password'] := Self.Encrypt(Self.edPassword.Text);
    end;
    Self.edAlias.Text := Self.Config.Values['alias'];
    Self.edServer.Text := Self.Config.Values['server'];
    Self.edDatabase.Text := Self.Config.Values['database'];
    Self.edUser.Text := Self.Config.Values['user'];
    Self.edPassword.Text := Self.Decrypt(Self.Config.Values['password']);
  end;
end;

procedure TMainForm.ConfigWrite;
begin
  // # : - config - write
  if not(Self.ConfigPath = '') then
  begin
    if not Assigned(Self.Config) then
      Self.Config := TStringList.Create;
    Self.Config.Values['alias'] := Self.edAlias.Text;
    Self.Config.Values['server'] := Self.edServer.Text;
    Self.Config.Values['database'] := Self.edDatabase.Text;
    Self.Config.Values['user'] := Self.edUser.Text;
    Self.Config.Values['password'] := Self.Encrypt(Self.edPassword.Text);
    Self.Config.SaveToFile(Self.ConfigPath);
  end;
end;

function TMainForm.Decrypt(_pText, _pKey: String): string;
begin
  // # : - decrypt
  Result := Decifra(_pText, _pKey);
end;

function TMainForm.Encrypt(_pText, _pKey: String): string;
begin
  // # : - encrypt
  Result := Cifra(_pText, _pKey);
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  // # : - title
  Self.Caption := Application.Title;

  // # : - data
  if not Assigned(MainData) then
    MainData := TMainData.Create(Application);

  // # : - config
  Self.ConfigPath := ExtractFileDir(ParamStr(0)) + '\config.cfg';
  Self.ConfigRead;
end;

procedure TMainForm.acEscExecute(Sender: TObject);
begin
  // # : - close
  Self.Close;
end;

procedure TMainForm.acRun01Execute(Sender: TObject);
begin
  // # : - run
  try
    MainData.conBde.Close;
    MainData.conBde.AliasName := Self.edAlias.Text;
    MainData.conBde.Params.Clear;
    MainData.conBde.Params.Values['SERVER NAME'] := Self.edServer.Text;
    MainData.conBde.Params.Values['DATABASE NAME'] := Self.edDatabase.Text;
    MainData.conBde.Params.Values['USER NAME'] := Self.edUser.Text;
    MainData.conBde.Params.Values['PASSWORD'] := Self.edPassword.Text;
    MainData.conBde.Open;
    MainData.conBde.Close;
    Self.ConfigWrite;
    ShowMessage('Conexão estabelecida com sucesso!');
  except
    on e: Exception do
    begin
      Application.MessageBox(
         PChar(e.Message)
        ,PChar('Error!')
        ,MB_OK + MB_ICONERROR
      );
    end;
  end;
end;

procedure TMainForm.btRun01Click(Sender: TObject);
begin
  // # : - run
  Self.acRun01Execute(Nil);
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // # : - config - write
  Self.ConfigWrite;
end;

end.
