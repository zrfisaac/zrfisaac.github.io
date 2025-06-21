program zrfisaac;

uses
  SvcMgr,
  main_service in 'source\main_service.pas' {ZRFIService: TService};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'ZRFISAAC';
  Application.CreateForm(TZRFIService, ZRFIService);
  Application.Run;
end.
