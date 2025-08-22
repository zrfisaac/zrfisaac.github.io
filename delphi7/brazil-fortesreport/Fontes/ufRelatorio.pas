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
  RLRichFilter;

type
  TFrmRelatorio = class(TForm)
    rlRelatorio: TRLReport;
    RLRichFilter: TRLRichFilter;
    RLHTMLFilter: TRLHTMLFilter;
    RLPDFFilter: TRLPDFFilter;
    RLXLSFilter: TRLXLSFilter;
    RLDraftFilter: TRLDraftFilter;
  public
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
  _Relatorio.rlRelatorio.PreviewModal;
  _Relatorio.Free;
end;

end.
