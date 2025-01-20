// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io

// # [ delphi2007 ]
unit umain;

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
  StdCtrls,
  ExtCtrls,
  Buttons,
  ComCtrls;

type
  TfrmMain = class(TForm)
    pnBack: TPanel;
    meText: TMemo;
    pnFooter: TPanel;
    btRun: TBitBtn;
    procedure btRunClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  end;

  TThreadExample = class(TThread)
  private
    vGUID: string;
    vStep: Integer;
    procedure Update;
  protected
    constructor Create;
    procedure Execute; override;
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

function fnGUID: string;
var
  AGUID :TGUID;
begin
  CreateGUID(AGUID);
  Result := GUIDToString(AGUID);
end;

procedure fnWait(Handle: THandle);
begin
  repeat
    if MsgWaitForMultipleObjects(1, Handle, False, INFINITE, QS_ALLINPUT) = WAIT_OBJECT_0 + 1 then
    begin
      Application.ProcessMessages;
    end
    else
    begin
      Break;
    end;
  until False;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  Self.Caption := Application.Title;
end;

procedure TfrmMain.btRunClick(Sender: TObject);
var
  _vThread: TThreadExample;
begin
  _vThread := TThreadExample.Create;
  _vThread.Resume;
  //fnWait(_vThread.Handle);
end;

{ TThreadExample }

constructor TThreadExample.Create;
begin
  vGUID := fnGUID;
  vStep := 0;
  inherited Create(True);
end;

procedure TThreadExample.Execute;
begin
  inherited;
  // # : - step - 01
  Sleep(1000);
  vStep := 1;
  Synchronize(Update);

  // # : - step - 02
  Sleep(1000);
  vStep := 2;
  Synchronize(Update);

  // # : - step - 03
  Sleep(1000);
  vStep := 3;
  Synchronize(Update);
end;

procedure TThreadExample.Update;
begin
  frmMain.meText.Lines.Add(vGUID + ' : ' + IntToStr(vStep))
end;

end.
