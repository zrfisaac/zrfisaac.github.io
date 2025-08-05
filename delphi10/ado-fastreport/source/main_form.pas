unit main_form;

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
  Vcl.ComCtrls,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.Buttons,
  System.Actions,
  Vcl.ActnList,
  System.NetEncoding;

const
  C_KEY = 'D41D8CD98F00B204E9800998ECF8427E';

type
  TMainForm = class(TForm)
    sbFooter: TStatusBar;
    sbBack: TScrollBox;
    pnFooter: TPanel;
    pnFooter03: TPanel;
    pnFooter02: TPanel;
    pnFooter01: TPanel;
    btRun01: TBitBtn;
    pnPassword: TPanel;
    lbPassword: TLabel;
    edPassword: TEdit;
    pnUser: TPanel;
    lbUser: TLabel;
    edUser: TEdit;
    pnDatabase: TPanel;
    lbDatabase: TLabel;
    edDatabase: TEdit;
    pnServer: TPanel;
    lbServer: TLabel;
    edServer: TEdit;
    acAction: TActionList;
    acRun: TAction;
    acEsc: TAction;
    pnDomain: TPanel;
    lbDomain: TLabel;
    edDomain: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure acRunExecute(Sender: TObject);
    procedure btRun01Click(Sender: TObject);
    procedure acEscExecute(Sender: TObject);
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

procedure TMainForm.acEscExecute(Sender: TObject);
begin
  // # : - close
  Self.Close;
end;

procedure TMainForm.acRunExecute(Sender: TObject);
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
      MainData.frxReport.ShowReport;
      MainData.conAdo.Close;
      Self.ConfigWrite;
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
  Self.acRunExecute(Nil);
end;

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

function TMainForm.Decrypt(_pText: string; _pKey: String = C_KEY): string;
var
  _vI0: Integer;
  _vBytes: TBytes;
begin
  // # : - decrypt
  if (_pKey = '') then
    _pKey := C_KEY;
  _vBytes := TNetEncoding.Base64.DecodeStringToBytes(_pText);
  SetLength(Result, Length(_vBytes));
  for _vI0 := 0 to High(_vBytes) do
    Result[_vI0 + 1] := Char(_vBytes[_vI0] xor Byte(_pKey[_vI0 mod Length(_pKey) + 1]));
end;

function TMainForm.Encrypt(_pText: string; _pKey: String = C_KEY): string;
var
  _vI0: Integer;
  _vBytes: TBytes;
begin
  // # : - encrypt
  if (_pKey = '') then
    _pKey := C_KEY;
  SetLength(_vBytes, Length(_pText));
  for _vI0 := 1 to Length(_pText) do
    _vBytes[_vI0 - 1] := Byte(_pText[_vI0]) xor Byte(_pKey[(_vI0 - 1) mod Length(_pKey) + 1]);
  Result := TNetEncoding.Base64.EncodeBytesToString(_vBytes);
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // # : - config - write
  Self.ConfigWrite;
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

function TMainForm.UserLogin(_pUser: string; _pDomain: string; _pPassword: string): Boolean;
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

end.
