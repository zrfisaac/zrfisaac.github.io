// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires Santana
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io

// # [ delphi ]
unit zrabout;

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
  Dialogs, ExtCtrls, ActnList;

type
  TZRAboutForm = class(TForm)
    pnBack: TPanel;
    acAction: TActionList;
    acEscape: TAction;
    acReturn: TAction;
    procedure acEscapeExecute(Sender: TObject);
    procedure acReturnExecute(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  public
    procedure fnClose;
  end;

var
  ZRAboutForm: TZRAboutForm;

implementation

{$R *.dfm}

procedure TZRAboutForm.acEscapeExecute(Sender: TObject);
begin
  Self.fnClose;
end;

procedure TZRAboutForm.fnClose;
begin
  Self.Close;
end;

procedure TZRAboutForm.acReturnExecute(Sender: TObject);
begin
  Self.fnClose;
end;

procedure TZRAboutForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Self.fnClose;
end;

end.
