program zrfisaac;

uses
  Forms,
  menu_main_form in 'source\menu_main_form.pas' {MenuMainForm},
  zrlib in '..\..\zrlib.pas',
  menu_main_data in 'source\menu_main_data.pas' {MenuMainData: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ZRFISAAC';
  Application.CreateForm(TMenuMainForm, MenuMainForm);
  Application.Run;
end.
