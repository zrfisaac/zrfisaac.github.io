object MenuMainForm: TMenuMainForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'MenuMainForm'
  ClientHeight = 88
  ClientWidth = 252
  Color = clBtnFace
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
    Width = 252
    Height = 69
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 584
    ExplicitHeight = 342
    object vleData: TValueListEditor
      Left = 1
      Top = 1
      Width = 250
      Height = 67
      Align = alClient
      TabOrder = 0
      ExplicitLeft = 8
      ExplicitTop = 88
      ExplicitWidth = 306
      ExplicitHeight = 300
      ColWidths = (
        112
        132)
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 69
    Width = 252
    Height = 19
    Panels = <>
    ExplicitTop = 342
    ExplicitWidth = 584
  end
  object miMenu: TMainMenu
    Left = 8
    Top = 48
  end
  object tmTimer: TTimer
    Interval = 300
    OnTimer = tmTimerTimer
    Left = 40
    Top = 48
  end
end
