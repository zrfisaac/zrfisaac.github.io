object FrmRelatorio: TFrmRelatorio
  Left = 200
  Top = 140
  Width = 840
  Height = 400
  Caption = 'FrmRelatorio'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object rlRelatorioBase: TRLReport
    Left = 8
    Top = 8
    Width = 794
    Height = 1123
    DataSource = dtsBase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ShowProgress = False
    object RLGroup1: TRLGroup
      Left = 38
      Top = 38
      Width = 718
      Height = 99
      DataFields = 'EMPRESA'
      AfterPrint = RLGroup1AfterPrint
      object rbLinha: TRLBand
        Left = 0
        Top = 32
        Width = 718
        Height = 16
        object dbBaseNome: TRLDBText
          Left = 137
          Top = 0
          Width = 511
          Height = 16
          Align = faClient
          AutoSize = False
          DataField = 'PRODUTO'
          DataSource = dtsBase
        end
        object RLDBText2: TRLDBText
          Left = 648
          Top = 0
          Width = 70
          Height = 16
          Align = faRight
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'VALOR'
          DataSource = dtsBase
        end
        object RLLabel1: TRLLabel
          Left = 0
          Top = 0
          Width = 137
          Height = 16
          Align = faLeft
          AutoSize = False
          Caption = ' '
        end
      end
      object RLBand2: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 16
        BandType = btHeader
        object RLLabel2: TRLLabel
          Left = 0
          Top = 0
          Width = 58
          Height = 16
          Align = faLeft
          AutoSize = False
          Caption = 'Empresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBText3: TRLDBText
          Left = 58
          Top = 0
          Width = 660
          Height = 16
          Align = faClient
          AutoSize = False
          DataField = 'EMPRESA'
          DataSource = dtsBase
        end
      end
      object RLBand4: TRLBand
        Left = 0
        Top = 16
        Width = 718
        Height = 16
        BandType = btHeader
        object RLLabel3: TRLLabel
          Left = 137
          Top = 0
          Width = 58
          Height = 16
          Align = faLeft
          AutoSize = False
          Caption = 'Produto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel4: TRLLabel
          Left = 0
          Top = 0
          Width = 137
          Height = 16
          Align = faLeft
          AutoSize = False
          Caption = ' '
        end
        object RLLabel5: TRLLabel
          Left = 195
          Top = 0
          Width = 454
          Height = 16
          Align = faLeft
          AutoSize = False
          Caption = ' '
        end
        object RLLabel6: TRLLabel
          Left = 649
          Top = 0
          Width = 58
          Height = 16
          Align = faLeft
          AutoSize = False
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
    end
    object RLSubDetail1: TRLSubDetail
      Left = 38
      Top = 137
      Width = 718
      Height = 64
      DataSource = dtsTotal
      object RLBand3: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 16
        object RLDBText4: TRLDBText
          Left = 0
          Top = 0
          Width = 718
          Height = 16
          Align = faClient
          AutoSize = False
          DataField = 'COR'
          DataSource = dtsTotal
        end
      end
    end
  end
  object rlRelatorioTotal: TRLReport
    Left = 8
    Top = 230
    Width = 794
    Height = 1123
    DataSource = dtsTotal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ShowProgress = False
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 16
      object RLDBText1: TRLDBText
        Left = 0
        Top = 0
        Width = 718
        Height = 16
        Align = faClient
        AutoSize = False
        DataField = 'COR'
        DataSource = dtsTotal
      end
    end
  end
  object RLRichFilter: TRLRichFilter
    DisplayName = 'Formato RichText'
    Left = 16
    Top = 16
  end
  object RLHTMLFilter: TRLHTMLFilter
    DocumentStyle = dsCSS2
    DisplayName = 'P'#225'gina da Web'
    Left = 48
    Top = 16
  end
  object RLPDFFilter: TRLPDFFilter
    DocumentInfo.Creator = 'FortesReport v3.23 \251 Copyright '#169' 1999-2004 Fortes Inform'#225'tica'
    ViewerOptions = []
    FontEncoding = feNoEncoding
    DisplayName = 'Documento PDF'
    Left = 80
    Top = 16
  end
  object RLXLSFilter: TRLXLSFilter
    DisplayName = 'Planilha Excel'
    Left = 112
    Top = 16
  end
  object qryBase: TQuery
    DatabaseName = 'BDE'
    SQL.Strings = (
      
        '          SELECT '#39#39' AS EMPRESA, '#39#39' AS PRODUTO, 0.0 AS VALOR WHER' +
        'E 0 <> 0'
      'UNION ALL SELECT '#39'Empresa 1'#39', '#39'Produto 1'#39', 10.00'
      'UNION ALL SELECT '#39'Empresa 2'#39', '#39'Produto 2'#39', 20.00'
      'UNION ALL SELECT '#39'Empresa 3'#39', '#39'Produto 3'#39', 30.00'
      'UNION ALL SELECT '#39'Empresa 4'#39', '#39'Produto 4'#39', 40.00'
      'UNION ALL SELECT '#39'Empresa 5'#39', '#39'Produto 5'#39', 50.00')
    Left = 208
    Top = 16
  end
  object bdeConexao: TDatabase
    DatabaseName = 'BDE'
    LoginPrompt = False
    SessionName = 'Default'
    Left = 176
    Top = 16
  end
  object RLDraftFilter: TRLDraftFilter
    Left = 144
    Top = 16
  end
  object dtsBase: TDataSource
    DataSet = qryBase
    Left = 240
    Top = 16
  end
  object qryTotal: TQuery
    DatabaseName = 'BDE'
    SQL.Strings = (
      
        '          SELECT '#39#39' AS EMPRESA, '#39#39' AS PRODUTO, 0.0 AS VALOR WHER' +
        'E 0 <> 0'
      'UNION ALL SELECT '#39'Empresa 1'#39', '#39'Produto 1'#39', 10.00'
      'UNION ALL SELECT '#39'Empresa 2'#39', '#39'Produto 2'#39', 20.00'
      'UNION ALL SELECT '#39'Empresa 3'#39', '#39'Produto 3'#39', 30.00'
      'UNION ALL SELECT '#39'Empresa 4'#39', '#39'Produto 4'#39', 40.00'
      'UNION ALL SELECT '#39'Empresa 5'#39', '#39'Produto 5'#39', 50.00')
    Left = 272
    Top = 16
  end
  object dtsTotal: TDataSource
    DataSet = qryTotal
    Left = 304
    Top = 16
  end
end
