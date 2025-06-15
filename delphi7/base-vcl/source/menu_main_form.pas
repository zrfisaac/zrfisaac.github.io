// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires Santana
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io

// # [ delphi7 ]
unit menu_main_form;

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
  Menus,
  ActnList;

type
  TMenuMainForm = class(TForm)
    pnBack: TPanel;
    sbFooter: TStatusBar;
    miMenu: TMainMenu;
    miHelp: TMenuItem;
    miAbout: TMenuItem;
    miConfig: TMenuItem;
    acAction: TActionList;
    acAbout: TAction;
    acConfig: TAction;
    acEscape: TAction;
    procedure FormCreate(Sender: TObject);
    procedure acAboutExecute(Sender: TObject);
    procedure acConfigExecute(Sender: TObject);
    procedure miAboutClick(Sender: TObject);
    procedure miConfigClick(Sender: TObject);
    procedure acEscapeExecute(Sender: TObject);
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
  zrabout,
  zrlib;

{$R *.dfm}

procedure TMenuMainForm.fnConfig;
begin
  // # : menu - help - config
  Self.fnMenu(TMenuConfigForm, MenuConfigForm);
end;

procedure TMenuMainForm.fnAbout;
begin
  // # : menu - help - about
  Self.fnMenu(TZRAboutForm);
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

procedure TMenuMainForm.acConfigExecute(Sender: TObject);
begin
  Self.fnConfig;
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

procedure TMenuMainForm.miAboutClick(Sender: TObject);
begin
  Self.fnAbout;
end;

procedure TMenuMainForm.fnMenu(_pClass: TComponentClass);
var
  _vDummy: TForm;
begin
  fnMenu(_pClass,_vDummy);
end;

procedure TMenuMainForm.miConfigClick(Sender: TObject);
begin
  Self.fnConfig;
end;

procedure TMenuMainForm.acEscapeExecute(Sender: TObject);
begin
  Self.fnEscape;
end;

procedure TMenuMainForm.fnEscape;
begin
  if Assigned(Self.vBack) then
  begin
    Self.vBack.Parent := TModelBaseForm(Self.vBack.Owner);
    Self.vBack := Nil;
  end;
end;

end.
