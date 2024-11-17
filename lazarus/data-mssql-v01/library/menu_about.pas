// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io

// # [ lazarus ]
unit menu_about;

{$mode ObjFPC}
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
  ActnList,
  {$IFDEF WINDOWS}
    Windows,
    ShellAPI,
  {$ENDIF}
  StdCtrls;

type

  { TMenuAbout }

  TMenuAbout = class(TForm)
    acAction: TActionList;
    acEnter: TAction;
    acEsc: TAction;
    lbTitle01: TLabel;
    lbTitle02: TLabel;
    lbTitle03: TLabel;
    lbTitle04: TLabel;
    meAbout: TMemo;
    pnBack: TPanel;
    pnBack01: TPanel;
    pnBack02: TPanel;
    pnBack03: TPanel;
    procedure acEnterExecute(Sender: TObject);
    procedure acEscExecute(Sender: TObject);
    procedure lbTitle04Click(Sender: TObject);
  public
    procedure Exit;
    class procedure Start; overload;
    class procedure Start(var _pReference); overload;
  end;

var
  MenuAbout: TMenuAbout;

implementation

{$R *.lfm}

{ TMenuAbout }

procedure TMenuAbout.acEscExecute(Sender: TObject);
begin
  Self.Exit;
end;

procedure TMenuAbout.lbTitle04Click(Sender: TObject);
begin
  {$IFDEF WINDOWS}
    ShellExecute(0, 'open', PChar('https://zrfisaac.github.io'), nil, nil, SW_SHOWNORMAL);
  {$ENDIF}
  {$IFDEF LINUX}
  ExecuteProcess('/usr/bin/xdg-open', 'https://zrfisaac.github.io', []);
  {$ENDIF}
end;

procedure TMenuAbout.acEnterExecute(Sender: TObject);
begin
  Self.Exit;
end;

procedure TMenuAbout.Exit;
begin
  Self.Close;
end;

class procedure TMenuAbout.Start;
begin
  TMenuAbout.Start(Application);
end;

class procedure TMenuAbout.Start(var _pReference);
var
  _vMenuAbout: TMenuAbout;
begin
  _vMenuAbout := TMenuAbout.Create(TComponent(_pReference));
  _vMenuAbout.ShowModal;
  _vMenuAbout.Free;
end;

end.

