object MenuMain: TMenuMain
  Left = 0
  Top = 0
  Caption = 'MenuMain'
  ClientHeight = 424
  ClientWidth = 584
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pcFundo: TPageControl
    Left = 0
    Top = 0
    Width = 584
    Height = 424
    ActivePage = tsMssql
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 447
    object tsPostgres: TTabSheet
      Caption = 'PostgreSQL'
      ExplicitWidth = 439
      object sbPostgres: TScrollBox
        Left = 0
        Top = 0
        Width = 576
        Height = 243
        Align = alClient
        Color = clGray
        ParentColor = False
        TabOrder = 0
        ExplicitWidth = 439
        object pnPostgresServidor: TPanel
          Left = 0
          Top = 0
          Width = 572
          Height = 57
          Align = alTop
          ParentBackground = False
          TabOrder = 0
          ExplicitWidth = 435
          DesignSize = (
            572
            57)
          object Servidor: TLabel
            Left = 8
            Top = 8
            Width = 40
            Height = 13
            Caption = 'Servidor'
          end
          object edPostgresServidor: TEdit
            Left = 8
            Top = 27
            Width = 554
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            Text = 'localhost'
            OnChange = _edChange
            ExplicitWidth = 417
          end
        end
        object pnPostgresUsuario: TPanel
          Left = 0
          Top = 114
          Width = 572
          Height = 57
          Align = alTop
          ParentBackground = False
          TabOrder = 2
          ExplicitWidth = 435
          DesignSize = (
            572
            57)
          object lbPostgresUsuario: TLabel
            Left = 8
            Top = 8
            Width = 36
            Height = 13
            Caption = 'Usuario'
          end
          object edPostgresUsuario: TEdit
            Left = 8
            Top = 27
            Width = 554
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            Text = 'postgres'
            OnChange = _edChange
            ExplicitWidth = 417
          end
        end
        object pnPostgresSenha: TPanel
          Left = 0
          Top = 171
          Width = 572
          Height = 57
          Align = alTop
          ParentBackground = False
          TabOrder = 3
          ExplicitWidth = 435
          DesignSize = (
            572
            57)
          object lbPostgresSenha: TLabel
            Left = 8
            Top = 8
            Width = 30
            Height = 13
            Caption = 'Senha'
          end
          object edPostgresSenha: TEdit
            Left = 8
            Top = 27
            Width = 554
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            PasswordChar = '*'
            TabOrder = 0
            Text = 'Maker@1'
            OnChange = _edChange
            ExplicitWidth = 417
          end
        end
        object pnPostgresBanco: TPanel
          Left = 0
          Top = 57
          Width = 572
          Height = 57
          Align = alTop
          ParentBackground = False
          TabOrder = 1
          ExplicitWidth = 435
          DesignSize = (
            572
            57)
          object lbPostgresBanco: TLabel
            Left = 8
            Top = 8
            Width = 29
            Height = 13
            Caption = 'Banco'
          end
          object edPostgresBanco: TEdit
            Left = 8
            Top = 27
            Width = 554
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            Text = 'MAKER'
            OnChange = _edChange
            ExplicitWidth = 417
          end
        end
      end
      object dbgPostgres: TDBGrid
        Left = 0
        Top = 243
        Width = 576
        Height = 69
        Align = alBottom
        DataSource = DataMain.dsPostgres
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object staPostgres: TStatusBar
        Left = 0
        Top = 377
        Width = 576
        Height = 19
        Panels = <
          item
            Width = 50
          end>
        ExplicitWidth = 439
      end
      object pnPostgres: TPanel
        Left = 0
        Top = 312
        Width = 576
        Height = 65
        Align = alBottom
        TabOrder = 2
        ExplicitWidth = 439
        object btPostgresPostAndApply: TButton
          Left = 8
          Top = 10
          Width = 89
          Height = 25
          Caption = 'Post and Apply'
          TabOrder = 0
          OnClick = btPostgresPostAndApplyClick
        end
        object edPostgresPostAndApply: TEdit
          Left = 8
          Top = 38
          Width = 89
          Height = 21
          TabOrder = 1
          Text = '100'
          OnChange = _edChange
        end
        object btPostgresApplyAfterPost: TButton
          Left = 103
          Top = 10
          Width = 89
          Height = 25
          Caption = 'Apply after Post'
          TabOrder = 2
          OnClick = btPostgresApplyAfterPostClick
        end
        object edPostgresApplyAfterPost: TEdit
          Left = 103
          Top = 38
          Width = 89
          Height = 21
          TabOrder = 3
          Text = '100'
          OnChange = _edChange
        end
        object btPostgresInsertAnalogic: TButton
          Left = 198
          Top = 10
          Width = 89
          Height = 25
          Caption = 'Insert Analogic'
          TabOrder = 4
          OnClick = btPostgresInsertAnalogicClick
        end
        object edPostgresInsertAnalogic: TEdit
          Left = 198
          Top = 38
          Width = 89
          Height = 21
          TabOrder = 5
          Text = '100'
          OnChange = _edChange
        end
        object edPostgresInsertAnalogic2: TEdit
          Left = 293
          Top = 38
          Width = 89
          Height = 21
          TabOrder = 6
          Text = '100'
          OnChange = _edChange
        end
        object btPostgresInsertAnalogic2: TButton
          Left = 293
          Top = 10
          Width = 89
          Height = 25
          Caption = 'Insert Analogic 2'
          TabOrder = 7
          OnClick = btPostgresInsertAnalogic2Click
        end
      end
    end
    object tsMssql: TTabSheet
      Caption = 'SQL Server'
      ImageIndex = 1
      ExplicitWidth = 439
      object sbMssql: TScrollBox
        Left = 0
        Top = 0
        Width = 576
        Height = 243
        Align = alClient
        Color = clGray
        ParentColor = False
        TabOrder = 0
        ExplicitWidth = 439
        object pnMssqlBanco: TPanel
          Left = 0
          Top = 57
          Width = 572
          Height = 57
          Align = alTop
          ParentBackground = False
          TabOrder = 1
          ExplicitLeft = -1
          ExplicitTop = 54
          DesignSize = (
            572
            57)
          object lbMssqlBanco: TLabel
            Left = 8
            Top = 8
            Width = 29
            Height = 13
            Caption = 'Banco'
          end
          object edMssqlBanco: TEdit
            Left = 8
            Top = 27
            Width = 554
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            Text = 'DEBUG'
            OnChange = _edChange
            ExplicitWidth = 417
          end
        end
        object pnMssqlSenha: TPanel
          Left = 0
          Top = 171
          Width = 572
          Height = 57
          Align = alTop
          ParentBackground = False
          TabOrder = 3
          ExplicitWidth = 435
          DesignSize = (
            572
            57)
          object lbMssqlSenha: TLabel
            Left = 8
            Top = 8
            Width = 30
            Height = 13
            Caption = 'Senha'
          end
          object edMssqlSenha: TEdit
            Left = 8
            Top = 27
            Width = 554
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            PasswordChar = '*'
            TabOrder = 0
            Text = 'ABcd!@34'
            OnChange = _edChange
            ExplicitWidth = 417
          end
        end
        object pnMssqlUsuario: TPanel
          Left = 0
          Top = 114
          Width = 572
          Height = 57
          Align = alTop
          ParentBackground = False
          TabOrder = 2
          ExplicitWidth = 435
          DesignSize = (
            572
            57)
          object lbMssqlUsuario: TLabel
            Left = 8
            Top = 8
            Width = 36
            Height = 13
            Caption = 'Usuario'
          end
          object edMssqlUsuario: TEdit
            Left = 8
            Top = 27
            Width = 554
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            Text = 'sa'
            OnChange = _edChange
            ExplicitWidth = 417
          end
        end
        object pnMssqlServidor: TPanel
          Left = 0
          Top = 0
          Width = 572
          Height = 57
          Align = alTop
          ParentBackground = False
          TabOrder = 0
          ExplicitWidth = 435
          DesignSize = (
            572
            57)
          object lbMssqlServidor: TLabel
            Left = 8
            Top = 8
            Width = 40
            Height = 13
            Caption = 'Servidor'
          end
          object edMssqlServidor: TEdit
            Left = 8
            Top = 27
            Width = 554
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            Text = 'localhost'
            OnChange = _edChange
            ExplicitWidth = 417
          end
        end
      end
      object dbgMssql: TDBGrid
        Left = 0
        Top = 243
        Width = 576
        Height = 69
        Align = alBottom
        DataSource = DataMain.dsMssql
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object staMssql: TStatusBar
        Left = 0
        Top = 377
        Width = 576
        Height = 19
        Panels = <
          item
            Width = 50
          end>
        ExplicitWidth = 439
      end
      object pnMssql: TPanel
        Left = 0
        Top = 312
        Width = 576
        Height = 65
        Align = alBottom
        TabOrder = 2
        ExplicitTop = 306
        object btMssqlPostAndApply: TButton
          Left = 8
          Top = 7
          Width = 89
          Height = 25
          Caption = 'Post and Apply'
          TabOrder = 0
          OnClick = btMssqlPostAndApplyClick
        end
        object edMssqlPostAndApply: TEdit
          Left = 8
          Top = 38
          Width = 89
          Height = 21
          TabOrder = 1
          Text = '100'
          OnChange = _edChange
        end
        object btMssqlApplyAfterPost: TButton
          Left = 103
          Top = 10
          Width = 89
          Height = 25
          Caption = 'Apply after Post'
          TabOrder = 2
          OnClick = btMssqlApplyAfterPostClick
        end
        object edMssqlApplyAfterPost: TEdit
          Left = 103
          Top = 38
          Width = 89
          Height = 21
          TabOrder = 3
          Text = '100'
          OnChange = _edChange
        end
        object edMssqlInsertAnalogic: TEdit
          Left = 198
          Top = 38
          Width = 89
          Height = 21
          TabOrder = 4
          Text = '100'
          OnChange = _edChange
        end
        object btMssqlInsertAnalogic: TButton
          Left = 198
          Top = 10
          Width = 89
          Height = 25
          Caption = 'Insert Analogic'
          TabOrder = 5
          OnClick = btMssqlInsertAnalogicClick
        end
        object btMssqlInsertAnalogic2: TButton
          Left = 293
          Top = 10
          Width = 89
          Height = 25
          Caption = 'Insert Analogic 2'
          TabOrder = 6
          OnClick = btMssqlInsertAnalogic2Click
        end
        object edMssqlInsertAnalogic2: TEdit
          Left = 293
          Top = 38
          Width = 89
          Height = 21
          TabOrder = 7
          Text = '100'
          OnChange = _edChange
        end
        object btXmlSave: TButton
          Left = 388
          Top = 6
          Width = 75
          Height = 25
          Caption = 'XML Save'
          TabOrder = 8
          OnClick = btXmlSaveClick
        end
        object btXmlLoad: TButton
          Left = 388
          Top = 34
          Width = 75
          Height = 25
          Caption = 'XML Load'
          TabOrder = 9
          OnClick = btXmlLoadClick
        end
      end
    end
  end
end
