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
          OnClick = btRoutineClick
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
      object Splitter2: TSplitter
        Left = 209
        Top = 1
        Width = 4
        Height = 297
        Color = clBlack
        ParentColor = False
        ExplicitLeft = 249
        ExplicitTop = -4
      end
      object Panel1: TPanel
        Left = 213
        Top = 1
        Width = 368
        Height = 297
        Align = alClient
        Caption = 'Panel1'
        TabOrder = 0
        object Splitter1: TSplitter
          Left = 1
          Top = 57
          Width = 366
          Height = 4
          Cursor = crVSplit
          Align = alTop
          Color = clBlack
          ParentColor = False
          ExplicitLeft = 6
          ExplicitTop = 51
          ExplicitWidth = 370
        end
        object Memo1: TMemo
          Left = 1
          Top = 1
          Width = 366
          Height = 56
          Align = alTop
          Lines.Strings = (
            'Memo1')
          TabOrder = 0
        end
        object DBGrid1: TDBGrid
          Left = 1
          Top = 61
          Width = 366
          Height = 235
          Align = alClient
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
        end
      end
      object vleConfig: TValueListEditor
        Left = 1
        Top = 1
        Width = 208
        Height = 297
        Align = alLeft
        Strings.Strings = (
          'GetDriverFunc=getSQLDriverORANET'
          'LibraryName=dbexpoda40.dll'
          'Vendorlib=dbexpoda40.dll'
          'BlobSize=-1'
          'Database=localhost:1521:ORCL'
          'ErrorResourceFile='
          'LocaleCode=0000'
          'password=1234'
          'Oracle TransIsolation=ReadCommited'
          'User_Name=O01'
          'ProductName=Oracle'
          
            'DriverAssemblyLoader=CoreLab.DbxOda.DriverLoader.TCRDynalinkDriv' +
            'erLoader,CoreLab.DbxOda.DriverLoader,Version=1.0.0.5001,Culture=' +
            'neutral,PublicKeyToken=09af7300eec23701'
          'IntegerPrecision=10'
          'UseUnicode=false'
          'CharSet=WE8ISO8859P1'
          'ServerCharSet=WE8ISO8859P1'
          'ConnectionName=Oracle'
          'DriverName=DevartOracle'
          'SID=ORCL'
          'Server=localhost'
          'ServerName=localhost'
          'Port=1521'
          'UserName=O01'
          'User Name=O01'
          'Server Name=localhost')
        TabOrder = 1
        TitleCaptions.Strings = (
          'Name'
          'Value')
        ExplicitLeft = 0
        ExplicitTop = -3
        ColWidths = (
          88
          97)
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
  object acAction: TActionList
    Left = 192
    Top = 104
    object acF5: TAction
      Category = 'Key'
      Caption = 'F5'
      ShortCut = 116
      OnExecute = acF5Execute
    end
  end
end
