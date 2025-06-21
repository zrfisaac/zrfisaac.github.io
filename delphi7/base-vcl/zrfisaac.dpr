program zrfisaac;

uses
  Forms,
  menu_main_form in 'source\menu_main_form.pas' {MenuMainForm},
  zrlib in '..\..\zrlib.pas',
  model_base_form in 'source\model_base_form.pas' {ModelBaseForm},
  zrabout in '..\..\zrabout.pas' {ZRAboutForm},
  model_page_form in 'source\model_page_form.pas' {ModelPageForm},
  menu_config_form in 'source\menu_config_form.pas' {MenuConfigForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ZRFISAAC';
  Application.CreateForm(TMenuMainForm, MenuMainForm);
  Application.CreateForm(TModelBaseForm, ModelBaseForm);
  Application.CreateForm(TZRAboutForm, ZRAboutForm);
  Application.CreateForm(TModelPageForm, ModelPageForm);
  Application.CreateForm(TMenuConfigForm, MenuConfigForm);
  Application.Run;
end.
