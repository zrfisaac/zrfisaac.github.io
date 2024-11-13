program zrfisaac;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, menu_main, module_main, menu_about
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Title:='ZRFISAAC';
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TMenuMain, MenuMain);
  Application.Run;
end.

