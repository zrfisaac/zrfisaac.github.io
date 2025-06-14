object ModelBaseForm: TModelBaseForm
  Left = 200
  Top = 120
  Width = 600
  Height = 400
  Caption = 'ModelBaseForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnBack: TPanel
    Left = 0
    Top = 0
    Width = 584
    Height = 361
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object pnTitle: TPanel
      Left = 0
      Top = 0
      Width = 584
      Height = 33
      Align = alTop
      TabOrder = 0
      object imIcon: TImage
        Left = 1
        Top = 1
        Width = 32
        Height = 31
        Align = alLeft
        Center = True
      end
      object imVoid: TImage
        Left = 33
        Top = 1
        Width = 12
        Height = 31
        Align = alLeft
      end
      object lbTitle: TLabel
        Left = 45
        Top = 1
        Width = 538
        Height = 31
        Align = alClient
        Caption = 'lbTitle'
        Layout = tlCenter
      end
    end
  end
end
