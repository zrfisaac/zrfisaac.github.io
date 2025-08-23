unit ufRelatorio;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  RLReport,
  RLFilters,
  RLDraftFilter,
  RLXLSFilter,
  RLPDFFilter,
  RLHTMLFilter,
  RLRichFilter,
  DB,
  DBTables;

type
  TFrmRelatorio = class(TForm)
    rlRelatorioBase: TRLReport;
    RLRichFilter: TRLRichFilter;
    RLHTMLFilter: TRLHTMLFilter;
    RLPDFFilter: TRLPDFFilter;
    RLXLSFilter: TRLXLSFilter;
    qryBase: TQuery;
    bdeConexao: TDatabase;
    RLDraftFilter: TRLDraftFilter;
    dtsBase: TDataSource;
    rlRelatorioTotal: TRLReport;
    RLBand1: TRLBand;
    RLDBText1: TRLDBText;
    RLGroup1: TRLGroup;
    rbLinha: TRLBand;
    dbBaseNome: TRLDBText;
    RLDBText2: TRLDBText;
    RLBand2: TRLBand;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLBand4: TRLBand;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLDBText3: TRLDBText;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    qryTotal: TQuery;
    dtsTotal: TDataSource;
    RLSubDetail1: TRLSubDetail;
    RLBand3: TRLBand;
    RLDBText4: TRLDBText;
    procedure FormCreate(Sender: TObject);
    procedure RLGroup1AfterPrint(Sender: TObject);
  public
    Config: TStrings;
    class procedure Visualizar;
  end;

var
  FrmRelatorio: TFrmRelatorio;

implementation

{$R *.dfm}

{ TFrmRelatorio }

class procedure TFrmRelatorio.Visualizar;
var
  _Relatorio: TFrmRelatorio;
begin
  _Relatorio := TFrmRelatorio.Create(Application);
  _Relatorio.rlRelatorioBase.PreviewModal;
  _Relatorio.Free;
end;

procedure TFrmRelatorio.FormCreate(Sender: TObject);
var
  _vCaminho: String;
begin
  Self.Config := TStringList.Create;
  _vCaminho := ExtractFileDir(ParamStr(0)) + '\_.cfg';
  if not FileExists(_vCaminho) then
    _vCaminho := ExtractFileDir(ParamStr(0)) + '\Config.cfg';
  if FileExists(_vCaminho) then
    Self.Config.LoadFromFile(_vCaminho)
  else
  begin
    Self.Config.Values['Alias'] := 'CONEXAO';
    Self.Config.Values['Servidor'] := 'localhost';
    Self.Config.Values['Usuario'] := 'sa';
    Self.Config.Values['Senha'] := '1234';
    Self.Config.Values['Banco'] := 'master';
    Self.Config.SaveToFile(_vCaminho);
    Application.Terminate;
  end;
  Self.bdeConexao.AliasName := Self.Config.Values['Alias'];
  Self.bdeConexao.Params.Values['SERVER NAME'] := Self.Config.Values['Servidor'];
  Self.bdeConexao.Params.Values['USER NAME'] := Self.Config.Values['Usuario'];
  Self.bdeConexao.Params.Values['DATABASE NAME'] := Self.Config.Values['Banco'];
  Self.bdeConexao.Params.Values['PASSWORD'] := Self.Config.Values['Senha'];
  Self.bdeConexao.Open;
  Self.qryBase.Open;
  Self.qryTotal.Open;
end;

procedure TFrmRelatorio.RLGroup1AfterPrint(Sender: TObject);
begin
  rlRelatorioBase.NewInstance
end;

end.
