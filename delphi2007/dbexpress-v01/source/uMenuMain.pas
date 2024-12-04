unit uMenuMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Grids, DBGrids, ExtCtrls, StdCtrls, DB, DBClient, SimpleDS,TypInfo,
  FMTBcd, SqlExpr, xmldom, Provider, Xmlxform;

type
  TMenuMain = class(TForm)
    pcFundo: TPageControl;
    tsPostgres: TTabSheet;
    tsMssql: TTabSheet;
    sbMssql: TScrollBox;
    sbPostgres: TScrollBox;
    dbgPostgres: TDBGrid;
    dbgMssql: TDBGrid;
    staMssql: TStatusBar;
    staPostgres: TStatusBar;
    pnMssql: TPanel;
    pnPostgres: TPanel;
    btMssqlPostAndApply: TButton;
    pnPostgresServidor: TPanel;
    Servidor: TLabel;
    edPostgresServidor: TEdit;
    pnPostgresUsuario: TPanel;
    lbPostgresUsuario: TLabel;
    edPostgresUsuario: TEdit;
    pnPostgresSenha: TPanel;
    lbPostgresSenha: TLabel;
    edPostgresSenha: TEdit;
    pnPostgresBanco: TPanel;
    lbPostgresBanco: TLabel;
    edPostgresBanco: TEdit;
    pnMssqlBanco: TPanel;
    lbMssqlBanco: TLabel;
    edMssqlBanco: TEdit;
    pnMssqlSenha: TPanel;
    lbMssqlSenha: TLabel;
    edMssqlSenha: TEdit;
    pnMssqlUsuario: TPanel;
    lbMssqlUsuario: TLabel;
    edMssqlUsuario: TEdit;
    pnMssqlServidor: TPanel;
    lbMssqlServidor: TLabel;
    edMssqlServidor: TEdit;
    edMssqlPostAndApply: TEdit;
    btMssqlApplyAfterPost: TButton;
    edMssqlApplyAfterPost: TEdit;
    btPostgresPostAndApply: TButton;
    edPostgresPostAndApply: TEdit;
    btPostgresApplyAfterPost: TButton;
    edPostgresApplyAfterPost: TEdit;
    edMssqlInsertAnalogic: TEdit;
    btMssqlInsertAnalogic: TButton;
    btPostgresInsertAnalogic: TButton;
    edPostgresInsertAnalogic: TEdit;
    btMssqlInsertAnalogic2: TButton;
    edMssqlInsertAnalogic2: TEdit;
    edPostgresInsertAnalogic2: TEdit;
    btPostgresInsertAnalogic2: TButton;
    btXmlSave: TButton;
    btXmlLoad: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btMssqlPostAndApplyClick(Sender: TObject);
    procedure btPostgresPostAndApplyClick(Sender: TObject);
    procedure btMssqlApplyAfterPostClick(Sender: TObject);
    procedure btPostgresApplyAfterPostClick(Sender: TObject);
    procedure _edChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btMssqlInsertAnalogicClick(Sender: TObject);
    procedure btMssqlInsertAnalogic2Click(Sender: TObject);
    procedure btPostgresInsertAnalogicClick(Sender: TObject);
    procedure btPostgresInsertAnalogic2Click(Sender: TObject);
    procedure btXmlSaveClick(Sender: TObject);
    procedure btXmlLoadClick(Sender: TObject);
  private
    function GetConfig(const pName: string): string;
    procedure SetConfig(const pName, pValue: string);
  public
    property Config[const Name: string]: string read GetConfig write SetConfig;
    function Version: string;
  end;

var
  MenuMain: TMenuMain;

implementation

uses
  IniFiles,
  uDataMain;

const
  C_CONFIG = 'config.ini';
  C_XML = 'DataSetData.xml';

resourcestring
  C_ERROR_NAME = 'Erro';
  C_STRING_EXCEPTION = '[ %s ] : %s';

{$R *.dfm}

procedure TMenuMain.FormShow(Sender: TObject);
var
  I: Integer;
begin
  //Self.pcFundo.TabIndex := StrToIntDef(Self.Config['pcFundo'],0);
  Self.Height := StrToIntDef(Self.Config['Height'], Self.Height);
  Self.Width := StrToIntDef(Self.Config['Width'], Self.Width);
  for I := 0 to ComponentCount - 1 do
    if Components[I] is TEdit then
      if not(Self.Config[TEdit(Components[I]).Name] = '') then
        TEdit(Components[I]).Text := Self.Config[TEdit(Components[I]).Name];
end;

function TMenuMain.GetConfig(const pName: string): string;
var
  vIniFile: TIniFile;
  sConfigFile: string;
  sRetorno: string;
begin
  sRetorno := '';
  sConfigFile := ExtractFileDir(ParamStr(0)) + '\' + C_CONFIG;
  try
    vIniFile := TIniFile.Create(sConfigFile);
    sRetorno := vIniFile.ReadString('config',pName, '');
    vIniFile.WriteString('config',pName, sRetorno);
    vIniFile.Free;
    vIniFile := Nil;
  except
    on e: Exception do
    begin
      {$IFDEF DEBUG}
        Writeln(Format(C_STRING_EXCEPTION, [C_ERROR_NAME,'GetConfig']));
        Writeln('ClassName : ' + e.ClassName);
        Writeln('Message : ' + e.Message);
        Writeln;
      {$ENDIF}
      {$IFDEF RELEASE}
        Application.MessageBox(
          PChar(''
            + 'ClassName : ' + e.ClassName
            + #13
            + 'Message : ' + e.Message
          ),
          PChar(C_ERROR_NAME),
          MB_OK + MB_ICONERROR
        );
      {$ENDIF}
    end;
  end;
  Result := sRetorno;
end;

procedure TMenuMain.SetConfig(const pName, pValue: string);
var
  vIniFile: TIniFile;
  sConfigFile: string;
begin
  sConfigFile := ExtractFileDir(ParamStr(0)) + '\' + C_CONFIG;
  try
    vIniFile := TIniFile.Create(sConfigFile);
    vIniFile.WriteString('config',pName, pValue);
    vIniFile.Free;
    vIniFile := Nil;
  except
    on e: Exception do
    begin
      {$IFDEF DEBUG}
        Writeln(Format(C_STRING_EXCEPTION, [C_ERROR_NAME,'SetConfig']));
        Writeln('ClassName : ' + e.ClassName);
        Writeln('Message : ' + e.Message);
        Writeln;
      {$ENDIF}
      {$IFDEF RELEASE}
        Application.MessageBox(
          PChar(''
            + 'ClassName : ' + e.ClassName
            + #13
            + 'Message : ' + e.Message
          ),
          PChar(C_ERROR_NAME),
          MB_OK + MB_ICONERROR
        );
      {$ENDIF}
    end;
  end;
