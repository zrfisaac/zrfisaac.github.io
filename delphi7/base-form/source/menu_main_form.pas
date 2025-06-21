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
    sbFooter: TStatusBar;
    procedure FormCreate(Sender: TObject);
  end;

var
  MenuMainForm: TMenuMainForm;

implementation

uses
  menu_main_data,
  zrlib;

{$R *.dfm}

procedure TMenuMainForm.FormCreate(Sender: TObject);
begin
  // # : - title
  Self.Caption := Application.Title;

  // # : - footer
  if (Self.sbFooter.Panels.Count > 0) then
    Self.sbFooter.Panels[0].Text := ZRFileVersion;
  if (Self.sbFooter.Panels.Count > 1) then
    Self.sbFooter.Panels[Self.sbFooter.Panels.Count - 1].Text := ZRInternalName + '     .';

  // # : - datamodule
  if not Assigned(MenuMainData) then
    MenuMainData := TMenuMainData.Create(Self);
end;

end.
