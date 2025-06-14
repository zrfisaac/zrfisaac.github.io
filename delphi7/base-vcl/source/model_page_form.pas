unit model_page_form;

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
  ExtCtrls,
  ComCtrls,
  model_base_form, StdCtrls, Buttons;

type
  TModelPageForm = class(TModelBaseForm)
    pcPage: TPageControl;
    pnFooter: TPanel;
    pnFooter03: TPanel;
    pnFooter02: TPanel;
    pnFooter01: TPanel;
    btClose: TBitBtn;
    procedure btCloseClick(Sender: TObject);
  end;

var
  ModelPageForm: TModelPageForm;

implementation

{$R *.dfm}

procedure TModelPageForm.btCloseClick(Sender: TObject);
begin
  inherited;
  Self.pnBack.Parent := Self;
end;

end.
