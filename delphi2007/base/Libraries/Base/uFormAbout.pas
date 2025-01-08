// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io

// # [ delphi ]
unit uFormAbout;

interface

uses
  // Delphi
  Windows,
  Messages,
  ShellAPI,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  ExtCtrls,
  StdCtrls,
  ActnList;

type
  TFormAbout = class(TForm)
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
    class procedure Start;
  end;

var
  FormAbout: TFormAbout;

implementation

{$R *.dfm}

procedure TFormAbout.acEnterExecute(Sender: TObject);
begin
  Self.Exit;
end;

procedure TFormAbout.acEscExecute(Sender: TObject);
begin
  Self.Exit;
end;

procedure TFormAbout.Exit;
begin
  Self.Close;
end;

procedure TFormAbout.lbTitle04Click(Sender: TObject);
begin
  ShellExecute(0, 'open', PChar('https://zrfisaac.github.io'), nil, nil, SW_SHOWNORMAL);
end;

class procedure TFormAbout.Start;
var
  _Form: TFormAbout;
begin
  _Form := TFormAbout.Create(Application);
  _Form.ShowModal;
  _Form.Free;
end;

end.

