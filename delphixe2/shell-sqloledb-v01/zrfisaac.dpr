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
  cAboutVersionName = 'zrfisaac.delphixe2.shell.sqloledb.v01';
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
    WriteLn('# - config');
    vConfigPath := GetCurrentDir + '\config.ini';
    vConfig := TStringList.Create;
    if (FileExists(vConfigPath)) then
      vConfig.LoadFromFile(vConfigPath)
    else
    begin
      vConfig.Values['LoginPrompt'] := 'False';
      vConfig.Values['DriverName'] := 'MSSQL';
      vConfig.Values['ConnectionName'] := 'Devart SQLServer';
      vConfig.Values['GetDriverFunc'] := 'getSQLDriverSQLServer';
      vConfig.Values['LibraryName'] := 'dbxmss.dll';
      vConfig.Values['VendorLib'] := 'sqlncli11.dll';
      vConfig.Values['HostName'] := 'localhost';
      vConfig.Values['User_Name'] := 'sa';
      vConfig.Values['Password'] := 'ABcd!@34';
      vConfig.Values['Database'] := 'master';
      vConfig.Values['Script'] := 'SELECT @@VERSION AS [VERSION]';
      vConfig.SaveToFile(vConfigPath);
    end;

    // # : - database
     {
    WriteLn('# - database');
    vDatabase := TSQLConnection.Create(nil);
    with (vDatabase) do
    begin
      Close;
      LoginPrompt := False;
      //LoadParamsFromIniFile();
      DriverName := 'MSSQL';
      Params.Values['HostName'] := 'localhost';
      Params.Values['Database'] := 'master';
      Params.Values['User_Name'] := 'sa';
      Params.Values['Password'] := 'Maker@123';
      Params.Values['Provider'] := 'SQLOLEDB';
      Open;
    end;
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
      DriverName := vConfig.Values['DriverName'];
      ConnectionName := vConfig.Values['ConnectionName'];
      GetDriverFunc := vConfig.Values['GetDriverFunc'];
      LibraryName := vConfig.Values['LibraryName'];
      VendorLib := vConfig.Values['VendorLib'];
      Params.Values['DriverName'] := vConfig.Values['DriverName'];
      Params.Values['ConnectionName'] := vConfig.Values['ConnectionName'];
      Params.Values['GetDriveFunc'] := vConfig.Values['GetDriveFunc'];
      Params.Values['LibraryName'] := vConfig.Values['LibraryName'];
      Params.Values['VendorLib'] := vConfig.Values['VendorLib'];
      Params.Values['HostName'] := vConfig.Values['HostName'];
      Params.Values['User_Name'] := vConfig.Values['User_Name'];
      Params.Values['Password'] := vConfig.Values['Password'];
      Params.Values['Database'] := vConfig.Values['Database'];
      Open;
    end;
    // }

    // # : - query
     {
    WriteLn('# - query');
    vQuery := TSQLQuery.Create(Application);
    vQuery.SQLConnection := vDatabase;
    vQuery.Close;
    vQuery.SQL.Text := vConfig.Values['Script'];
    vQuery.Open;
    WriteLn(''
      + '# . : '
      + (
        StringReplace(
        StringReplace(
          vQuery.Fields[0].AsString
        ,#13,' ',[rfReplaceAll, rfIgnoreCase])
        ,#10,'',[rfReplaceAll, rfIgnoreCase])
      )
    );
    // }

    // # : - end
     {
    vDatabase.Close;
    vQuery.Close;
    vQuery.Free;
    vDatabase.Free;
    vConfig.Free;
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

