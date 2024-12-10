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
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Data.DB,
  Data.SqlExpr,
  Data.Win.ADODB,
  Data.DBXOdbc,
  FireDAC.Phys.MSSQLDef,
  FireDAC.Stan.Intf,
  FireDAC.Phys,
  FireDAC.Phys.ODBCBase,
  FireDAC.Phys.MSSQL,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client,
  FireDAC.Stan.Param,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.DApt,
  FireDAC.Comp.DataSet;

{$R *.res}

var
  vADOConnection: TADOConnection;
  vFDConnection: TFDConnection;
  vSQLConnection: TSQLConnection;
  vSQLQuery: TSQLQuery;

begin
  Application.Initialize;
  try
    Writeln('# - : 1.9');
    // # vSQLConnection
    // (*
    Writeln('# - vSQLConnection');
    vSQLConnection := TSQLConnection.Create(Application);
    vSQLConnection.LoginPrompt := False;
    vSQLConnection.DriverName := 'ODBC';
    vSQLConnection.GetDriverFunc := 'getSQLDriverODBC';
    vSQLConnection.LibraryName := 'dbxoodbc.dll';
    vSQLConnection.VendorLib := '';
    vSQLConnection.Params.Clear;
    vSQLConnection.Params.Values['ConnectionString'] := (''
      + 'Driver={ODBC Driver 18 for SQL Server};'
      + 'Server=192.168.0.208;'
      + 'Database=master;'
      + 'Uid=sa;'
      + 'Pwd=ABcd!@34;'
      + 'TrustServerCertificate=Yes;'
    );
    vSQLConnection.Open;
    vSQLConnection.Close;
    // *)
    // # vADOConnection
     (*
    Writeln('# - vADOConnection');
    vADOConnection := TADOConnection.Create(Application);
    vADOConnection.LoginPrompt := False;
    vADOConnection.ConnectionString := (''
      + 'Provider=SQLOLEDB;'
      + 'Data Source=192.168.0.208;'
      + 'Initial Catalog=master;'
      + 'User ID=sa;'
      + 'Password=ABcd!@34;'
    );
    vADOConnection.Open;
    vADOConnection.Close;
    // *)
    // # vFDConnection
    (*
    Writeln('# - vFDConnection');
    vFDConnection := TFDConnection.Create(Application);
    vFDConnection.LoginPrompt := False;
    vFDConnection.DriverName := 'MSSQL';
    vFDConnection.Params.Clear;
    vFDConnection.Params.Values['DriverID'] := 'MSSQL';
    vFDConnection.Params.Values['Server'] := '192.168.0.208';
    vFDConnection.Params.Values['Database'] := 'master';
    vFDConnection.Params.Values['User_Name'] := 'sa';
    vFDConnection.Params.Values['Password'] := 'ABcd!@34';
    vFDConnection.Params.Values['OSAuthent'] := 'No';
    vFDConnection.Params.Values['Trusted_Connection'] := 'Yes';
    vFDConnection.Params.Values['ODBCAdvanced'] := 'TrustServerCertificate=yes';
    vFDConnection.Open;
    vFDConnection.Close;
    // *)
    // # vSQLQuery
     (*
    Writeln('# - vSQLQuery');
    vSQLQuery := TSQLQuery.Create(Application);
    vSQLQuery.SQLConnection := vFDConnection;
    vSQLQuery.SQL.Text := 'select @@version as [version];';
    vSQLQuery.Open;
    //vSQLQuery.Close;
    // *)
    Writeln('# - success');
  except
    on E:Exception do
    begin
      Writeln('# - error');
      Writeln(E.Message);
      //raise;
    end;
  end;
  Writeln('# - end');
  Readln;
end.

