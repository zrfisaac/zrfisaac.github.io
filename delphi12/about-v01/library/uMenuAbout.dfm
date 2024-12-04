object MenuAbout: TMenuAbout
  Left = 0
  Top = 0
  BiDiMode = bdLeftToRight
  BorderStyle = bsDialog
  Caption = 'Sobre'
  ClientHeight = 161
  ClientWidth = 504
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  ParentBiDiMode = False
  Position = poMainFormCenter
  TextHeight = 15
  object pnBack: TPanel
    Left = 0
    Top = 0
    Width = 504
    Height = 161
    Align = alClient
    BevelOuter = bvNone
    Color = 2367774
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 502
    ExplicitHeight = 153
    object pnBack01: TPanel
      Left = 0
      Top = 0
      Width = 169
      Height = 161
      Align = alLeft
      BevelOuter = bvNone
      Color = 2367774
      ParentBackground = False
      TabOrder = 0
      ExplicitHeight = 153
      object lbTitle01: TLabel
        Left = 18
        Top = 16
        Width = 137
        Height = 45
        Alignment = taCenter
        AutoSize = False
        Caption = '</>'
        Font.Charset = ANSI_CHARSET
        Font.Color = clSilver
        Font.Height = -35
        Font.Name = 'Segoe UI Black'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbTitle02: TLabel
        Left = 18
        Top = 67
        Width = 137
        Height = 32
        Alignment = taCenter
        AutoSize = False
        Caption = 'Isaac Caires'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -24
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbTitle03: TLabel
        Left = 18
        Top = 105
        Width = 137
        Height = 32
        Alignment = taCenter
        AutoSize = False
        Caption = 'Software Developer'
        Font.Charset = ANSI_CHARSET
        Font.Color = clSilver
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object lbTitle04: TLabel
        Left = 18
        Top = 129
        Width = 137
        Height = 32
        Cursor = crHandPoint
        Alignment = taCenter
        AutoSize = False
        Caption = 'zrfisaac.github.io'
        Font.Charset = ANSI_CHARSET
        Font.Color = clSilver
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsUnderline]
        ParentFont = False
        OnClick = lbTitle04Click
      end
    end
    object pnBack02: TPanel
      Left = 169
      Top = 0
      Width = 10
      Height = 161
      Align = alLeft
      BevelOuter = bvNone
      Color = clFuchsia
      ParentBackground = False
      TabOrder = 1
      Visible = False
      ExplicitHeight = 153
    end
    object pnBack03: TPanel
      Left = 179
      Top = 0
      Width = 325
      Height = 161
      Align = alClient
      BevelOuter = bvNone
      Color = 2367774
      ParentBackground = False
      TabOrder = 2
      ExplicitWidth = 323
      ExplicitHeight = 153
      object meAbout: TMemo
        Left = 0
        Top = 0
        Width = 325
        Height = 161
        Align = alClient
        Color = 2367774
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clSilver
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        Lines.Strings = (
          'Hello! My name is Isaac Caires, and I'#39'm a passionate '
          'software developer '
          'with over 15 years of experience in full-stack '
          'development and hospital '
          'management solutions. I specialize in creating robust '
          'and efficient '
          'applications using technologies like Delphi, C#, '
          'ASP.NET '
          'MVC, and '
          'Python.')
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
  end
  object acAction: TActionList
    Left = 24
    Top = 8
    object acEsc: TAction
      Category = 'Key'
      Caption = 'Esc'
      ShortCut = 27
      OnExecute = acEscExecute
    end
    object acEnter: TAction
      Category = 'Key'
      Caption = 'acEnter'
      ShortCut = 13
      OnExecute = acEnterExecute
    end
  end
end
