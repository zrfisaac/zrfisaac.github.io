// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires Santana
// # - email : zrfisaac@gmail.com
// # - site : zrfisaac.github.io

// # [ delphi7 ]
program zrfisaac;

{$APPTYPE CONSOLE}

uses
  DB,
  DBTables,
  Classes,
  Forms,
  SysUtils;

{$R *.res}

var
  // # : BDE
  vBdeConection: TDatabase;
  vBdeQuery: TQuery;

  // # : Config
  vConfig: TStrings;
  vConfigPath: String;

  // # : Finish
  vFinishMessage: String = '';

  // # : Script
  vScript: TStrings;
  vScriptPath: String;
begin
  // # : Start
  // {
  Writeln('# : Start');
  Application.Initialize;
  Application.Title := 'ZRFISAAC';
  // }

  // # : Config
  // {
  Writeln('# : Config');
  vConfigPath := ExtractFileDir(ParamStr(0)) + '\_.cfg';
  if not FileExists(vConfigPath) then
    vConfigPath := ExtractFileDir(ParamStr(0)) + '\config.cfg';
  vConfig := TStringList.Create;
  if FileExists(vConfigPath) then
    vConfig.LoadFromFile(vConfigPath)
  else
  begin
    vFinishMessage := 'change the configuration than run again';
    vConfig.Values['Bde_Alias'] := 'BDE';
    vConfig.Values['Bde_Server'] := 'localhost';
    vConfig.Values['Bde_User'] := 'sa';
    vConfig.Values['Bde_Password'] := '1234';
    vConfig.Values['Bde_Database'] := 'master';
    vConfig.SaveToFile(vConfigPath);
  end;
  // }

  // # : Script
  // {
  Writeln('# : Script');
  vScriptPath := ExtractFileDir(ParamStr(0)) + '\_.sql';
  if not FileExists(vScriptPath) then
    vScriptPath := ExtractFileDir(ParamStr(0)) + '\script.sql';
  vScript := TStringList.Create;
  if FileExists(vScriptPath) then
    vScript.LoadFromFile(vScriptPath)
  else
  begin
    vScript.Add('SELECT 1 AS ID');
    vScript.SaveToFile(vScriptPath);
  end;
  // }

  // # : BDE
  // {
  Writeln('# : BDE');
  if (vFinishMessage = '') then
  begin
    try
      // # : vBdeConection
      // (*
      Writeln('# . - : vBdeConection');
      vBdeConection := TDatabase.Create(Application);
      vBdeConection.Close;
      vBdeConection.LoginPrompt := False;
      vBdeConection.DatabaseName := 'dbBDE';
      vBdeConection.AliasName := vConfig.Values['Bde_Alias'];
      vBdeConection.Params.Values['SERVER NAME'] := vConfig.Values['Bde_Server'];
      vBdeConection.Params.Values['USER NAME'] := vConfig.Values['Bde_User'];
      vBdeConection.Params.Values['PASSWORD'] := vConfig.Values['Bde_Password'];
      vBdeConection.Params.Values['DATABASE NAME'] := vConfig.Values['Bde_Database'];
      vBdeConection.Open;
      // *)

      // # : vBdeQuery
      // (*
      Writeln('# . - : vBdeQuery');
      vBdeQuery := TQuery.Create(Application);
      vBdeQuery.Close;
      vBdeQuery.DatabaseName := vBdeConection.DatabaseName;
      vBdeQuery.SQL.LoadFromFile(vScriptPath);
      vBdeConection.Open;
      vBdeConection.Close;
      // *)
    except
      on e: Exception do
      begin
        Writeln(Format('# . - Error : %s',[e.Message]));
      end;
    end;
  end;
  // }

  // # : Finish
  // {
  Writeln('# : Finish');
  if not(vFinishMessage = '') then
    Writeln(Format('# . - Message : %s',[vFinishMessage]));
  Readln;
  // }
end.

