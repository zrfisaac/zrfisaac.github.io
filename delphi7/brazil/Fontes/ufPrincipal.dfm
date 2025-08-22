object FrmPrincipal: TFrmPrincipal
  Left = 200
  Top = 140
  Width = 300
  Height = 200
  Caption = 'FrmPrincipal'
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
  object sbRodape: TStatusBar
    Left = 0
    Top = 142
    Width = 284
    Height = 19
    Panels = <>
  end
  object sbFundo: TScrollBox
    Left = 0
    Top = 0
    Width = 284
    Height = 101
    Align = alClient
    Color = clGray
    ParentColor = False
    TabOrder = 1
  end
  object pnRodape: TPanel
    Left = 0
    Top = 101
    Width = 284
    Height = 41
    Align = alBottom
    TabOrder = 2
  end
end
