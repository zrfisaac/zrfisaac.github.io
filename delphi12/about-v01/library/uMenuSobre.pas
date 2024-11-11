// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io

// # [ delphi12 ]
unit uMenuSobre;

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
  Vcl.ActnList;

type
  TfrmMenuSobre = class(TForm)
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
  public
    procedure Sair;
  end;

var
  frmMenuSobre: TfrmMenuSobre;

implementation

{$R *.dfm}

procedure TfrmMenuSobre.acEnterExecute(Sender: TObject);
begin
  Self.Sair;
end;

procedure TfrmMenuSobre.acEscExecute(Sender: TObject);
begin
  Self.Sair;
end;

procedure TfrmMenuSobre.Sair;
begin
  Self.Close;
end;

end.
