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
  ComCtrls,
  StdCtrls,
  ExtCtrls;

type
  TMainForm = class(TForm)
    sbStatus: TStatusBar;
    miText: TMemo;
    btRun: TButton;
    pnFooter: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure miTextChange(Sender: TObject);
    procedure btRunClick(Sender: TObject);
  public
    procedure ScreenD(_pOutput: String);
  end;

var
  MainForm: TMainForm;

implementation

uses
  main_data,
  main_thread;

{$R *.dfm}


procedure TMainForm.FormCreate(Sender: TObject);
begin
  // # : - title
  Self.Caption := Application.Title;

  // # : - data
  if not Assigned(MainData) then
    MainData := TMainData.Create(Application);
end;

procedure TMainForm.miTextChange(Sender: TObject);
var
  _vMemo: TMemo;
begin
  _vMemo := TMemo(Sender);
  _vMemo.SelStart := Length(_vMemo.Text);
  _vMemo.SelLength := 0;
  _vMemo.Perform(EM_SCROLLCARET, 0, 0);
end;

procedure TMainForm.btRunClick(Sender: TObject);
begin
  TMainThread.Create(ScreenD);
end;

procedure TMainForm.ScreenD(_pOutput: String);
begin
  Self.miText.Lines.Add(_pOutput);
end;

end.
