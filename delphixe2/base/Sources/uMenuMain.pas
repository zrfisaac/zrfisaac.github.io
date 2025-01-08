// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io

// # [ delphi ]
unit uMenuMain;

interface

uses
  // Delphi
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.Menus,
  Vcl.ComCtrls,
  // .\Sources
  uModelForm;

type
  TMenuMain = class(TForm)
    miMenu: TMainMenu;
    pnBack: TPanel;
    sbFooter: TStatusBar;
    miHelp: TMenuItem;
    miAbout: TMenuItem;
    miConfig: TMenuItem;
    procedure miAboutClick(Sender: TObject);
    procedure miConfigClick(Sender: TObject);
  private
    FMenu: TModelForm;
  public
    procedure Clean;
    procedure Menu(AClass: TComponentClass; var AReference); overload;
    procedure Menu(var AReference; AClass: TComponentClass); overload;
  end;

var
  MenuMain: TMenuMain;

implementation

uses
  // .\Libraries\Base
  uFormAbout,
  // .\Sources
  uMenuConfig;

{$R *.dfm}

{ TMenuMain }

procedure TMenuMain.Clean;
begin
  if (Assigned(FMenu)) then
    TModelForm(FMenu).pnBack.Parent := TWinControl(TModelForm(FMenu).pnBack.Owner);
  Self.FMenu := nil;
end;

procedure TMenuMain.Menu(AClass: TComponentClass; var AReference);
var
  AInstance: TModelForm;
begin
  if (AClass.InheritsFrom(TModelForm)) then
  begin
    if not(Assigned(TModelForm(AReference))) then
    begin
      AInstance := TModelForm(AClass.NewInstance);
      TModelForm(AReference) := AInstance;
      AInstance.Create(Application);
    end;
    AInstance := TModelForm(AReference);
    FMenu := AInstance;
    FMenu.pnBack.Parent := Self.pnBack;
  end;
end;

procedure TMenuMain.Menu(var AReference; AClass: TComponentClass);
begin
  Self.Menu(AClass, AReference);
end;

procedure TMenuMain.miAboutClick(Sender: TObject);
begin
  FormAbout.Start;
end;

procedure TMenuMain.miConfigClick(Sender: TObject);
begin
  Self.Menu(TMenuConfig, MenuConfig);
end;

end.
