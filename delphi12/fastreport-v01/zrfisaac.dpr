program zrfisaac;

{$IFDEF DEBUG}
  {$APPTYPE CONSOLE}
{$ENDIF}

uses
  Forms,
  menu_main_form in 'source\menu_main_form.pas' {MenuMainForm},
  menu_main_data in 'source\menu_main_data.pas' {MenuMainData: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'ZRFISAAC';
  Application.CreateForm(TMenuMainForm, MenuMainForm);
  Application.CreateForm(TMenuMainData, MenuMainData);
  Application.Run;
end.
