unit main_service;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  SvcMgr,
  Dialogs;

type
  TZRFIService = class(TService)
    procedure ServiceStop(Sender: TService; var Stopped: Boolean);
    procedure ServiceStart(Sender: TService; var Started: Boolean);
  public
    function GetServiceController: TServiceController; override;
  end;

  TMainThread = class(TThread)
  protected
    procedure Execute; override;
  end;

var
  ZRFIService: TZRFIService;
  MainThread: TMainThread;

implementation

{$R *.DFM}

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  ZRFIService.Controller(CtrlCode);
end;

function TZRFIService.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;

procedure TZRFIService.ServiceStop(Sender: TService; var Stopped: Boolean);
begin
  Stopped := False;
end;

procedure TZRFIService.ServiceStart(Sender: TService;
  var Started: Boolean);
begin
  try
    MainThread := TMainThread.Create(False);
    Started := True;
  except
    on E: Exception do
    begin
      Started := False;
    end;
  end;
end;

{ TMain }

procedure TMainThread.Execute;
begin
  inherited;

end;

end.
