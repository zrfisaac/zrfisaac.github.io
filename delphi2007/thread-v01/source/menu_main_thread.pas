// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io

// # [ delphi2007 ]
unit menu_main_thread;

interface

uses
  // # : - delphi
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs;

type
  TMenuMainThread = class(TThread)
  private
    FCount: Integer;
    FName: string;
    function GetCount: string;
  protected
    property Count: string read GetCount;
    constructor Create;
    procedure Execute; override;
    procedure Status;
    procedure StatusEnd;
  public
    class procedure Run;
  end;

implementation

uses
  menu_main_form;

{ TMenuMainThread }

constructor TMenuMainThread.Create;
var
  _vGUID: TGUID;
begin
  inherited Create(True);

  if (CreateGUID(_vGUID) = S_OK) then
    Self.FName := GUIDToString(_vGUID);
end;

procedure TMenuMainThread.Execute;
var
  _vWait: Integer;
begin
  inherited;
  _vWait := 300;

  // # : - 01
  Synchronize(Status);
  Sleep(_vWait);

  // # : - 02
  Synchronize(Status);
  Sleep(_vWait);

  // # : - 03
  Synchronize(Status);
  Sleep(_vWait);

  // # : - 04
  Synchronize(Status);
  Sleep(_vWait);

  // # : - END
  Synchronize(StatusEnd);
end;

function TMenuMainThread.GetCount: string;
begin
  Result := IntToStr(Self.FCount);
end;

class procedure TMenuMainThread.Run;
var
  _vThread: TMenuMainThread;
begin
  _vThread := TMenuMainThread.Create;
  _vThread.Resume;
end;

procedure TMenuMainThread.Status;
begin
  Self.FCount := Self.FCount + 1;
  MenuMainForm.meText.Lines.Add(Self.FName + ' : ' + Self.Count);
end;

procedure TMenuMainThread.StatusEnd;
begin
  MenuMainForm.meText.Lines.Add(Self.FName + ' : END');
end;

end.
