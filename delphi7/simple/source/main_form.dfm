object MainForm: TMainForm
  Left = 200
  Top = 140
  Width = 300
  Height = 200
  Caption = 'MainForm'
  Color = clBtnFace
  Constraints.MinHeight = 200
  Constraints.MinWidth = 300
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
    Top = 142
    Width = 284
    Height = 19
    Panels = <>
  end
  object sbBack: TScrollBox
    Left = 0
    Top = 0
    Width = 284
    Height = 142
    Align = alClient
    Color = clGray
    ParentColor = False
    TabOrder = 1
  end
end
