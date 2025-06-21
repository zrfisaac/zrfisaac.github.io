object MenuMainForm: TMenuMainForm
  Left = 200
  Top = 120
  Width = 600
  Height = 400
  Caption = 'MenuMainForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object sbFooter: TStatusBar
    Left = 0
    Top = 342
    Width = 584
    Height = 19
    Panels = <
      item
        Width = 100
      end
      item
        Alignment = taRightJustify
        Width = 50
      end>
  end
end
