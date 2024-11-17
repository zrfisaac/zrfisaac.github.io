object MenuMainForm: TMenuMainForm
  Left = 0
  Top = 0
  Caption = 'MenuMainForm'
  ClientHeight = 360
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
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnBack: TPanel
    Left = 0
    Top = 0
    Width = 584
    Height = 341
    Align = alClient
    TabOrder = 0
    ExplicitHeight = 342
    object pnFooter: TPanel
      Left = 1
      Top = 299
      Width = 582
      Height = 41
      Align = alBottom
      TabOrder = 0
      ExplicitTop = 300
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
        object btRun: TBitBtn
          Left = 8
          Top = 6
          Width = 57
          Height = 25
          Caption = 'Run'
          TabOrder = 0
          OnClick = btRunClick
        end
      end
    end
    object pnBody: TPanel
      Left = 1
      Top = 1
      Width = 582
      Height = 298
      Align = alClient
      TabOrder = 1
      ExplicitHeight = 299
      object spSplitter: TSplitter
        Left = 145
        Top = 1
        Width = 4
        Height = 296
        Color = clBlack
        ParentColor = False
        ExplicitLeft = 151
        ExplicitTop = -3
        ExplicitHeight = 297
      end
      object meText: TMemo
        Left = 149
        Top = 1
        Width = 432
        Height = 296
        Align = alClient
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Consolas'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssBoth
        TabOrder = 0
        WantTabs = True
        WordWrap = False
        ExplicitHeight = 297
      end
      object lbThread: TListBox
        Left = 1
        Top = 1
        Width = 144
        Height = 296
        Align = alLeft
        ItemHeight = 13
        TabOrder = 1
        ExplicitHeight = 297
      end
    end
  end
  object sbStatus: TStatusBar
    Left = 0
    Top = 341
    Width = 584
    Height = 19
    Panels = <>
  end
  object miMenu: TMainMenu
    Left = 8
    Top = 8
  end
end
