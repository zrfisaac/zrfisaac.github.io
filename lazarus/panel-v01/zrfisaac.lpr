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
  Forms, menu_main_form, menu_main_data
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Title:='ZRFISAAC';
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TMenuMainForm, MenuMainForm);
  Application.Run;
end.

