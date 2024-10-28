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
  example in 'source\example.pas';

{$R *.res}

var
  AConfigurationManager: TConfigurationManager;

begin
  Application.Initialize;
  try
    // # - begin
    Writeln('# [ begin ]');
    Writeln('# - : Singleton');
    AConfigurationManager := TConfigurationManager.GetInstance;

    // # - end
    Writeln;
    Writeln('# [ end ]');
  except
    on E:Exception do
    begin
      Writeln(E.Message);
      raise;
    end;
  end;
  Readln;
end.
