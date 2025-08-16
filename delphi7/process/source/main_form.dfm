object MainForm: TMainForm
  Left = 200
  Top = 140
  Width = 600
  Height = 400
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
  object spSeparator: TSplitter
    Left = 185
    Top = 0
    Height = 280
    Color = clBlack
    ParentColor = False
  end
  object sbFooter: TStatusBar
    Left = 0
    Top = 342
    Width = 584
    Height = 19
    Panels = <>
  end
  object pnFooter: TPanel
    Left = 0
    Top = 301
    Width = 584
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btRun: TButton
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Run'
      TabOrder = 0
      OnClick = btRunClick
    end
    object btPath: TButton
      Left = 88
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Path'
      TabOrder = 1
      OnClick = btPathClick
    end
    object btGet: TButton
      Left = 168
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Get'
      TabOrder = 2
      OnClick = btGetClick
    end
  end
  object pnProcessBack: TPanel
    Left = 0
    Top = 0
    Width = 185
    Height = 280
    Align = alLeft
    Caption = 'pnProcessBack'
    TabOrder = 2
    object pnProcessTitle: TPanel
      Left = 1
      Top = 1
      Width = 183
      Height = 32
      Align = alTop
      Caption = 'Process'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object vlProcess: TValueListEditor
      Left = 1
      Top = 33
      Width = 183
      Height = 246
      Align = alClient
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goEditing, goRowSelect, goThumbTracking]
      ScrollBars = ssVertical
      TabOrder = 1
      TitleCaptions.Strings = (
        'ID'
        'Name')
      ColWidths = (
        63
        114)
    end
  end
  object pnPropertyBack: TPanel
    Left = 188
    Top = 0
    Width = 396
    Height = 280
    Align = alClient
    Caption = 'pnPropertyBack'
    TabOrder = 3
    object pnPropertyTitle: TPanel
      Left = 1
      Top = 1
      Width = 394
      Height = 32
      Align = alTop
      Caption = 'Property'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object vlProperty: TValueListEditor
      Left = 1
      Top = 33
      Width = 394
      Height = 246
      Align = alClient
      ScrollBars = ssVertical
      TabOrder = 1
      ColWidths = (
        150
        238)
    end
  end
  object pnMessage: TPanel
    Left = 0
    Top = 280
    Width = 584
    Height = 21
    Align = alBottom
    Alignment = taLeftJustify
    BevelOuter = bvLowered
    TabOrder = 4
  end
  object acAction: TActionList
    Left = 540
    Top = 256
    object acRun: TAction
      Caption = 'acRun'
      ShortCut = 13
      SecondaryShortCuts.Strings = (
        'F5')
      OnExecute = acRunExecute
    end
  end
end
