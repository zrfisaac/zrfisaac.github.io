program zrfisaac;

{$IFDEF DEBUG}
  {$APPTYPE CONSOLE}
{$ENDIF}

uses
  Forms,
  uMenuMain in 'Sources\uMenuMain.pas' {MenuMain},
  uUnitConfig in 'Libraries\Base\uUnitConfig.pas',
  uUnitHelp in 'Libraries\Base\uUnitHelp.pas',
  uFormAbout in 'Libraries\Base\uFormAbout.pas' {FormAbout},
  uModelForm in 'Sources\uModelForm.pas' {ModelForm},
  uMenuConfig in 'Sources\uMenuConfig.pas' {MenuConfig};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'ZRFISAAC';
  Application.CreateForm(TMenuMain, MenuMain);
  Application.Run;
end.
