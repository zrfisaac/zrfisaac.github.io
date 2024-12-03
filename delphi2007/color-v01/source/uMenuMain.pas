unit uMenuMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, Buttons, Menus, ExtCtrls, StdCtrls;

type
  TMenuMain = class(TForm)
    sbStatus: TStatusBar;
    sbFundo: TScrollBox;
    pnColorHex: TPanel;
    lbColorHex: TLabel;
    edColorHex: TEdit;
    pnColor: TPanel;
    pnDelphi: TPanel;
    lbDelphi: TLabel;
    edDelphi: TEdit;
    pnCololBox: TPanel;
    lbCololBox: TLabel;
    dgColor: TColorDialog;
    cbCololBox: TColorBox;
    btCololBox: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure btCololBoxClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edColorHexKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edDelphiKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cbCololBoxChange(Sender: TObject);
    procedure edColorHexDblClick(Sender: TObject);
    procedure edDelphiDblClick(Sender: TObject);
    procedure pnColorDblClick(Sender: TObject);
  private
  public
    function ColorToHex(AColor : TColor): string;
    function ColorToDelphi(AColor : TColor): string;
    function HexToTColor(AColor: string): TColor;
    function DelphiToTColor(AColor: string): TColor;
    procedure UpdateColor(AColor: TColor);
    procedure SelectColor;
  end;
var
  MenuMain: TMenuMain;

implementation

{$R *.dfm}

// http://www.chami.com/tips/delphi/112096D.html
procedure TMenuMain.cbCololBoxChange(Sender: TObject);
begin
  // Color Box
  Self.UpdateColor(Self.cbCololBox.Selected);
end;

function TMenuMain.ColorToDelphi(AColor: TColor): string;
begin
  Result := (''
    // Transparency
    + '00'
    // Blue
    + IntToHex(GetBValue(AColor),2)
    // Green
    + IntToHex(GetGValue(AColor),2)
    // Red
    + IntToHex(GetRValue(AColor),2)
  );
end;

function TMenuMain.ColorToHex(AColor: TColor): string;
begin
  Result := (''
    // Red
    + IntToHex(GetRValue(AColor),2)
    // Green
    + IntToHex(GetGValue(AColor),2)
    // Blue
    + IntToHex(GetBValue(AColor),2)
  );
end;

function TMenuMain.DelphiToTColor(AColor: string): TColor;
begin
  Result := RGB(
    // Blue
     StrToInt('$' + Copy(AColor,7,2))
    // Green
    ,StrToInt('$' + Copy(AColor,5,2))
    // Red
    ,StrToInt('$' + Copy(AColor,3,2))
  );
end;

procedure TMenuMain.edColorHexDblClick(Sender: TObject);
begin
  Self.SelectColor;
end;

procedure TMenuMain.edColorHexKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  I: Integer;
begin
  I := TEdit(Sender).SelStart;
  if (Length(TEdit(Sender).Text) = 6) then
    Self.UpdateColor(HexToTColor(TEdit(Sender).Text));
  TEdit(Sender).SelStart := I;
end;

procedure TMenuMain.edDelphiDblClick(Sender: TObject);
begin
  Self.SelectColor;
end;

procedure TMenuMain.edDelphiKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  I: Integer;
begin
  I := TEdit(Sender).SelStart;
  if (Length(TEdit(Sender).Text) = 8) then
    Self.UpdateColor(DelphiToTColor(TEdit(Sender).Text));
  TEdit(Sender).SelStart := I;
end;

function TMenuMain.HexToTColor(AColor: string): TColor;
begin
  Result := RGB(
    // Red
     StrToInt('$' + Copy(AColor,1,2))
    // Green
    ,StrToInt('$' + Copy(AColor,3,2))
    // Blue
    ,StrToInt('$' + Copy(AColor,5,2))
  );
end;

procedure TMenuMain.pnColorDblClick(Sender: TObject);
begin
  Self.SelectColor;
end;

procedure TMenuMain.SelectColor;
begin
  // Color Box
  Self.dgColor.Color := Self.pnColor.Color;
  if (Self.dgColor.Execute(Self.Handle)) then
    Self.UpdateColor(Self.dgColor.Color);
end;

procedure TMenuMain.UpdateColor(AColor: TColor);
begin
  // Update Color
  Self.pnColor.Color := AColor;
  Self.cbCololBox.Selected := AColor;
  {
  if (TComboBox(Self.cbCololBox).Text = '') then
    Self.cbCololBox.Color := AColor
  else
    Self.cbCololBox.Color := clWhite;
  }
  Self.edColorHex.Text := Self.ColorToHex(AColor);
  Self.edDelphi.Text := ColorToDelphi(AColor);
end;

procedure TMenuMain.btCololBoxClick(Sender: TObject);
begin
  Self.SelectColor;
end;

procedure TMenuMain.FormCreate(Sender: TObject);
begin
  // Ttiulo
  Self.Caption := Application.Title;
end;

procedure TMenuMain.FormShow(Sender: TObject);
begin
  // Cor Padrao
  Self.UpdateColor(clBlue);
end;

end.

