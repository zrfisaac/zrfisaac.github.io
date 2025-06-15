// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires Santana
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io

// # [ lazarus ]
unit menu_main_form;

{$mode objfpc}
{$H+}

interface

uses
  Classes,
  SysUtils,
  Forms,
  Controls,
  Graphics,
  Dialogs,
  ExtCtrls,
  Menus,
  ActnList,
  ComCtrls;

type

  { TMenuMainForm }

  TMenuMainForm = class(TForm)
    acAction: TActionList;
    acEscape: TAction;
    acAbout: TAction;
    miConfig: TMenuItem;
    miAbout: TMenuItem;
    miHelp: TMenuItem;
    miMenu: TMainMenu;
    pnBack: TPanel;
    sbFooter: TStatusBar;
    procedure acAboutExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure miAboutClick(Sender: TObject);
    procedure miConfigClick(Sender: TObject);
  private
    vBack: TPanel;
  public
    procedure fnAbout;
    procedure fnConfig;
    procedure fnEscape;
    procedure fnMenu(_pClass: TComponentClass); overload;
    procedure fnMenu(_pClass: TComponentClass; var _pVariable); overload;
    procedure fnMenu(var _pVariable; _pClass: TComponentClass); overload;
  end;

var
  MenuMainForm: TMenuMainForm;

implementation

uses
  model_base_form,
  menu_config_form,
  zrabout_lazarus,
  zrlib;

{$R *.lfm}

{ TMenuMainForm }

procedure TMenuMainForm.miAboutClick(Sender: TObject);
begin
  Self.fnAbout;
end;

procedure TMenuMainForm.FormCreate(Sender: TObject);
begin
  // # : - variable
  Self.vBack := Nil;

  // # : - title
  Self.Caption := Application.Title;

  // # : - footer
  if (Self.sbFooter.Panels.Count > 0) then
    Self.sbFooter.Panels[0].Text := ZRFileVersion;
  if (Self.sbFooter.Panels.Count > 1) then
    Self.sbFooter.Panels[Self.sbFooter.Panels.Count - 1].Text := ZRInternalName + '     .';
end;

procedure TMenuMainForm.acAboutExecute(Sender: TObject);
begin
  Self.fnAbout;
end;

procedure TMenuMainForm.miConfigClick(Sender: TObject);
begin
  Self.fnConfig;
end;

procedure TMenuMainForm.fnAbout;
begin
  // # : menu - help - about
  Self.fnMenu(TZRAboutForm);
end;

procedure TMenuMainForm.fnConfig;
begin
  // # : menu - help - config
  Self.fnMenu(TMenuConfigForm, MenuConfigForm);
end;

procedure TMenuMainForm.fnEscape;
begin

end;

procedure TMenuMainForm.fnMenu(_pClass: TComponentClass);
var
  _vDummy: TForm;
begin
  fnMenu(_pClass,_vDummy);
end;

procedure TMenuMainForm.fnMenu(_pClass: TComponentClass; var _pVariable);
var
  _vInstance: TForm;
begin
  if (_pClass.InheritsFrom(TModelBaseForm)) then
  begin
    Self.fnEscape;
    if not Assigned(TModelBaseForm(_pVariable)) then
    begin
      _vInstance := TModelBaseForm(_pClass.NewInstance);
      TModelBaseForm(_vInstance).Create(Self);
      TModelBaseForm(_pVariable) := TModelBaseForm(_vInstance);
    end;
    TModelBaseForm(_pVariable).pnBack.Parent := Self.pnBack;
    Self.vBack := TModelBaseForm(_pVariable).pnBack;
  end
  else if (_pClass.InheritsFrom(TForm)) then
  begin
    _vInstance := TForm(_pClass.NewInstance);
    TForm(_vInstance).Create(Self);
    _vInstance.ShowModal;
    _vInstance.Free;
  end;
end;

procedure TMenuMainForm.fnMenu(var _pVariable; _pClass: TComponentClass);
begin
  Self.fnMenu(_pClass, _pVariable);
end;

end.