end;

function TMenuMain.Version: string;
var
  V1, V2, V3, V4: word;
  VerInfoSize, VerValueSize, Dummy: DWORD;
  VerInfo: Pointer;
  VerValue: PVSFixedFileInfo;
begin
  VerInfoSize := GetFileVersionInfoSize(PChar(ParamStr(0)), Dummy);
  if VerInfoSize > 0 then
  begin
      GetMem(VerInfo, VerInfoSize);
      try
        if GetFileVersionInfo(PChar(ParamStr(0)), 0, VerInfoSize, VerInfo) then
        begin
          VerQueryValue(VerInfo, '\', Pointer(VerValue), VerValueSize);
          with VerValue^ do
          begin
            V1 := dwFileVersionMS shr 16;
            V2 := dwFileVersionMS and $FFFF;
            V3 := dwFileVersionLS shr 16;
            V4 := dwFileVersionLS and $FFFF;
          end;
        end;
      finally
        FreeMem(VerInfo, VerInfoSize);
      end;
  end;
  Result := IntToStr(V1)+'.'+IntToStr(V2)+'.'+IntToStr(V3)+'.'+IntToStr(V4);
end;

procedure TMenuMain.btMssqlApplyAfterPostClick(Sender: TObject);
var
  I: Integer;
  vDateInicio: TDateTime;
  vDateFim: TDateTime;
begin
  // Acao do botao "btMssqlPostAndApply"
  vDateInicio := Now;
  try
    // Estabelece conexao com banco selecionado
    {$IFDEF DEBUG}Writeln(TControl(Sender).Name + ' : Estabelece conexao com banco selecionado');{$ENDIF}
     {
    with (DataMain.conMssql) do
    begin
      DataMain.conMssql.Close;
      DataMain.conMssql.LoginPrompt := False;
      DataMain.conMssql.DriverName := 'DevartSQLServer';
      DataMain.conMssql.ConnectionName := 'Devart SQLServer';
      DataMain.conMssql.GetDriverFunc := 'getSQLDriverSQLServer';
      DataMain.conMssql.LibraryName := 'dbexpsda40.dll';
      DataMain.conMssql.VendorLib := 'sqloledb.dll';
      DataMain.conMssql.Params.Values['DriverName'] := DataMain.conMssql.DriverName;
      DataMain.conMssql.Params.Values['ConnectionName'] := DataMain.conMssql.ConnectionName;
      DataMain.conMssql.Params.Values['GetDriveFunc'] := DataMain.conMssql.GetDriverFunc;
      DataMain.conMssql.Params.Values['LibraryName'] := DataMain.conMssql.LibraryName;
      DataMain.conMssql.Params.Values['VendorLib'] := DataMain.conMssql.VendorLib;
      DataMain.conMssql.Params.Values['HostName'] := Self.edMssqlServidor.Text;
      DataMain.conMssql.Params.Values['User_Name'] := Self.edMssqlUsuario.Text;
      DataMain.conMssql.Params.Values['Password'] := Self.edMssqlSenha.Text;
      DataMain.conMssql.Params.Values['Database'] := Self.edMssqlBanco.Text;
      Open;
    end;
    // }

    // Apaga tabela temporaria de exemplo
    {$IFDEF DEBUG}Writeln(TControl(Sender).Name + ' : Apaga tabela temporaria de exemplo');{$ENDIF}
    // {
    with (DataMain.qryMssql) do
    begin
      Close;
      SQL.Clear;
      SQL.Add('IF EXISTS (SELECT TOP 1 NULL FROM [INFORMATION_SCHEMA].[TABLES] WHERE [TABLE_NAME] = ''TB_TESTE'')');
      SQL.Add('DROP TABLE [TB_TESTE];');
      ExecSQL;
    end;
    // }

    // Cria tabela temporaria de exemplo
    {$IFDEF DEBUG}Writeln(TControl(Sender).Name + ' : Cria tabela temporaria de exemplo');{$ENDIF}
    // {
    with (DataMain.qryMssql) do
    begin
      Close;
      SQL.Clear;
      SQL.Add('IF NOT EXISTS (SELECT TOP 1 NULL FROM [INFORMATION_SCHEMA].[TABLES] WHERE [TABLE_NAME] = ''TB_TESTE'')');
      SQL.Add('CREATE TABLE TB_TESTE (ID INT);');
      ExecSQL;
    end;
    // }

    // Edicao de tabela com DataSet
    {$IFDEF DEBUG}Writeln(TControl(Sender).Name + ' : Edicao de tabela com DataSet');{$ENDIF}
    // {
    with (DataMain.sdsMssql) do
    begin
      Close;
      DataSet.CommandText := 'SELECT ID FROM TB_TESTE WHERE ID = ID;';
      Open;
      for I := 1 to StrToIntDef(Self.edMssqlApplyAfterPost.Text,0) do
      begin
        Insert;
        FieldByName('ID').AsInteger := I;
        Post;
      end;
      ApplyUpdates(0);
    end;
    // }

    // Fim
    vDateFim := Now;
    Self.staMssql.Panels[0].Text := FormatDateTime('hh:mm:ss.zzz',vDateInicio-vDateFim);
    {$IFDEF DEBUG}Writeln(TControl(Sender).Name + ' : Fim');{$ENDIF}
    {$IFDEF DEBUG}Writeln('Tempo : ' + FormatDateTime('hh:mm:ss.zzz',vDateInicio-vDateFim));{$ENDIF}
    {$IFDEF DEBUG}Writeln;{$ENDIF}
  except
    on e: Exception do
    begin
      {$IFDEF DEBUG}
        Writeln(Format(C_STRING_EXCEPTION, [C_ERROR_NAME,TControl(Sender).Name]));
        Writeln('ClassName : ' + e.ClassName);
        Writeln('Message : ' + e.Message);
        Writeln;
      {$ENDIF}
      {$IFDEF RELEASE}
        Application.MessageBox(
          PChar(''
            + 'ClassName : ' + e.ClassName
            + #13
            + 'Message : ' + e.Message
          ),
          PChar(C_ERROR_NAME),
          MB_OK + MB_ICONERROR
        );
      {$ENDIF}
    end;
  end;
end;

procedure TMenuMain.btMssqlInsertAnalogic2Click(Sender: TObject);
var
  I: Integer;
  vDateInicio: TDateTime;
  vDateFim: TDateTime;
begin
  // Acao do botao "btMssqlInsertAnalogic"
  vDateInicio := Now;
  try
    // Estabelece conexao com banco selecionado
    {$IFDEF DEBUG}Writeln(TControl(Sender).Name + ' : Estabelece conexao com banco selecionado');{$ENDIF}
    // {
    with (DataMain.conMssql) do
    begin
      DataMain.conMssql.Close;
      DataMain.conMssql.LoginPrompt := False;
      DataMain.conMssql.DriverName := 'DevartSQLServer';
      DataMain.conMssql.ConnectionName := 'Devart SQLServer';
      DataMain.conMssql.GetDriverFunc := 'getSQLDriverSQLServer';
      DataMain.conMssql.LibraryName := 'dbexpsda40.dll';
      DataMain.conMssql.VendorLib := 'sqloledb.dll';
      DataMain.conMssql.Params.Values['DriverName'] := DataMain.conMssql.DriverName;
      DataMain.conMssql.Params.Values['ConnectionName'] := DataMain.conMssql.ConnectionName;
      DataMain.conMssql.Params.Values['GetDriveFunc'] := DataMain.conMssql.GetDriverFunc;
      DataMain.conMssql.Params.Values['LibraryName'] := DataMain.conMssql.LibraryName;
      DataMain.conMssql.Params.Values['VendorLib'] := DataMain.conMssql.VendorLib;
      DataMain.conMssql.Params.Values['HostName'] := Self.edMssqlServidor.Text;
      DataMain.conMssql.Params.Values['User_Name'] := Self.edMssqlUsuario.Text;
      DataMain.conMssql.Params.Values['Password'] := Self.edMssqlSenha.Text;
      DataMain.conMssql.Params.Values['Database'] := Self.edMssqlBanco.Text;
      Open;
    end;
    // }

    // Apaga tabela temporaria de exemplo
    {$IFDEF DEBUG}Writeln(TControl(Sender).Name + ' : Apaga tabela temporaria de exemplo');{$ENDIF}
    // {
    with (DataMain.qryMssql) do
    begin
      Close;
      SQL.Clear;
      SQL.Add('IF EXISTS (SELECT TOP 1 NULL FROM [INFORMATION_SCHEMA].[TABLES] WHERE [TABLE_NAME] = ''TB_TESTE'')');
      SQL.Add('DROP TABLE [TB_TESTE];');
      ExecSQL;
    end;
    // }

    // Cria tabela temporaria de exemplo
    {$IFDEF DEBUG}Writeln(TControl(Sender).Name + ' : Cria tabela temporaria de exemplo');{$ENDIF}
    // {
    with (DataMain.qryMssql) do
    begin
      Close;
      SQL.Clear;
      SQL.Add('IF NOT EXISTS (SELECT TOP 1 NULL FROM [INFORMATION_SCHEMA].[TABLES] WHERE [TABLE_NAME] = ''TB_TESTE'')');
      SQL.Add('CREATE TABLE TB_TESTE (ID INT);');
      ExecSQL;
    end;
    // }

    // Edicao de tabela com DataSet
    {$IFDEF DEBUG}Writeln(TControl(Sender).Name + ' : Edicao de tabela com DataSet');{$ENDIF}
    // {
    with (DataMain.qryMssql) do
    begin
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO TB_TESTE');
      for I := 1 to StrToIntDef(Self.edMssqlInsertAnalogic2.Text,0) do
      begin
        if not (I = 1) then
          SQL.Add('UNION ALL');
        SQL.Add('SELECT');
        SQL.Add(IntToStr(i) +' AS A');
      end;
      ExecSQL;
    end;
    with (DataMain.sdsMssql) do
    begin
      Close;
      DataSet.CommandText := 'SELECT ID FROM TB_TESTE WHERE ID = ID;';
      Open;
    end;
    // }

    // Fim
    vDateFim := Now;
    Self.staMssql.Panels[0].Text := FormatDateTime('hh:mm:ss.zzz',vDateInicio-vDateFim);
    {$IFDEF DEBUG}Writeln(TControl(Sender).Name + ' : Fim');{$ENDIF}
    {$IFDEF DEBUG}Writeln('Tempo : ' + FormatDateTime('hh:mm:ss.zzz',vDateInicio-vDateFim));{$ENDIF}
    {$IFDEF DEBUG}Writeln;{$ENDIF}
  except
    on e: Exception do
    begin
      {$IFDEF DEBUG}
        Writeln(Format(C_STRING_EXCEPTION, [C_ERROR_NAME,TControl(Sender).Name]));
        Writeln('ClassName : ' + e.ClassName);
        Writeln('Message : ' + e.Message);
        Writeln;
      {$ENDIF}
      {$IFDEF RELEASE}
        Application.MessageBox(
          PChar(''
            + 'ClassName : ' + e.ClassName
            + #13
            + 'Message : ' + e.Message
          ),
          PChar(C_ERROR_NAME),
          MB_OK + MB_ICONERROR
        );
      {$ENDIF}
    end;
  end;
end;

procedure TMenuMain.btMssqlInsertAnalogicClick(Sender: TObject);
var
  I: Integer;
  vDateInicio: TDateTime;
  vDateFim: TDateTime;
begin
  // Acao do botao "btMssqlInsertAnalogic"
  vDateInicio := Now;
  try
    // Estabelece conexao com banco selecionado
    {$IFDEF DEBUG}Writeln(TControl(Sender).Name + ' : Estabelece conexao com banco selecionado');{$ENDIF}
    // {
    with (DataMain.conMssql) do
    begin
      DataMain.conMssql.Close;
      DataMain.conMssql.LoginPrompt := False;
      DataMain.conMssql.DriverName := 'DevartSQLServer';
      DataMain.conMssql.ConnectionName := 'Devart SQLServer';
      DataMain.conMssql.GetDriverFunc := 'getSQLDriverSQLServer';
      DataMain.conMssql.LibraryName := 'dbexpsda40.dll';
      DataMain.conMssql.VendorLib := 'sqloledb.dll';
      DataMain.conMssql.Params.Values['DriverName'] := DataMain.conMssql.DriverName;
      DataMain.conMssql.Params.Values['ConnectionName'] := DataMain.conMssql.ConnectionName;
      DataMain.conMssql.Params.Values['GetDriveFunc'] := DataMain.conMssql.GetDriverFunc;
      DataMain.conMssql.Params.Values['LibraryName'] := DataMain.conMssql.LibraryName;
      DataMain.conMssql.Params.Values['VendorLib'] := DataMain.conMssql.VendorLib;
      DataMain.conMssql.Params.Values['HostName'] := Self.edMssqlServidor.Text;
      DataMain.conMssql.Params.Values['User_Name'] := Self.edMssqlUsuario.Text;
      DataMain.conMssql.Params.Values['Password'] := Self.edMssqlSenha.Text;
      DataMain.conMssql.Params.Values['Database'] := Self.edMssqlBanco.Text;
      Open;
    end;
    // }

    // Apaga tabela temporaria de exemplo
    {$IFDEF DEBUG}Writeln(TControl(Sender).Name + ' : Apaga tabela temporaria de exemplo');{$ENDIF}
    // {
    with (DataMain.qryMssql) do
    begin
      Close;
      SQL.Clear;
      SQL.Add('IF EXISTS (SELECT TOP 1 NULL FROM [INFORMATION_SCHEMA].[TABLES] WHERE [TABLE_NAME] = ''TB_TESTE'')');
      SQL.Add('DROP TABLE [TB_TESTE];');
      ExecSQL;
    end;
    // }

    // Cria tabela temporaria de exemplo
    {$IFDEF DEBUG}Writeln(TControl(Sender).Name + ' : Cria tabela temporaria de exemplo');{$ENDIF}
    // {
    with (DataMain.qryMssql) do
    begin
      Close;
      SQL.Clear;
      SQL.Add('IF NOT EXISTS (SELECT TOP 1 NULL FROM [INFORMATION_SCHEMA].[TABLES] WHERE [TABLE_NAME] = ''TB_TESTE'')');
      SQL.Add('CREATE TABLE TB_TESTE (ID INT);');
      ExecSQL;
    end;
    // }

    // Edicao de tabela com DataSet
    {$IFDEF DEBUG}Writeln(TControl(Sender).Name + ' : Edicao de tabela com DataSet');{$ENDIF}
    // {
    with (DataMain.qryMssql) do
    begin
      for I := 1 to StrToIntDef(Self.edMssqlInsertAnalogic.Text,0) do
      begin
        Close;
        SQL.Clear;
        SQL.Add('INSERT INTO TB_TESTE VALUES('''+ IntToStr(i) + ''')');
        ExecSQL;
      end;
    end;
    with (DataMain.sdsMssql) do
    begin
      Close;
      DataSet.CommandText := 'SELECT ID FROM TB_TESTE WHERE ID = ID;';
      Open;
    end;
    // }

    // Fim
    vDateFim := Now;
    Self.staMssql.Panels[0].Text := FormatDateTime('hh:mm:ss.zzz',vDateInicio-vDateFim);
    {$IFDEF DEBUG}Writeln(TControl(Sender).Name + ' : Fim');{$ENDIF}
    {$IFDEF DEBUG}Writeln('Tempo : ' + FormatDateTime('hh:mm:ss.zzz',vDateInicio-vDateFim));{$ENDIF}
    {$IFDEF DEBUG}Writeln;{$ENDIF}
  except
    on e: Exception do
    begin
      {$IFDEF DEBUG}
        Writeln(Format(C_STRING_EXCEPTION, [C_ERROR_NAME,TControl(Sender).Name]));
        Writeln('ClassName : ' + e.ClassName);
        Writeln('Message : ' + e.Message);
        Writeln;
      {$ENDIF}
      {$IFDEF RELEASE}
        Application.MessageBox(
          PChar(''
            + 'ClassName : ' + e.ClassName
            + #13
            + 'Message : ' + e.Message
          ),
          PChar(C_ERROR_NAME),
          MB_OK + MB_ICONERROR
        );
      {$ENDIF}
    end;
  end;
end;

procedure TMenuMain.btMssqlPostAndApplyClick(Sender: TObject);
var
  I: Integer;
  vDateInicio: TDateTime;
  vDateFim: TDateTime;
begin
  // Acao do botao "btMssqlPostAndApply"
  vDateInicio := Now;
  try
    // Estabelece conexao com banco selecionado
    {$IFDEF DEBUG}Writeln(TControl(Sender).Name + ' : Estabelece conexao com banco selecionado');{$ENDIF}
    // {
    with (DataMain.conMssql) do
    begin
      DataMain.conMssql.Close;
      DataMain.conMssql.LoginPrompt := False;
      DataMain.conMssql.DriverName := 'DevartSQLServer';
      DataMain.conMssql.ConnectionName := 'Devart SQLServer';
      DataMain.conMssql.GetDriverFunc := 'getSQLDriverSQLServer';
      DataMain.conMssql.LibraryName := 'dbexpsda40.dll';
      DataMain.conMssql.VendorLib := 'sqloledb.dll';
      DataMain.conMssql.Params.Values['DriverName'] := DataMain.conMssql.DriverName;
      DataMain.conMssql.Params.Values['ConnectionName'] := DataMain.conMssql.ConnectionName;
      DataMain.conMssql.Params.Values['GetDriveFunc'] := DataMain.conMssql.GetDriverFunc;
      DataMain.conMssql.Params.Values['LibraryName'] := DataMain.conMssql.LibraryName;
      DataMain.conMssql.Params.Values['VendorLib'] := DataMain.conMssql.VendorLib;
      DataMain.conMssql.Params.Values['HostName'] := Self.edMssqlServidor.Text;
      DataMain.conMssql.Params.Values['User_Name'] := Self.edMssqlUsuario.Text;
      DataMain.conMssql.Params.Values['Password'] := Self.edMssqlSenha.Text;
      DataMain.conMssql.Params.Values['Database'] := Self.edMssqlBanco.Text;
      Open;
    end;
    // }

    // Apaga tabela temporaria de exemplo
    {$IFDEF DEBUG}Writeln(TControl(Sender).Name + ' : Apaga tabela temporaria de exemplo');{$ENDIF}
    // {
    with (DataMain.qryMssql) do
    begin
      Close;
      SQL.Clear;
      SQL.Add('IF EXISTS (SELECT TOP 1 NULL FROM [INFORMATION_SCHEMA].[TABLES] WHERE [TABLE_NAME] = ''TB_TESTE'')');
      SQL.Add('DROP TABLE [TB_TESTE];');
      ExecSQL;
    end;
    // }

    // Cria tabela temporaria de exemplo
    {$IFDEF DEBUG}Writeln(TControl(Sender).Name + ' : Cria tabela temporaria de exemplo');{$ENDIF}
    // {
    with (DataMain.qryMssql) do
    begin
      Close;
      SQL.Clear;
      SQL.Add('IF NOT EXISTS (SELECT TOP 1 NULL FROM [INFORMATION_SCHEMA].[TABLES] WHERE [TABLE_NAME] = ''TB_TESTE'')');
      SQL.Add('CREATE TABLE TB_TESTE (ID INT);');
      ExecSQL;
    end;
    // }

    // Edicao de tabela com DataSet
    {$IFDEF DEBUG}Writeln(TControl(Sender).Name + ' : Edicao de tabela com DataSet');{$ENDIF}
    // {
    with (DataMain.sdsMssql) do
    begin
      Close;
      DataSet.CommandText := 'SELECT ID FROM TB_TESTE WHERE ID = ID;';
      Open;
      for I := 1 to StrToIntDef(Self.edMssqlPostAndApply.Text,0) do
      begin
        Insert;
        FieldByName('ID').AsInteger := I;
        Post;
        ApplyUpdates(0);
      end;
    end;
    // }

    // Fim
    vDateFim := Now;
    Self.staMssql.Panels[0].Text := FormatDateTime('hh:mm:ss.zzz',vDateInicio-vDateFim);
    {$IFDEF DEBUG}Writeln(TControl(Sender).Name + ' : Fim');{$ENDIF}
    {$IFDEF DEBUG}Writeln('Tempo : ' + FormatDateTime('hh:mm:ss.zzz',vDateInicio-vDateFim));{$ENDIF}
    {$IFDEF DEBUG}Writeln;{$ENDIF}
  except
    on e: Exception do
    begin
      {$IFDEF DEBUG}
        Writeln(Format(C_STRING_EXCEPTION, [C_ERROR_NAME,TControl(Sender).Name]));
        Writeln('ClassName : ' + e.ClassName);
        Writeln('Message : ' + e.Message);
        Writeln;
      {$ENDIF}
      {$IFDEF RELEASE}
        Application.MessageBox(
          PChar(''
            + 'ClassName : ' + e.ClassName
            + #13
            + 'Message : ' + e.Message
          ),
          PChar(C_ERROR_NAME),
          MB_OK + MB_ICONERROR
        );
      {$ENDIF}
    end;
  end;
end;

procedure TMenuMain.btPostgresPostAndApplyClick(Sender: TObject);
var
  I: Integer;
  vDateInicio: TDateTime;
  vDateFim: TDateTime;
begin
  // Acao do botao "btPostgresPostAndApply"
  vDateInicio := Now;
  try
    // Estabelece conexao com banco selecionado
    {$IFDEF DEBUG}Writeln(TControl(Sender).Name + ' : Estabelece conexao com banco selecionado');{$ENDIF}
    // {
    with (DataMain.conPostgres) do
    begin
      Close;
      LoginPrompt := False;
      DriverName := 'DevartPostgreSQL';
      ConnectionName := 'Devart PostgreSQL';
      GetDriverFunc := 'getSQLDriverPostgreSQL';
      LibraryName := 'dbexppgsql40.dll';
      VendorLib := 'dbexppgsql40.dll';
      Params.Values['DriverName'] := DriverName;
      Params.Values['ConnectionName'] := ConnectionName;
      Params.Values['GetDriveFunc'] := GetDriverFunc;
      Params.Values['LibraryName'] := LibraryName;
      Params.Values['VendorLib'] := VendorLib;
      Params.Values['HostName'] := Self.edPostgresServidor.Text;
      Params.Values['User_Name'] := Self.edPostgresUsuario.Text;
      Params.Values['Password'] := Self.edPostgresSenha.Text;
      Params.Values['Database'] := Self.edPostgresBanco.Text;
      Open;
    end;
    // }

    // Apaga tabela temporaria de exemplo
    {$IFDEF DEBUG}Writeln(TControl(Sender).Name + ' : Apaga tabela temporaria de exemplo');{$ENDIF}
    // {
    with (DataMain.qryPostgres) do
    begin
      Close;
      SQL.Clear;
      SQL.Add('DROP TABLE IF EXISTS TB_TESTE;');
      ExecSQL;
    end;
    // }

    // Cria tabela temporaria de exemplo
    {$IFDEF DEBUG}Writeln(TControl(Sender).Name + ' : Cria tabela temporaria de exemplo');{$ENDIF}
    // {
    with (DataMain.qryPostgres) do
    begin
      Close;
      SQL.Clear;
      SQL.Add('CREATE TABLE IF NOT EXISTS TB_TESTE (ID INT);');
      ExecSQL;
    end;
    // }

    // Edicao de tabela com DataSet
    {$IFDEF DEBUG}Writeln(TControl(Sender).Name + ' : Edicao de tabela com DataSet');{$ENDIF}
    // {
    with (DataMain.sdsPostgres) do
    begin
      Close;
      DataSet.CommandText := 'SELECT ID FROM TB_TESTE WHERE ID = ID;';
      Open;
      for I := 1 to StrToIntDef(Self.edPostgresPostAndApply.Text,0) do
      begin
        Insert;
        FieldByName('ID').AsInteger := I;
        Post;
        ApplyUpdates(0);
      end;
    end;
    // }

    // Fim
    vDateFim := Now;
    Self.staPostgres.Panels[0].Text := FormatDateTime('hh:mm:ss.zzz',vDateInicio-vDateFim);
    {$IFDEF DEBUG}Writeln(TControl(Sender).Name + ' : Fim');{$ENDIF}
    {$IFDEF DEBUG}Writeln('Tempo : ' + FormatDateTime('hh:mm:ss.zzz',vDateInicio-vDateFim));{$ENDIF}
    {$IFDEF DEBUG}Writeln;{$ENDIF}
  except
    on e: Exception do
    begin
      {$IFDEF DEBUG}
        Writeln(Format(C_STRING_EXCEPTION, [C_ERROR_NAME,TControl(Sender).Name]));
        Writeln('ClassName : ' + e.ClassName);
        Writeln('Message : ' + e.Message);
        Writeln;
      {$ENDIF}
      {$IFDEF RELEASE}
        Application.MessageBox(
          PChar(''
            + 'ClassName : ' + e.ClassName
            + #13
            + 'Message : ' + e.Message
          ),
          PChar(C_ERROR_NAME),
          MB_OK + MB_ICONERROR
        );
      {$ENDIF}
    end;
  end;
end;

procedure TMenuMain.btXmlLoadClick(Sender: TObject);
begin
  if (FileExists(C_XML)) then
  begin
    // Load XML
    {$IFDEF DEBUG}Writeln(TControl(Sender).Name + ' : Load XML');{$ENDIF}
    // {
    with (DataMain) do
    begin
      cdsData.Close;
      dsMssql.DataSet := cdsData;
      cdsData.LoadFromFile(C_XML);
      cdsData.Open;
    end;
    // }
  end;
end;

procedure TMenuMain.btXmlSaveClick(Sender: TObject);
var
  I: Integer;
  vDateInicio: TDateTime;
  vDateFim: TDateTime;
begin
  // Acao do botao "btMssqlPostAndApply"
  vDateInicio := Now;
  try
    // Estabelece conexao com banco selecionado
    {$IFDEF DEBUG}Writeln(TControl(Sender).Name + ' : Estabelece conexao com banco selecionado');{$ENDIF}
    // {
    with (DataMain.conMssql) do
    begin
      DataMain.conMssql.Close;
      DataMain.conMssql.LoginPrompt := False;
      DataMain.conMssql.DriverName := 'MSSQL';
      DataMain.conMssql.ConnectionName := 'SQLServer';
      DataMain.conMssql.GetDriverFunc := 'getSQLDriverMSSQL';
      DataMain.conMssql.LibraryName := 'dbxmss.dll';
      DataMain.conMssql.VendorLib := 'sqlncli11.dll';
      DataMain.conMssql.Params.Values['DriverName'] := DataMain.conMssql.DriverName;
      DataMain.conMssql.Params.Values['ConnectionName'] := DataMain.conMssql.ConnectionName;
      DataMain.conMssql.Params.Values['GetDriveFunc'] := DataMain.conMssql.GetDriverFunc;
      DataMain.conMssql.Params.Values['LibraryName'] := DataMain.conMssql.LibraryName;
      DataMain.conMssql.Params.Values['VendorLib'] := DataMain.conMssql.VendorLib;
      DataMain.conMssql.Params.Values['HostName'] := Self.edMssqlServidor.Text;
      DataMain.conMssql.Params.Values['User_Name'] := Self.edMssqlUsuario.Text;
      DataMain.conMssql.Params.Values['Password'] := Self.edMssqlSenha.Text;
      DataMain.conMssql.Params.Values['Database'] := Self.edMssqlBanco.Text;
      Open;
    end;
    // }

    // Apaga tabela temporaria de exemplo
    {$IFDEF DEBUG}Writeln(TControl(Sender).Name + ' : Apaga tabela temporaria de exemplo');{$ENDIF}
    // {
    with (DataMain.qryMssql) do
    begin
      Close;
      SQL.Clear;
      SQL.Add('IF EXISTS (SELECT TOP 1 NULL FROM [INFORMATION_SCHEMA].[TABLES] WHERE [TABLE_NAME] = ''TB_TESTE'')');
      SQL.Add('DROP TABLE [TB_TESTE];');
      ExecSQL;
    end;
    // }

    // Cria tabela temporaria de exemplo
    {$IFDEF DEBUG}Writeln(TControl(Sender).Name + ' : Cria tabela temporaria de exemplo');{$ENDIF}
    // {
    with (DataMain.qryMssql) do
    begin
      Close;
      SQL.Clear;
      SQL.Add('IF NOT EXISTS (SELECT TOP 1 NULL FROM [INFORMATION_SCHEMA].[TABLES] WHERE [TABLE_NAME] = ''TB_TESTE'')');
      SQL.Add('CREATE TABLE TB_TESTE (ID INT);');
      ExecSQL;
    end;
    // }

    // Edicao de tabela com DataSet
    {$IFDEF DEBUG}Writeln(TControl(Sender).Name + ' : Edicao de tabela com DataSet');{$ENDIF}
    // {
    with (DataMain.sdsMssql) do
    begin
      Close;
      DataSet.CommandText := 'SELECT ID FROM TB_TESTE WHERE ID = ID;';
      Open;
      for I := 1 to StrToIntDef(Self.edMssqlPostAndApply.Text,0) do
      begin
        Insert;
        FieldByName('ID').AsInteger := I;
        Post;
        ApplyUpdates(0);
      end;
    end;
    // }

    // Salva XML
    {$IFDEF DEBUG}Writeln(TControl(Sender).Name + ' : Salva XML');{$ENDIF}
    // {
    with (DataMain.sdsMssql) do
    begin
      SaveToFile(C_XML, dfXML);
    end;
    // }

    // Fim
    vDateFim := Now;
    Self.staMssql.Panels[0].Text := FormatDateTime('hh:mm:ss.zzz',vDateInicio-vDateFim);
    {$IFDEF DEBUG}Writeln(TControl(Sender).Name + ' : Fim');{$ENDIF}
    {$IFDEF DEBUG}Writeln('Tempo : ' + FormatDateTime('hh:mm:ss.zzz',vDateInicio-vDateFim));{$ENDIF}
    {$IFDEF DEBUG}Writeln;{$ENDIF}
  except
    on e: Exception do
    begin
      {$IFDEF DEBUG}
        Writeln(Format(C_STRING_EXCEPTION, [C_ERROR_NAME,TControl(Sender).Name]));
        Writeln('ClassName : ' + e.ClassName);
        Writeln('Message : ' + e.Message);
        Writeln;
      {$ENDIF}
      {$IFDEF RELEASE}
        Application.MessageBox(
          PChar(''
            + 'ClassName : ' + e.ClassName
            + #13
            + 'Message : ' + e.Message
          ),
          PChar(C_ERROR_NAME),
          MB_OK + MB_ICONERROR
        );
      {$ENDIF}
    end;
  end;
end;

procedure TMenuMain._edChange(Sender: TObject);
begin
  if (Self.Active) then
    Self.Config[TControl(Sender).Name] := TEdit(Sender).Text;
end;

procedure TMenuMain.btPostgresApplyAfterPostClick(Sender: TObject);
var
  I: Integer;
  vDateInicio: TDateTime;
  vDateFim: TDateTime;
begin
  // Acao do botao "btPostgresPostAndApply"
  vDateInicio := Now;
  try
    // Estabelece conexao com banco selecionado
    {$IFDEF DEBUG}Writeln(TControl(Sender).Name + ' : Estabelece conexao com banco selecionado');{$ENDIF}
    // {
    with (DataMain.conPostgres) do
    begin
      Close;
      LoginPrompt := False;
      DriverName := 'DevartPostgreSQL';
      ConnectionName := 'Devart PostgreSQL';
      GetDriverFunc := 'getSQLDriverPostgreSQL';
      LibraryName := 'dbexppgsql40.dll';
      VendorLib := 'dbexppgsql40.dll';
      Params.Values['DriverName'] := DriverName;
      Params.Values['ConnectionName'] := ConnectionName;
      Params.Values['GetDriveFunc'] := GetDriverFunc;
      Params.Values['LibraryName'] := LibraryName;
      Params.Values['VendorLib'] := VendorLib;
      Params.Values['HostName'] := Self.edPostgresServidor.Text;
      Params.Values['User_Name'] := Self.edPostgresUsuario.Text;
      Params.Values['Password'] := Self.edPostgresSenha.Text;
      Params.Values['Database'] := Self.edPostgresBanco.Text;
      Open;
    end;
    // }

    // Apaga tabela temporaria de exemplo
    {$IFDEF DEBUG}Writeln(TControl(Sender).Name + ' : Apaga tabela temporaria de exemplo');{$ENDIF}
    // {
    with (DataMain.qryPostgres) do
    begin
      Close;
      SQL.Clear;
      SQL.Add('DROP TABLE IF EXISTS TB_TESTE;');
      ExecSQL;
    end;
    // }

    // Cria tabela temporaria de exemplo
    {$IFDEF DEBUG}Writeln(TControl(Sender).Name + ' : Cria tabela temporaria de exemplo');{$ENDIF}
    // {
    with (DataMain.qryPostgres) do
    begin
      Close;
      SQL.Clear;
      SQL.Add('CREATE TABLE IF NOT EXISTS TB_TESTE (ID INT);');
      ExecSQL;
    end;
    // }

    // Edicao de tabela com DataSet
    {$IFDEF DEBUG}Writeln(TControl(Sender).Name + ' : Edicao de tabela com DataSet');{$ENDIF}
    // {
    vDateFim := Now;
    with (DataMain.sdsPostgres) do
    begin
      Close;
      DataSet.CommandText := 'SELECT ID FROM TB_TESTE WHERE ID = ID;';
      Open;
      for I := 1 to StrToIntDef(Self.edPostgresPostAndApply.Text,0) do
      begin
        Insert;
        FieldByName('ID').AsInteger := I;
        Post;
      end;
      ApplyUpdates(0);
    end;
    // }

    // Fim
    vDateFim := Now;
    Self.staPostgres.Panels[0].Text := FormatDateTime('hh:mm:ss.zzz',vDateInicio-vDateFim);
    {$IFDEF DEBUG}Writeln(TControl(Sender).Name + ' : Fim');{$ENDIF}
    {$IFDEF DEBUG}Writeln('Tempo : ' + FormatDateTime('hh:mm:ss.zzz',vDateInicio-vDateFim));{$ENDIF}
    {$IFDEF DEBUG}Writeln;{$ENDIF}
  except
    on e: Exception do
    begin
      {$IFDEF DEBUG}
        Writeln(Format(C_STRING_EXCEPTION, [C_ERROR_NAME,TControl(Sender).Name]));
        Writeln('ClassName : ' + e.ClassName);
        Writeln('Message : ' + e.Message);
        Writeln;
      {$ENDIF}
      {$IFDEF RELEASE}
        Application.MessageBox(
          PChar(''
            + 'ClassName : ' + e.ClassName
            + #13
            + 'Message : ' + e.Message
          ),
          PChar(C_ERROR_NAME),
          MB_OK + MB_ICONERROR
        );
      {$ENDIF}
    end;
  end;
end;

procedure TMenuMain.btPostgresInsertAnalogic2Click(Sender: TObject);
var
  I: Integer;
  vDateInicio: TDateTime;
  vDateFim: TDateTime;
begin
  // Acao do botao "btPostgresInsertAnalogic"
  vDateInicio := Now;
  try
    // Estabelece conexao com banco selecionado
    {$IFDEF DEBUG}Writeln(TControl(Sender).Name + ' : Estabelece conexao com banco selecionado');{$ENDIF}
    // {
    with (DataMain.conPostgres) do
    begin
      Close;
      LoginPrompt := False;
      DriverName := 'DevartPostgreSQL';
      ConnectionName := 'Devart PostgreSQL';
      GetDriverFunc := 'getSQLDriverPostgreSQL';
      LibraryName := 'dbexppgsql40.dll';
      VendorLib := 'dbexppgsql40.dll';
      Params.Values['DriverName'] := DriverName;
      Params.Values['ConnectionName'] := ConnectionName;
      Params.Values['GetDriveFunc'] := GetDriverFunc;
      Params.Values['LibraryName'] := LibraryName;
      Params.Values['VendorLib'] := VendorLib;
      Params.Values['HostName'] := Self.edPostgresServidor.Text;
      Params.Values['User_Name'] := Self.edPostgresUsuario.Text;
      Params.Values['Password'] := Self.edPostgresSenha.Text;
      Params.Values['Database'] := Self.edPostgresBanco.Text;
      Open;
    end;
    // }

    // Apaga tabela temporaria de exemplo
    {$IFDEF DEBUG}Writeln(TControl(Sender).Name + ' : Apaga tabela temporaria de exemplo');{$ENDIF}
    // {
    with (DataMain.qryPostgres) do
    begin
      Close;
      SQL.Clear;
      SQL.Add('DROP TABLE IF EXISTS TB_TESTE;');
      ExecSQL;
    end;
    // }

    // Cria tabela temporaria de exemplo
    {$IFDEF DEBUG}Writeln(TControl(Sender).Name + ' : Cria tabela temporaria de exemplo');{$ENDIF}
    // {
    with (DataMain.qryPostgres) do
    begin
      Close;
      SQL.Clear;
      SQL.Add('CREATE TABLE IF NOT EXISTS TB_TESTE (ID INT);');
      ExecSQL;
    end;
    // }

    // Edicao de tabela com DataSet
    {$IFDEF DEBUG}Writeln(TControl(Sender).Name + ' : Edicao de tabela com DataSet');{$ENDIF}
    // {
    with (DataMain.qryPostgres) do
    begin
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO TB_TESTE');
      for I := 1 to StrToIntDef(Self.edPostgresInsertAnalogic2.Text,0) do
      begin
        if not (I = 1) then
          SQL.Add('UNION ALL');
        SQL.Add('SELECT');
        SQL.Add(IntToStr(i) +' AS A');
      end;
      ExecSQL;
    end;
    with (DataMain.sdsPostgres) do
    begin
      Close;
      DataSet.CommandText := 'SELECT ID FROM TB_TESTE WHERE ID = ID;';
      Open;
    end;
    // }

    // Fim
    vDateFim := Now;
    Self.staPostgres.Panels[0].Text := FormatDateTime('hh:mm:ss.zzz',vDateInicio-vDateFim);
    {$IFDEF DEBUG}Writeln(TControl(Sender).Name + ' : Fim');{$ENDIF}
    {$IFDEF DEBUG}Writeln('Tempo : ' + FormatDateTime('hh:mm:ss.zzz',vDateInicio-vDateFim));{$ENDIF}
    {$IFDEF DEBUG}Writeln;{$ENDIF}
  except
    on e: Exception do
    begin
      {$IFDEF DEBUG}
        Writeln(Format(C_STRING_EXCEPTION, [C_ERROR_NAME,TControl(Sender).Name]));
        Writeln('ClassName : ' + e.ClassName);
        Writeln('Message : ' + e.Message);
        Writeln;
      {$ENDIF}
      {$IFDEF RELEASE}
        Application.MessageBox(
          PChar(''
            + 'ClassName : ' + e.ClassName
            + #13
            + 'Message : ' + e.Message
          ),
          PChar(C_ERROR_NAME),
          MB_OK + MB_ICONERROR
        );
      {$ENDIF}
    end;
  end;
end;

procedure TMenuMain.btPostgresInsertAnalogicClick(Sender: TObject);
var
  I: Integer;
  vDateInicio: TDateTime;
  vDateFim: TDateTime;
begin
  // Acao do botao "btPostgresInsertAnalogic"
  vDateInicio := Now;
  try
    // Estabelece conexao com banco selecionado
    {$IFDEF DEBUG}Writeln(TControl(Sender).Name + ' : Estabelece conexao com banco selecionado');{$ENDIF}
    // {
    with (DataMain.conPostgres) do
    begin
      Close;
      LoginPrompt := False;
      DriverName := 'DevartPostgreSQL';
      ConnectionName := 'Devart PostgreSQL';
      GetDriverFunc := 'getSQLDriverPostgreSQL';
      LibraryName := 'dbexppgsql40.dll';
      VendorLib := 'dbexppgsql40.dll';
      Params.Values['DriverName'] := DriverName;
      Params.Values['ConnectionName'] := ConnectionName;
      Params.Values['GetDriveFunc'] := GetDriverFunc;
      Params.Values['LibraryName'] := LibraryName;
      Params.Values['VendorLib'] := VendorLib;
      Params.Values['HostName'] := Self.edPostgresServidor.Text;
      Params.Values['User_Name'] := Self.edPostgresUsuario.Text;
      Params.Values['Password'] := Self.edPostgresSenha.Text;
      Params.Values['Database'] := Self.edPostgresBanco.Text;
      Open;
    end;
    // }

    // Apaga tabela temporaria de exemplo
    {$IFDEF DEBUG}Writeln(TControl(Sender).Name + ' : Apaga tabela temporaria de exemplo');{$ENDIF}
    // {
    with (DataMain.qryPostgres) do
    begin
      Close;
      SQL.Clear;
      SQL.Add('DROP TABLE IF EXISTS TB_TESTE;');
      ExecSQL;
    end;
    // }

    // Cria tabela temporaria de exemplo
    {$IFDEF DEBUG}Writeln(TControl(Sender).Name + ' : Cria tabela temporaria de exemplo');{$ENDIF}
    // {
    with (DataMain.qryPostgres) do
    begin
      Close;
      SQL.Clear;
      SQL.Add('CREATE TABLE IF NOT EXISTS TB_TESTE (ID INT);');
      ExecSQL;
    end;
    // }

    // Edicao de tabela com DataSet
    {$IFDEF DEBUG}Writeln(TControl(Sender).Name + ' : Edicao de tabela com DataSet');{$ENDIF}
    // {
    with (DataMain.qryPostgres) do
    begin
      for I := 1 to StrToIntDef(Self.edMssqlInsertAnalogic.Text,0) do
      begin
        Close;
        SQL.Clear;
        SQL.Add('INSERT INTO TB_TESTE VALUES('''+ IntToStr(i) + ''')');
        ExecSQL;
      end;
    end;
    with (DataMain.sdsPostgres) do
    begin
      Close;
      DataSet.CommandText := 'SELECT ID FROM TB_TESTE WHERE ID = ID;';
      Open;
    end;
    // }

    // Fim
    vDateFim := Now;
    Self.staPostgres.Panels[0].Text := FormatDateTime('hh:mm:ss.zzz',vDateInicio-vDateFim);
    {$IFDEF DEBUG}Writeln(TControl(Sender).Name + ' : Fim');{$ENDIF}
    {$IFDEF DEBUG}Writeln('Tempo : ' + FormatDateTime('hh:mm:ss.zzz',vDateInicio-vDateFim));{$ENDIF}
    {$IFDEF DEBUG}Writeln;{$ENDIF}
  except
    on e: Exception do
    begin
      {$IFDEF DEBUG}
        Writeln(Format(C_STRING_EXCEPTION, [C_ERROR_NAME,TControl(Sender).Name]));
        Writeln('ClassName : ' + e.ClassName);
        Writeln('Message : ' + e.Message);
        Writeln;
      {$ENDIF}
      {$IFDEF RELEASE}
        Application.MessageBox(
          PChar(''
            + 'ClassName : ' + e.ClassName
            + #13
            + 'Message : ' + e.Message
          ),
          PChar(C_ERROR_NAME),
          MB_OK + MB_ICONERROR
        );
      {$ENDIF}
    end;
  end;
end;

procedure TMenuMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // Salva pagina do "pcFundo"
  Self.Config['pcFundo'] := IntToStr(Self.pcFundo.TabIndex);
  Self.Config['Height'] := IntToStr(Self.Height);
  Self.Config['Width'] := IntToStr(Self.Width);
end;

procedure TMenuMain.FormCreate(Sender: TObject);
begin
  // Carrega titulo da aplicacao  
  {$IFDEF RELEASE}Application.Title := Application.Title + ' - ' + Self.Version;{$ENDIF}
  {$IFDEF DEBUG}Application.Title := Application.Title + ' - ' + '[DEBUG]';{$ENDIF}
  Self.Caption := Application.Title;

  // Carrega DataModule "DataMain"
  if (DataMain = Nil) then
    DataMain := TDataMain.Create(Application);
end;

end.
