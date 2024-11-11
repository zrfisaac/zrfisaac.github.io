// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io

// # [ delphi12 ]
unit menu_about;

interface

uses
  // # : - delphi
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
  Vcl.StdCtrls,
  System.Actions,
  Vcl.ActnList,
  Winapi.ShellAPI;

type
  TMenuAbout = class(TForm)
    pnBack: TPanel;
    pnBack01: TPanel;
    lbTitle01: TLabel;
    lbTitle02: TLabel;
    lbTitle03: TLabel;
    acAction: TActionList;
    acEsc: TAction;
    acEnter: TAction;
    pnBack02: TPanel;
    pnBack03: TPanel;
    lbTitle04: TLabel;
    meAbout: TMemo;
    procedure acEscExecute(Sender: TObject);
    procedure acEnterExecute(Sender: TObject);
    procedure lbTitle04Click(Sender: TObject);
  public
    procedure Exit;
    class procedure Start; overload;
    class procedure Start(var _pReference); overload;
  end;

var
  MenuAbout: TMenuAbout;

implementation

{$R *.dfm}

procedure TMenuAbout.acEnterExecute(Sender: TObject);
begin
  Self.Exit;
end;

procedure TMenuAbout.acEscExecute(Sender: TObject);
begin
  Self.Exit;
end;

procedure TMenuAbout.Exit;
begin
  Self.Close;
end;

procedure TMenuAbout.lbTitle04Click(Sender: TObject);
begin
  ShellExecute(0, 'open', PChar('https://zrfisaac.github.io'), nil, nil, SW_SHOWNORMAL);
end;

class procedure TMenuAbout.Start(var _pReference);
var
  _vMenuAbout: TMenuAbout;
begin
  _vMenuAbout := TMenuAbout.Create(TComponent(_pReference));
  _vMenuAbout.ShowModal;
  _vMenuAbout.Free;
end;

class procedure TMenuAbout.Start;
begin
  TMenuAbout.Start(Application);
end;

end.
