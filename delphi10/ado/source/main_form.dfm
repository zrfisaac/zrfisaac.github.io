object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'MainForm'
  ClientHeight = 361
  ClientWidth = 284
  Color = clBtnFace
  Constraints.MinHeight = 200
  Constraints.MinWidth = 300
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object sbFooter: TStatusBar
    Left = 0
    Top = 342
    Width = 284
    Height = 19
    Panels = <>
    ExplicitTop = 142
  end
  object sbBack: TScrollBox
    Left = 0
    Top = 0
    Width = 284
    Height = 301
    Align = alClient
    Color = clGray
    ParentColor = False
    TabOrder = 1
    ExplicitTop = -5
    object pnPassword: TPanel
      Left = 0
      Top = 228
      Width = 280
      Height = 57
      Align = alTop
      ParentBackground = False
      TabOrder = 3
      ExplicitLeft = -3
      ExplicitTop = -2
      DesignSize = (
        280
        57)
      object lbPassword: TLabel
        Left = 7
        Top = 8
        Width = 46
        Height = 13
        Caption = 'Password'
      end
      object edPassword: TEdit
        Left = 7
        Top = 27
        Width = 266
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        PasswordChar = '#'
        TabOrder = 0
        Text = '1234'
      end
    end
    object pnUser: TPanel
      Left = 0
      Top = 171
      Width = 280
      Height = 57
      Align = alTop
      ParentBackground = False
      TabOrder = 2
      ExplicitLeft = 3
      ExplicitTop = 116
      DesignSize = (
        280
        57)
      object lbUser: TLabel
        Left = 7
        Top = 8
        Width = 22
        Height = 13
        Caption = 'User'
      end
      object edUser: TEdit
        Left = 7
        Top = 27
        Width = 266
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Text = 'sa'
      end
    end
    object pnDatabase: TPanel
      Left = 0
      Top = 57
      Width = 280
      Height = 57
      Align = alTop
      ParentBackground = False
      TabOrder = 1
      ExplicitTop = 8
      DesignSize = (
        280
        57)
      object lbDatabase: TLabel
        Left = 7
        Top = 8
        Width = 46
        Height = 13
        Caption = 'Database'
      end
      object edDatabase: TEdit
        Left = 7
        Top = 27
        Width = 266
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Text = 'master'
      end
    end
    object pnServer: TPanel
      Left = 0
      Top = 0
      Width = 280
      Height = 57
      Align = alTop
      ParentBackground = False
      TabOrder = 0
      ExplicitTop = 2
      DesignSize = (
        280
        57)
      object lbServer: TLabel
        Left = 7
        Top = 8
        Width = 32
        Height = 13
        Caption = 'Server'
      end
      object edServer: TEdit
        Left = 7
        Top = 27
        Width = 266
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Text = 'localhost'
      end
    end
    object pnDomain: TPanel
      Left = 0
      Top = 114
      Width = 280
      Height = 57
      Align = alTop
      ParentBackground = False
      TabOrder = 4
      ExplicitLeft = -3
      ExplicitTop = 100
      DesignSize = (
        280
        57)
      object lbDomain: TLabel
        Left = 7
        Top = 8
        Width = 35
        Height = 13
        Caption = 'Domain'
      end
      object edDomain: TEdit
        Left = 7
        Top = 27
        Width = 266
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
      end
    end
  end
  object pnFooter: TPanel
    Left = 0
    Top = 301
    Width = 284
    Height = 41
    Align = alBottom
    TabOrder = 2
    ExplicitTop = 295
    object pnFooter03: TPanel
      Left = 192
      Top = 1
      Width = 91
      Height = 39
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
    end
    object pnFooter02: TPanel
      Left = 178
      Top = 1
      Width = 14
      Height = 39
      Align = alRight
      BevelOuter = bvNone
      Color = clFuchsia
      ParentBackground = False
      TabOrder = 1
      Visible = False
      ExplicitLeft = 180
    end
    object pnFooter01: TPanel
      Left = 1
      Top = 1
      Width = 177
      Height = 39
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      ExplicitLeft = 9
      ExplicitTop = -4
      object btRun01: TBitBtn
        Left = 8
        Top = 9
        Width = 67
        Height = 25
        Caption = 'Run'
        TabOrder = 0
        OnClick = btRun01Click
      end
    end
  end
  object acAction: TActionList
    Left = 16
    Top = 249
    object acRun: TAction
      Caption = 'acRun'
      ShortCut = 13
      OnExecute = acRunExecute
    end
    object acEsc: TAction
      Caption = 'acEsc'
      ShortCut = 27
      OnExecute = acEscExecute
    end
  end
end
