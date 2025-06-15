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
  Menu = miMenu
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnBack: TPanel
    Left = 0
    Top = 0
    Width = 584
    Height = 322
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
  end
  object sbFooter: TStatusBar
    Left = 0
    Top = 322
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
  object miMenu: TMainMenu
    Left = 8
    Top = 8
    object miHelp: TMenuItem
      Caption = 'Help'
      object miAbout: TMenuItem
        Caption = 'About (F1)'
        OnClick = miAboutClick
      end
      object miConfig: TMenuItem
        Caption = 'Configuration  (F2)'
        OnClick = miConfigClick
      end
    end
  end
  object acAction: TActionList
    Left = 8
    Top = 40
    object acAbout: TAction
      Caption = 'acAbout'
      ShortCut = 112
      OnExecute = acAboutExecute
    end
    object acConfig: TAction
      Caption = 'acConfig'
      ShortCut = 113
      OnExecute = acConfigExecute
    end
    object acEscape: TAction
      Caption = 'acEscape'
      ShortCut = 27
      OnExecute = acEscapeExecute
    end
  end
end
