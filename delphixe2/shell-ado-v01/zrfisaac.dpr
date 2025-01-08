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
  Data.DB,
  Data.SqlExpr,
  Data.Win.ADODB,
  Data.DBXOdbc;

{$R *.res}

var
  vADOConnection: TADOConnection;
  vSQLConnection: TSQLConnection;
  vSQLQuery: TSQLQuery;

begin
  Application.Initialize;
  try
    Writeln('# - : 3.0');
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

