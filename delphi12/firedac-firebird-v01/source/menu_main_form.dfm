object MenuMainForm: TMenuMainForm
  Left = 0
  Top = 0
  Caption = 'MenuMainForm'
  ClientHeight = 361
  ClientWidth = 584
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = miMenu
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 13
  object pnBack: TPanel
    Left = 0
    Top = 0
    Width = 584
    Height = 342
    Align = alClient
    TabOrder = 0
    object pnFooter: TPanel
      Left = 1
      Top = 300
      Width = 582
      Height = 41
      Align = alBottom
      TabOrder = 0
      object pnFooter03: TPanel
        Left = 396
        Top = 1
        Width = 185
        Height = 39
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 0
      end
      object pnFooter02: TPanel
        Left = 388
        Top = 1
        Width = 8
        Height = 39
        Align = alRight
        BevelOuter = bvNone
        Color = clFuchsia
        ParentBackground = False
        TabOrder = 1
        Visible = False
      end
      object pnFooter01: TPanel
        Left = 1
        Top = 1
        Width = 387
        Height = 39
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 2
        object btRoutine: TBitBtn
          Left = 8
          Top = 8
          Width = 75
          Height = 25
          Caption = 'Routine'
          TabOrder = 0
        end
      end
    end
    object pnBody: TPanel
      Left = 1
      Top = 1
      Width = 582
      Height = 299
      Align = alClient
      TabOrder = 1
      object dbgQuery: TDBGrid
        Left = 1
        Top = 1
        Width = 580
        Height = 297
        Align = alClient
        DataSource = MenuMainData.dtsMain
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 342
    Width = 584
    Height = 19
    Panels = <>
  end
  object miMenu: TMainMenu
    Left = 8
    Top = 8
  end
end
