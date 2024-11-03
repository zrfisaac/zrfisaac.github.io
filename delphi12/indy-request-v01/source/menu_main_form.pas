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
  // # : - indy
  IdTCPConnection,
  IdTCPClient,
  IdHTTP,
  IdBaseComponent,
  IdComponent,
  IdIOHandler,
  IdIOHandlerSocket,
  IdIOHandlerStack,
  IdSSL,
  IdSSLOpenSSL,
  IdCookieManager;

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
    btRoutine01: TBitBtn;
    meMessage: TMemo;
    meResponse: TMemo;
    spSplitter: TSplitter;
    edUrl02: TEdit;
    edUrl01: TEdit;
    btRoutine02: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure btRoutine01Click(Sender: TObject);
    procedure btRoutine02Click(Sender: TObject);
  end;

var
  MenuMainForm: TMenuMainForm;

implementation

{$R *.dfm}

function fnIndyRequest(AURL: WideString; AMessage: WideString): WideString;
var
  AResult: TStrings;
  AHTTP: TIdHTTP;
  ALine: WideString;
  ARequest: TStringStream;
  AResponse: TMemoryStream;
  ASSL: TIdSSLIOHandlerSocketOpenSSL;
begin
  AResult := TStringList.Create;
  try
    ARequest := TStringStream.Create(AnsiToUtf8(AMessage));
    AResponse := TMemoryStream.Create();
    AHTTP := TIdHTTP.Create(Nil);
    AHTTP.CookieManager := TIdCookieManager.Create(AHTTP);
    ASSL := TIdSSLIOHandlerSocketOpenSSL.Create(Nil);
    AHTTP.IOHandler := ASSL;
    ASSL.SSLOptions.Method := sslvSSLv23;
    AHTTP.Request.ContentType := 'application/json';
    AHTTP.Request.UserAgent := 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36';
    AHTTP.Post(AURL, ARequest, AResponse);
    AResponse.Position := 0;
    AResult.LoadFromStream(AResponse);
  finally
    AHTTP.Free;
    ASSL.Free;
  end;
  AResult.Text := Utf8ToAnsi(AResult.Text);
  Result := AResult.Text;
end;

function fnIndyRequest2(AURL: WideString; AMessage: WideString): WideString;
var
  AResult: TStrings;
  AHTTP: TIdHTTP;
  ALine: WideString;
  ARequest: TStringStream;
  AResponse: TMemoryStream;
  ASSL: TIdSSLIOHandlerSocketOpenSSL;
begin
  AResult := TStringList.Create;
  try
    //ARequest := TStringStream.Create(AnsiToUtf8(AMessage));
    ARequest := TStringStream.Create(Utf8Encode(AMessage), TEncoding.UTF8);
    AResponse := TMemoryStream.Create();
    AHTTP := TIdHTTP.Create(Nil);
    AHTTP.CookieManager := TIdCookieManager.Create(AHTTP);
    ASSL := TIdSSLIOHandlerSocketOpenSSL.Create(Nil);
    AHTTP.IOHandler := ASSL;
    ASSL.SSLOptions.Method := sslvSSLv23;
    AHTTP.Request.ContentType := 'application/json';
    AHTTP.Request.UserAgent := 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36';
    AHTTP.Post(AURL, ARequest, AResponse);
    AResponse.Position := 0;
    AResult.LoadFromStream(AResponse);
  finally
    AHTTP.Free;
    ASSL.Free;
  end;
  AResult.Text := Utf8ToAnsi(AResult.Text);
  Result := AResult.Text;
end;


procedure TMenuMainForm.btRoutine01Click(Sender: TObject);
begin
  // # : - routine
  Self.meResponse.Text := fnIndyRequest2(Self.edUrl01.Text, Self.meMessage.Text);
end;

procedure TMenuMainForm.btRoutine02Click(Sender: TObject);
begin
  // # : - routine
  Self.meResponse.Text := fnIndyRequest2(Self.edUrl02.Text, Self.meMessage.Text);
end;

procedure TMenuMainForm.FormCreate(Sender: TObject);
begin
  // # : - title
  Self.Caption := Application.Title
end;

end.
