program zrfisaac;

{$IFDEF debug}
  {$APPTYPE CONSOLE}
{$ENDIF}

uses
  Forms,
  uMenuMain in 'source\uMenuMain.pas' {MenuMain},
  uDataMain in 'source\uDataMain.pas' {DataMain: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'ZRFISAAC';
  Application.CreateForm(TMenuMain, MenuMain);
  Application.Run;
end.
