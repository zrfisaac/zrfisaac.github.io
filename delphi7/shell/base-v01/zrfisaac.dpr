// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires Santana
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io

// # [ delphi7 ]
program zrfisaac;

uses
  Forms,
  SysUtils,
  base in 'base.pas';

{$APPTYPE CONSOLE}
{$R *.res}

// # : - variable
var
  _vError: String = '';

begin
  // # : - initialization
  Application.Title := 'ZRFISAAC';
  Application.Initialize;

  // # : - try
  try
    // # : - begin
    Writeln('# - : ', ParamStr(0));

  except
    on E: Exception do
    begin
      _vError := E.ClassName + ': ' + E.Message;
    end;
  end;

  // # : - end
  if (_vError = '') then
    Writeln('# . - end')
  else
    Writeln('# . - end : ' + _vError);
  Readln;
end.
