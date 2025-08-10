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
    pnDomain: TPanel;
    lbDomain: TLabel;
    edDomain: TEdit;
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
    function UserLogin(_pUser: string; _pDomain: string; _pPassword: string): Boolean;
    procedure UserLogout;
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
      Self.Config.Values['server'] := Self.edServer.Text;
      Self.Config.Values['database'] := Self.edDatabase.Text;
      Self.Config.Values['domain'] := Self.edDomain.Text;
      Self.Config.Values['user'] := Self.edUser.Text;
      Self.Config.Values['password'] := Self.Encrypt(Self.edPassword.Text);
    end;
    Self.edServer.Text := Self.Config.Values['server'];
    Self.edDatabase.Text := Self.Config.Values['database'];
    Self.edDomain.Text := Self.Config.Values['domain'];
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
    Self.Config.Values['server'] := Self.edServer.Text;
    Self.Config.Values['database'] := Self.edDatabase.Text;
    Self.Config.Values['domain'] := Self.edDomain.Text;
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

function TMainForm.UserLogin(_pUser, _pDomain,
  _pPassword: string): Boolean;
var
  _vToken: THandle;
begin
  Result := LogonUser(
     PChar(_pUser)
    ,PChar(_pDomain)
    ,PChar(_pPassword)
    ,LOGON32_LOGON_INTERACTIVE
    ,LOGON32_PROVIDER_DEFAULT
    ,_vToken
  );
  if Result then
  begin
    Result := ImpersonateLoggedOnUser(_vToken);
    CloseHandle(_vToken);
  end
  else
    RaiseLastOSError;
end;

procedure TMainForm.UserLogout;
begin
  RevertToSelf;
end;

procedure TMainForm.acEscExecute(Sender: TObject);
begin
  // # : - close
  Self.Close;
end;

procedure TMainForm.acRun01Execute(Sender: TObject);
begin
  // # : - run
  if (Self.edDomain.Text = '')
  or (
    not(Self.edDomain.Text = '')
    and
    (Self.UserLogin(Self.edUser.Text,Self.edDomain.Text,Self.edPassword.Text))
  ) then
  begin
    try
      MainData.conAdo.Close;
      if (Self.edDomain.Text = '') then
      begin
        MainData.conAdo.ConnectionString := (''
          + 'Provider=SQLOLEDB.1;'
          + 'Persist Security Info=True;'
          + 'Use Encryption for Data=False;'
          + 'Data Source=' + Self.edServer.Text + ';'
          + 'User ID=' + Self.edUser.Text + ';'
          + 'Password=' + Self.edPassword.Text + ';'
        );
      end
      else
      begin
        MainData.conAdo.ConnectionString := (''
          + 'Provider=SQLOLEDB.1;'
          + 'Persist Security Info=True;'
          + 'Use Encryption for Data=False;'
          + 'Data Source=' + Self.edServer.Text + ';'
          + 'Integrated Security=SSPI;'
        );
      end;
      MainData.conAdo.Open;
      MainData.conAdo.Close;
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
    if not(Self.edDomain.Text = '') then
      Self.UserLogout;
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
