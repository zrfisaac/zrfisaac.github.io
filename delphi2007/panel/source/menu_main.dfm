object MenuMain: TMenuMain
  Left = 0
  Top = 0
  Caption = 'MenuMain'
  ClientHeight = 361
  ClientWidth = 584
  Color = clBtnFace
  Constraints.MinHeight = 200
  Constraints.MinWidth = 300
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
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
    Panels = <
      item
        Width = 80
      end
      item
        Width = 50
      end>
  end
  object miMenu: TMainMenu
    Left = 552
    object miHelp: TMenuItem
      Caption = 'Help'
      object miAbout: TMenuItem
        Action = acAbout
      end
    end
  end
  object acAction: TActionList
    Left = 552
    Top = 32
    object acAbout: TAction
      Category = 'Help'
      Caption = 'About'
      ShortCut = 112
      OnExecute = acAboutExecute
    end
  end
end
