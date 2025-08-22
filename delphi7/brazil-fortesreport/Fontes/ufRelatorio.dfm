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
  PixelsPerInch = 96
  TextHeight = 13
  object rlRelatorio: TRLReport
    Left = 8
    Top = 8
    Width = 794
    Height = 1123
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ShowProgress = False
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
  object RLDraftFilter: TRLDraftFilter
    Left = 144
    Top = 16
  end
end
