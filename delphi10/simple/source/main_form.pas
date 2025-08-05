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
  Vcl.Dialogs, Vcl.ComCtrls;

type
  TMainForm = class(TForm)
    sbFooter: TStatusBar;
    sbBack: TScrollBox;
    procedure FormCreate(Sender: TObject);
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

end.
