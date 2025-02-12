program zrfisaac;

{$IFDEF DEBUG}
  //{$APPTYPE CONSOLE}
{$ENDIF}

uses
  Forms,
  menu_main in 'source\menu_main.pas' {MenuMain},
  zrlib in '..\..\library\zrlib\zrlib.pas',
  zr_about_d2007 in '..\..\library\zrlib\zr_about_d2007.pas' {ZRAboutD2007};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'ZRFISAAC';
  Application.CreateForm(TMenuMain, MenuMain);
  Application.CreateForm(TZRAboutD2007, ZRAboutD2007);
  Application.Run;
end.
