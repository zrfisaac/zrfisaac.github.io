// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires Santana
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io

// # [ lazarus ]
unit zrabout_lazarus;

{$mode ObjFPC}
{$H+}

interface

uses
  Classes,
  SysUtils,
  Forms,
  Controls,
  Graphics,
  Dialogs, ExtCtrls, ActnList;

type

  { TZRAboutForm }

  TZRAboutForm = class(TForm)
    acAction: TActionList;
    acEscape: TAction;
    acReturn: TAction;
    pnBack: TPanel;
    procedure acEscapeExecute(Sender: TObject);
    procedure acReturnExecute(Sender: TObject);
  public
    procedure fnClose;
  end;

var
  ZRAboutForm: TZRAboutForm;

implementation

{$R *.lfm}

{ TZRAboutForm }

procedure TZRAboutForm.acEscapeExecute(Sender: TObject);
begin
  Self.fnClose;
end;

procedure TZRAboutForm.acReturnExecute(Sender: TObject);
begin
  Self.fnClose;
end;

procedure TZRAboutForm.fnClose;
begin
  Self.Close;
end;

end.

