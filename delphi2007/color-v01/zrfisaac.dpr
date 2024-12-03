program zrfisaac;

uses
  Forms,
  uMenuMain in 'source\uMenuMain.pas' {MenuMain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'ZRFISAAC';
  Application.CreateForm(TMenuMain, MenuMain);
  Application.Run;
end.
