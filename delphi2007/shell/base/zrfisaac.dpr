// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io

// # [ delphi2007 ]
program zrfisaac;

{$APPTYPE CONSOLE}

uses
  Classes,
  Forms,
  SysUtils;

{$R *.res}

var
  _vError: Boolean;
  _vErrorMessage: string;

begin
  // # : - variable
  _vError := False;
  _vErrorMessage := '';

  // # : - begin
  // (*
  Writeln('# [ begin ]');
  Application.Initialize;
  Application.Title := 'ZRFISAAC';
  Writeln('');
  // *)

  // # : - main
  // (*
  Writeln('# [ main ]');
  try
    // # : - routine
    // {
    Writeln('# - routine');
    // }
  except
    on e: Exception do
    begin
      _vError := True;
      _vErrorMessage := e.Message;
    end;
  end;
  Writeln('');
  // *)

  // # : - end
  // (*
  Writeln('# [ end ]');
  if (_vError) then
  begin
    Writeln('# - error : ' + _vErrorMessage);
  end
  else
    Writeln('# - success');
  Readln;
  // *)
end.
