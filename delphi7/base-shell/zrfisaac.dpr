// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires Santana
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io

// # [ delphi7 ]
program zrfisaac;

{$APPTYPE CONSOLE}

uses
  Forms,
  SysUtils,
  zrlib in '..\..\zrlib.pas';

{$R *.res}

var
  _Error: Boolean;
  _ErrorMessage: String;

begin
  // # - application
  Application.Initialize;
  Application.Title := 'ZRFISAAC';

  // # - version
  // {
  Writeln('# - version - : ' + ZRInternalName + ' : ' + ZRFileVersion);
  // }

  // # - variable
  // {
  Writeln('# - variable');
  _Error := False;
  _ErrorMessage := '';
  // }

  // # - routine
  // {
  if not(_Error) then
  begin
    try
      Writeln('# - routine');
    except
      on e: Exception do
      begin
        _Error := True;
        _ErrorMessage := e.Message;
      end;
    end;
  end;
  // }

  // # - end
  // {
  Writeln('# - end');
  if (_Error) then
    Writeln('# . - error : ' + _ErrorMessage);
  Readln;
  // }
end.
