unit uDataMain;

interface

uses
  SysUtils, Classes, WideStrings, DB, SqlExpr, DBClient, SimpleDS, FMTBcd;

type
  TDataMain = class(TDataModule)
    sdsPostgres: TSimpleDataSet;
    conPostgres: TSQLConnection;
    dsPostgres: TDataSource;
    conMssql: TSQLConnection;
    dsMssql: TDataSource;
    sdsMssql: TSimpleDataSet;
    qryPostgres: TSQLQuery;
    qryMssql: TSQLQuery;
    cdsData: TClientDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataMain: TDataMain;

implementation

{$R *.dfm}

end.
