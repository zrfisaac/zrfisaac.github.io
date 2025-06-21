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
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object sbFooter: TStatusBar
    Left = 0
    Top = 342
    Width = 584
    Height = 19
    Panels = <
      item
        Width = 100
      end
      item
        Width = 135
      end
      item
        Width = 100
      end
      item
        Alignment = taRightJustify
        Width = 50
      end>
  end
  object pnBack: TPanel
    Left = 0
    Top = 0
    Width = 584
    Height = 342
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object sbBack: TScrollBox
      Left = 0
      Top = 0
      Width = 584
      Height = 301
      Align = alClient
      Color = clGray
      ParentColor = False
      TabOrder = 0
      object pnServer: TPanel
        Left = 0
        Top = 0
        Width = 580
        Height = 49
        Align = alTop
        TabOrder = 0
        DesignSize = (
          580
          49)
        object lbServer: TLabel
          Left = 8
          Top = 8
          Width = 31
          Height = 13
          Caption = 'Server'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object edServer: TEdit
          Left = 8
          Top = 24
          Width = 561
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          Text = 'localhost'
        end
      end
      object pnUser: TPanel
        Left = 0
        Top = 49
        Width = 580
        Height = 49
        Align = alTop
        TabOrder = 1
        DesignSize = (
          580
          49)
        object lbUser: TLabel
          Left = 8
          Top = 8
          Width = 22
          Height = 13
          Caption = 'User'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object edUser: TEdit
          Left = 8
          Top = 24
          Width = 561
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          Text = 'debug'
        end
      end
      object pnPassword: TPanel
        Left = 0
        Top = 98
        Width = 580
        Height = 49
        Align = alTop
        TabOrder = 2
        DesignSize = (
          580
          49)
        object lbPassword: TLabel
          Left = 8
          Top = 8
          Width = 46
          Height = 13
          Caption = 'Password'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object edPassword: TEdit
          Left = 8
          Top = 24
          Width = 561
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          PasswordChar = '#'
          TabOrder = 0
          Text = '1234'
        end
      end
      object pnDatabase: TPanel
        Left = 0
        Top = 147
        Width = 580
        Height = 49
        Align = alTop
        TabOrder = 3
        DesignSize = (
          580
          49)
        object lbDatabase: TLabel
          Left = 8
          Top = 8
          Width = 46
          Height = 13
          Caption = 'Database'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object edDatabase: TEdit
          Left = 8
          Top = 24
          Width = 561
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          Text = 'DEBUG'
        end
      end
    end
    object pnFooter: TPanel
      Left = 0
      Top = 301
      Width = 584
      Height = 41
      Align = alBottom
      TabOrder = 1
      object pnFooter03: TPanel
        Left = 480
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
        end
      end
      object pnFooter02: TPanel
        Left = 471
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
        Width = 470
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
  end
  object acAction: TActionList
    Left = 440
    Top = 304
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
