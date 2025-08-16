program zrfisaac;

uses
  Forms,
  SysUtils,
  Windows,
  main_data in 'source\main_data.pas' {MainData: TDataModule},
  main_form in 'source\main_form.pas' {MainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.ShowMainForm := False;
  ShowWindow(Application.Handle, SW_HIDE);
  Application.Title := 'ZRFISAAC';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
