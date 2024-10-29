// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io

// # [ delphi2007 ]
program zrfisaac;

{$IFDEF DEBUG}
  {$APPTYPE CONSOLE}
{$ENDIF}

uses
  Forms,
  SysUtils,
  uconfig in 'source\uconfig.pas',
  debug_form in 'source\debug_form.pas' {DebugForm};

{$R *.res}

begin
  Application.Initialize;
  try
    Writeln('Hello, World!');
  except
    on E:Exception do
    begin
      Writeln(E.Message);
      raise;
    end;
  end;
  Readln;
end.
