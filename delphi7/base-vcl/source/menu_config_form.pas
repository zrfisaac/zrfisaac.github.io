unit menu_config_form;

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
  model_page_form, ComCtrls, StdCtrls, Buttons;

type
  TMenuConfigForm = class(TModelPageForm)
    tsMain: TTabSheet;
  end;

var
  MenuConfigForm: TMenuConfigForm;

implementation

{$R *.dfm}

end.
