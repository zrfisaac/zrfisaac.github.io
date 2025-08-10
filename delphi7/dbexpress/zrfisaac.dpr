program zrfisaac;

uses
  Forms,
  main_form in 'source\main_form.pas' {MainForm},
  main_data in 'source\main_data.pas' {MainData: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ZRFISAAC';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
