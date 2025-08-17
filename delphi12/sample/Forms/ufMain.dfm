object FrmMain: TFrmMain
  Left = 0
  Top = 0
  Caption = 'FrmMain'
  ClientHeight = 561
  ClientWidth = 784
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = miMenu
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 15
  object pnBack: TPanel
    Left = 0
    Top = 0
    Width = 784
    Height = 542
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitLeft = 400
    ExplicitTop = 176
    ExplicitWidth = 185
    ExplicitHeight = 41
  end
  object sbFooter: TStatusBar
    Left = 0
    Top = 542
    Width = 784
    Height = 19
    Panels = <>
    ExplicitLeft = 256
    ExplicitTop = 136
    ExplicitWidth = 0
  end
  object miMenu: TMainMenu
    Left = 24
    Top = 16
    object miHelp: TMenuItem
      Caption = 'miHelp'
      object miConfig: TMenuItem
        Caption = 'miConfig'
      end
      object miAbout: TMenuItem
        Caption = 'miAbout'
      end
    end
  end
  object acAction: TActionList
    Left = 24
    Top = 72
  end
  object tiTray: TTrayIcon
    Left = 24
    Top = 128
  end
end
