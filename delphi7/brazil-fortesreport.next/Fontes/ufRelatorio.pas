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
    meText: TRLMemo;
    procedure rlRelatorioBeforePrint(Sender: TObject;
      var PrintIt: Boolean);
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

procedure TFrmRelatorio.rlRelatorioBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
var
  _vI0: Integer;
begin
  _vI0 := 1;
  for _vI0 := 1 to 200 do
  begin
    if (_vI0 > 5) then
    begin
      _vI0 := 1;
      rlRelatorio.NewPage;
      meText.Lines.Clear;
    end;

    meText.Lines.Add(IntToStr(_vI0));

    _vI0 := _vI0 + 1;
  end;
end;

end.
