// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io

// # [ lazarus ]
program zrfisaac;

{$mode objfpc}
{$H+}

uses
  // # : - lazarus
  {$IFDEF UNIX}
    cthreads,
  {$ENDIF}
  Forms,
  Interfaces,
  Classes,
  SysUtils,
  CustApp;

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

