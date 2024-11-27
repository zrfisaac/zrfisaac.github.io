// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io

// # [ delphixe2 ]
program zrfisaac;

{$IFDEF DEBUG}
  {$APPTYPE CONSOLE}
{$ENDIF}

uses
  // # : - delphi
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Data.FMTBcd,
  Data.SqlExpr,
  Data.DB,
  Data.DBXMSSQL,
  Data.DBXOdbc;

{$R *.res}

const
  cAboutAuthor = 'Isaac Caires';
  cAboutAuthorEmail = 'Isaac Caires';
  cAboutAuthorSite = 'zrfisaac.github.io';
  cAboutVersionName = 'zrfisaac.delphixe2.shell.devart.v01';
  cAboutVersionValue = '1.0.0';

var
  vConfig: TStrings;
  vConfigPath: string;
  vDatabase: TSQLConnection;
  vEndError: Boolean;
  vEndMessage: TStrings;
  vI0: Integer;
  vQuery: TSQLQuery;

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

    // # : - config
    // {
    WriteLn('# - config');
    vConfigPath := GetCurrentDir + '\config.ini';
    vConfig := TStringList.Create;
    //if (FileExists(vConfigPath)) then
      //vConfig.LoadFromFile(vConfigPath)
    //else
    //begin
      vConfig.Values['LoginPrompt'] := 'False';
      //vConfig.Values['DriverName'] := 'ODBC Driver 18 for SQL Server';
      vConfig.Values['DriverName'] := 'ODBC';
      vConfig.Values['HostName'] := '127.0.0.1';
      vConfig.Values['Database'] := 'master';
      vConfig.Values['User_Name'] := 'sa';
      vConfig.Values['Password'] := 'ABcd!@34';
      vConfig.Values['Script'] := 'SELECT @@VERSION AS [VERSION]';
      //vConfig.SaveToFile(vConfigPath);
    //end;
    // }

    // # : - database
    // {
    WriteLn('# - database');
    vDatabase := TSQLConnection.Create(Application);
    with (vDatabase) do
    begin
      Close;
      if (vConfig.Values['LoginPrompt'] = 'True')
      or (vConfig.Values['LoginPrompt'] = 'Yes')
      or (vConfig.Values['LoginPrompt'] = 'Verdade')
      or (vConfig.Values['LoginPrompt'] = 'Verdadeiro')
      or (vConfig.Values['LoginPrompt'] = 'Si')
      or (vConfig.Values['LoginPrompt'] = 'Sim')
      or (vConfig.Values['LoginPrompt'] = '1') then
        LoginPrompt := True
      else
        LoginPrompt := False;
      DriverName := 'ODBC';
      VendorLib := 'msodbcsql18.dll';
      for vI0 := 0 to vConfig.Count - 1 do
        Params.Values[vConfig.Names[vI0]] := vConfig.ValueFromIndex[vI0];
      Params.Values['ConnectionString'] := (''
        + 'Driver={ODBC Driver 18 for SQL Server};'
        + 'Server=127.0.0.1;'
        + 'Database=master;'
        + 'Uid=sa;'
        + 'Pwd='+ vConfig.Values['Password'] + ';'
        + 'Encrypt=yes;'
        + 'TrustServerCertificate=yes'
      );
      Open;
    end;
    // }

  except
    on E: Exception do
    begin
      vEndError := True;
      vEndMessage.Add(E.Message);
      //raise;
    end;
  end;

  // # : - end
  WriteLn('');
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

