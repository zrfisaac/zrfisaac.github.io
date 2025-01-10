object MenuMain: TMenuMain
  Left = 0
  Top = 0
  Caption = 'ZRFISAAC'
  ClientHeight = 361
  ClientWidth = 584
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = miMenu
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnBack: TPanel
    Left = 0
    Top = 0
    Width = 584
    Height = 342
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
  end
  object sbFooter: TStatusBar
    Left = 0
    Top = 342
    Width = 584
    Height = 19
    Panels = <>
  end
  object miMenu: TMainMenu
    Left = 8
    Top = 8
    object miHelp: TMenuItem
      Caption = 'Help'
      object miConfig: TMenuItem
        Caption = 'Configuration'
        ShortCut = 123
        OnClick = miConfigClick
      end
      object miAbout: TMenuItem
        Caption = 'About'
        ShortCut = 112
        OnClick = miAboutClick
      end
    end
  end
end
