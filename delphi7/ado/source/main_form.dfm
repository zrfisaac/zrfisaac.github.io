object MainForm: TMainForm
  Left = 200
  Top = 140
  Width = 300
  Height = 360
  Caption = 'MainForm'
  Color = clBtnFace
  Constraints.MinHeight = 200
  Constraints.MinWidth = 300
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object sbFooter: TStatusBar
    Left = 0
    Top = 302
    Width = 284
    Height = 19
    Panels = <>
  end
  object sbBack: TScrollBox
    Left = 0
    Top = 0
    Width = 284
    Height = 261
    Align = alClient
    Color = clGray
    ParentColor = False
    TabOrder = 1
    object pnServer: TPanel
      Left = 0
      Top = 0
      Width = 280
      Height = 49
      Align = alTop
      TabOrder = 0
      DesignSize = (
        280
        49)
      object lbServer: TLabel
        Left = 8
        Top = 8
        Width = 31
        Height = 13
        Caption = 'Server'
      end
      object edServer: TEdit
        Left = 8
        Top = 24
        Width = 265
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Text = 'localhost'
      end
    end
    object pnDatabase: TPanel
      Left = 0
      Top = 49
      Width = 280
      Height = 49
      Align = alTop
      TabOrder = 1
      DesignSize = (
        280
        49)
      object lbDatabase: TLabel
        Left = 8
        Top = 8
        Width = 46
        Height = 13
        Caption = 'Database'
      end
      object edDatabase: TEdit
        Left = 8
        Top = 24
        Width = 265
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Text = 'master'
      end
    end
    object pnDomain: TPanel
      Left = 0
      Top = 98
      Width = 280
      Height = 49
      Align = alTop
      TabOrder = 2
      DesignSize = (
        280
        49)
      object lbDomain: TLabel
        Left = 8
        Top = 8
        Width = 36
        Height = 13
        Caption = 'Domain'
      end
      object edDomain: TEdit
        Left = 8
        Top = 24
        Width = 265
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
      end
    end
    object pnUser: TPanel
      Left = 0
      Top = 147
      Width = 280
      Height = 49
      Align = alTop
      TabOrder = 3
      DesignSize = (
        280
        49)
      object lbUser: TLabel
        Left = 8
        Top = 8
        Width = 22
        Height = 13
        Caption = 'User'
      end
      object edUser: TEdit
        Left = 8
        Top = 24
        Width = 265
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Text = 'sa'
      end
    end
    object pnPassword: TPanel
      Left = 0
      Top = 196
      Width = 280
      Height = 49
      Align = alTop
      TabOrder = 4
      DesignSize = (
        280
        49)
      object lbPassword: TLabel
        Left = 8
        Top = 8
        Width = 46
        Height = 13
        Caption = 'Password'
      end
      object edPassword: TEdit
        Left = 8
        Top = 24
        Width = 265
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        PasswordChar = '#'
        TabOrder = 0
        Text = '1234'
      end
    end
  end
  object pnFooter: TPanel
    Left = 0
    Top = 261
    Width = 284
    Height = 41
    Align = alBottom
    TabOrder = 2
    object pnFooter03: TPanel
      Left = 192
      Top = 1
      Width = 91
      Height = 39
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
    end
    object pnFooter01: TPanel
      Left = 1
      Top = 1
      Width = 173
      Height = 39
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object btRun01: TButton
        Left = 8
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Run 01'
        TabOrder = 0
        OnClick = btRun01Click
      end
    end
    object pnFooter02: TPanel
      Left = 174
      Top = 1
      Width = 18
      Height = 39
      Align = alRight
      BevelOuter = bvNone
      Color = clFuchsia
      TabOrder = 2
      Visible = False
    end
  end
  object acAction: TActionList
    Left = 248
    Top = 264
    object acEsc: TAction
      Caption = 'acEsc'
      ShortCut = 27
      OnExecute = acEscExecute
    end
    object acRun01: TAction
      Caption = 'acRun01'
      ShortCut = 13
      OnExecute = acRun01Execute
    end
  end
end
