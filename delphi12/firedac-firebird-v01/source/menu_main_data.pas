// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io

// # [ url ]
// # - : https://docwiki.embarcadero.com/RADStudio/Athens/en/Connect_to_Firebird_(FireDAC)

// # [ delphi12 ]
unit menu_main_data;

interface

uses
  // # : - delphi
  System.SysUtils,
  System.Classes,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.VCLUI.Wait,
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.Stan.Param,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,
  FireDAC.Phys.FB,
  FireDAC.Phys.FBDef;

type
  TMenuMainData = class(TDataModule)
    conMain: TFDConnection;
    traMain: TFDTransaction;
    qryMain: TFDQuery;
    dtsMain: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
  public
    vDatabase: string;
    vNew: Boolean;
    procedure fnConnect;
    procedure fnExecute;
    procedure fnOpen;
  end;

var
  MenuMainData: TMenuMainData;

implementation

{$R *.dfm}

{ TMenuMainData }

procedure TMenuMainData.DataModuleCreate(Sender: TObject);
begin
  Self.vDatabase := GetCurrentDir + '\BANCO.fdb';
  Self.vNew := not(FileExists(Self.vDatabase));
end;

procedure TMenuMainData.fnConnect;
begin
  // {
  with (Self.conMain) do
  begin
    Close;
    Params.Values['DriverID'] := 'FB';
    Params.Values['Server'] := '127.0.0.1';
    Params.Values['Port'] := '3050';
    Params.Values['Database'] := Self.vDatabase;
    Params.Values['OSAuthent'] := 'No';
    Params.Values['User_Name'] := 'SYSDBA';
    Params.Values['Password'] := 'masterkey';
    Params.Values['OpenMode'] := 'OpenOrCreate';
    Open;
  end;
  // }
end;

procedure TMenuMainData.fnExecute;
begin
  // # : Create Table PEOPLE
  // {
  if (Self.vNew) then
  begin
    with (Self.conMain) do
    begin
      ExecSQL((''
        + ''
        + #13#10 + 'CREATE TABLE PEOPLE ('
        + #13#10 + '    ID INT PRIMARY KEY,'
        + #13#10 + '    NAME VARCHAR(50)'
        + #13#10 + ');'
      ));
    end;
  end;
  // }

  // # : Insert Table PEOPLE
  // {
  if (Self.vNew) then
  begin
    with (Self.conMain) do
    begin
      ExecSQL('INSERT INTO PEOPLE (ID, NAME) VALUES (1, ''Alice'');');
      ExecSQL('INSERT INTO PEOPLE (ID, NAME) VALUES (2, ''Bob'');');
      ExecSQL('INSERT INTO PEOPLE (ID, NAME) VALUES (3, ''Charlie'');');
      ExecSQL('INSERT INTO PEOPLE (ID, NAME) VALUES (4, ''Diana'');');
      ExecSQL('INSERT INTO PEOPLE (ID, NAME) VALUES (5, ''Ethan'');');
    end;
  end;
  // }
end;

procedure TMenuMainData.fnOpen;
begin
  with (Self.qryMain) do
  begin
    Close;
    Open;
  end;
end;

end.

