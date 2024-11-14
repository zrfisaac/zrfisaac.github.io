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
  CustApp,
  Windows,
  debug_unit;

{$R *.res}

const
  cAboutAuthor = 'Isaac Caires';
  cAboutAuthorEmail = 'Isaac Caires';
  cAboutAuthorSite = 'zrfisaac.github.io';
  cAboutVersionName = 'zrfisaac.lazarus.shell.odbc.v01';
  cAboutVersionValue = '0.0.1';

var
  vEndError: Boolean;
  vEndMessage: TStrings;
  vI0: Integer;

begin
  // # : - about
  WriteLn('# [ zrfisaac ]');
  WriteLn('');
  WriteLn('# [ about ]');
  WriteLn(Format('# - author : %s',[cAboutAuthor]));
  WriteLn(Format('# . - email : %s',[cAboutAuthorEmail]));
  WriteLn(Format('# . - site : %s',[cAboutAuthorSite]));
  WriteLn(Format('# - version : %s : %s',[cAboutVersionName,cAboutVersionValue]));
  WriteLn('');

  // # : - variable
  vEndError := False;
  vEndMessage := TStringList.Create;

  // # : - main
  Application.Initialize;
  try
    WriteLn('# [ main ]');

    // # : - routine
    WriteLn('# - routine ');
    WriteLn('');

    // # : - : ListODBCDataSources
    WriteLn('# - : ListODBCDataSources ');
    ListODBCDataSources;
    WriteLn('');

    // # : - : ListODBCDrivers
    WriteLn('# - : ListODBCDrivers ');
    ListODBCDrivers;
    WriteLn('');
  except
    on E: Exception do
    begin
      vEndError := True;
      vEndMessage.Add(E.Message);
      WriteLn('');
      //raise;
    end;
  end;

  // # : - end
  WriteLn('# [ end ]');
  if (vEndError) then
    WriteLn('# - error')
  else
    WriteLn('# - success');
  if (vEndMessage.Count = 1) then
    WriteLn(Format('# - message : %s',[vEndMessage[0]]))
  else if (vEndMessage.Count > 1) then
  begin
    WriteLn('# - message');
    for vI0 := 0 to vEndMessage.Count - 1 do
    begin
      WriteLn(vEndMessage[vI0]);
    end;
    WriteLn(Format('# . - : %s',[vEndMessage[0]]))
  end;
  vEndMessage.Free;
  Readln;
end.

