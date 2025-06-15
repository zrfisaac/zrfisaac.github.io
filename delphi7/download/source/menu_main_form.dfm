object MenuMainForm: TMenuMainForm
  Left = 200
  Top = 120
  Width = 400
  Height = 160
  Caption = 'MenuMainForm'
  Color = clBtnFace
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
    Top = 102
    Width = 384
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
  object pnUrl: TPanel
    Left = 0
    Top = 0
    Width = 384
    Height = 49
    Align = alTop
    TabOrder = 1
    DesignSize = (
      384
      49)
    object lbUrl: TLabel
      Left = 8
      Top = 8
      Width = 22
      Height = 13
      Caption = 'URL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object edUrl: TEdit
      Left = 8
      Top = 24
      Width = 365
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Text = 'https://zrfisaac.github.io/favicon.png'
    end
  end
  object pbDownload: TProgressBar
    Left = 0
    Top = 49
    Width = 384
    Height = 12
    Align = alClient
    TabOrder = 2
  end
  object pnFooter: TPanel
    Left = 0
    Top = 61
    Width = 384
    Height = 41
    Align = alBottom
    TabOrder = 3
    object pnFooter03: TPanel
      Left = 280
      Top = 1
      Width = 103
      Height = 39
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 2
      object btClose: TBitBtn
        Left = 8
        Top = 8
        Width = 89
        Height = 25
        Caption = 'Close (ESC)'
        TabOrder = 0
        OnClick = btCloseClick
      end
    end
    object pnFooter02: TPanel
      Left = 271
      Top = 1
      Width = 9
      Height = 39
      Align = alRight
      BevelOuter = bvNone
      Color = clFuchsia
      TabOrder = 1
      Visible = False
    end
    object pnFooter01: TPanel
      Left = 1
      Top = 1
      Width = 270
      Height = 39
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object btRun: TBitBtn
        Left = 8
        Top = 8
        Width = 89
        Height = 25
        Caption = 'Run (F5)'
        TabOrder = 0
        OnClick = btRunClick
      end
    end
  end
  object acAction: TActionList
    Left = 232
    Top = 64
    object acClose: TAction
      Caption = 'acClose'
      ShortCut = 27
      OnExecute = acCloseExecute
    end
    object acRun: TAction
      Caption = 'acRun'
      ShortCut = 116
      OnExecute = acRunExecute
    end
  end
end
