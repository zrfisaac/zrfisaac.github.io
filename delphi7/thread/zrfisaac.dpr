program zrfisaac;

uses
  Forms,
  main_form in 'source\main_form.pas' {MainForm},
  main_data in 'source\main_data.pas' {MainData: TDataModule},
  main_thread in 'source\main_thread.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ZRFISAAC';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
