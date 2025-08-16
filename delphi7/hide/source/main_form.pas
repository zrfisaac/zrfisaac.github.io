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
  ComCtrls, ExtCtrls;

type
  TMainForm = class(TForm)
    sbFooter: TStatusBar;
    sbBack: TScrollBox;
    tmTimer: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure tmTimerTimer(Sender: TObject);
  end;

var
  MainForm: TMainForm;

implementation

uses
  main_data;

{$R *.dfm}

procedure TMainForm.FormCreate(Sender: TObject);
begin
  // # : - title
  Self.Caption := Application.Title;

  // # : - data
  if not Assigned(MainData) then
    MainData := TMainData.Create(Application);
end;

procedure TMainForm.tmTimerTimer(Sender: TObject);
begin
  ShowMessage('Debug');
end;

end.
