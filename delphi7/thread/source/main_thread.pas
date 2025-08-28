unit main_thread;

interface

uses
  Windows,
  Classes,
  SysUtils;

type
  TMainThread_Screen = procedure(_pOutput: String) of object;

  TMainThread = class(TThread)
  protected
    vId: Integer;
    vOutput: String;
    procedure Execute; override;
    procedure ExecuteScreen;
  public
    Screen: TMainThread_Screen;
    constructor Create(_pScreen: TMainThread_Screen = Nil);
  end;

implementation

{ TMainThread }

var
  vCount: Integer;

constructor TMainThread.Create(_pScreen: TMainThread_Screen = Nil);
begin
  vCount := vCount + 1;
  vId := vCount;
  vOutput := '';
  Self.Screen := _pScreen;
  inherited Create(False); // False = Autostart
  FreeOnTerminate := True; // Free memory
end;

procedure TMainThread.Execute;
begin
  inherited;
  while not Terminated do
  begin
    vOutput := IntToStr(Self.vId) + ' - ' + FormatDateTime('hh:mm:ss.zzz',Now);
    Synchronize(Self.ExecuteScreen);
    Sleep(1000);
  end;
end;

procedure TMainThread.ExecuteScreen;
begin
  if Assigned(Screen) then
    Self.Screen(vOutput);
end;

initialization
  vCount := 0;
end.
