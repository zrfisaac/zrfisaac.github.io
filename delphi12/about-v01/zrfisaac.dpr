program zrfisaac;

{$IFDEF DEBUG}
  {$APPTYPE CONSOLE}
{$ENDIF}

uses
  Forms,
  menu_main in 'source\menu_main.pas' {MenuMain},
  module_main in 'source\module_main.pas' {ModuleMain: TDataModule},
  menu_about in 'library\menu_about.pas' {MenuAbout};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'ZRFISAAC';
  Application.CreateForm(TMenuMain, MenuMain);
  Application.CreateForm(TModuleMain, ModuleMain);
  Application.CreateForm(TMenuAbout, MenuAbout);
  Application.Run;
end.
