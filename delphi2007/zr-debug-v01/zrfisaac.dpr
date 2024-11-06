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
  uZRDebug in 'library\uZRDebug.pas';

{$R *.res}

begin
  Application.Initialize;
  try
    Writeln('Hello, World!');
    fnZRDebug('A');
    fnZRDebug('B');
    fnZRDebug('C');
  except
    on E:Exception do
    begin
      Writeln(E.Message);
      raise;
    end;
  end;
  Readln;
end.
