program zrfisaac;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces,
  Forms,
  menu_main,
  module_main,
  menu_about;

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Title:='ZRFISAAC';
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TMenuMain, MenuMain);
  Application.Run;
end.

