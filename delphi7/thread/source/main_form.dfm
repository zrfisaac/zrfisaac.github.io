object MainForm: TMainForm
  Left = 200
  Top = 140
  Width = 300
  Height = 300
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
  object sbStatus: TStatusBar
    Left = 0
    Top = 242
    Width = 284
    Height = 19
    Panels = <>
  end
  object miText: TMemo
    Left = 0
    Top = 0
    Width = 284
    Height = 201
    Align = alClient
    Color = clSkyBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Consolas'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    OnChange = miTextChange
  end
  object pnFooter: TPanel
    Left = 0
    Top = 201
    Width = 284
    Height = 41
    Align = alBottom
    TabOrder = 2
    object btRun: TButton
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Run'
      TabOrder = 0
      OnClick = btRunClick
    end
  end
end
