object MenuMain: TMenuMain
  Left = 0
  Top = 0
  Caption = 'MenuMain'
  ClientHeight = 242
  ClientWidth = 264
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object sbStatus: TStatusBar
    Left = 0
    Top = 223
    Width = 264
    Height = 19
    BiDiMode = bdLeftToRight
    Panels = <>
    ParentBiDiMode = False
  end
  object sbFundo: TScrollBox
    Left = 0
    Top = 0
    Width = 264
    Height = 223
    Align = alClient
    Color = clGray
    ParentColor = False
    TabOrder = 0
    object pnColorHex: TPanel
      Left = 0
      Top = 96
      Width = 260
      Height = 57
      Align = alTop
      ParentBackground = False
      TabOrder = 2
      DesignSize = (
        260
        57)
      object lbColorHex: TLabel
        Left = 8
        Top = 9
        Width = 47
        Height = 13
        Caption = 'Color Hex'
      end
      object edColorHex: TEdit
        Left = 8
        Top = 28
        Width = 242
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        MaxLength = 6
        TabOrder = 0
        OnDblClick = edColorHexDblClick
        OnKeyUp = edColorHexKeyUp
      end
    end
    object pnColor: TPanel
      Left = 0
      Top = 0
      Width = 260
      Height = 39
      Align = alTop
      BevelOuter = bvLowered
      ParentBackground = False
      TabOrder = 0
      OnDblClick = pnColorDblClick
      ExplicitLeft = -1
      ExplicitTop = 3
    end
    object pnDelphi: TPanel
      Left = 0
      Top = 153
      Width = 260
      Height = 57
      Align = alTop
      ParentBackground = False
      TabOrder = 3
      DesignSize = (
        260
        57)
      object lbDelphi: TLabel
        Left = 8
        Top = 9
        Width = 29
        Height = 13
        Caption = 'Delphi'
      end
      object edDelphi: TEdit
        Left = 8
        Top = 28
        Width = 242
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        MaxLength = 8
        TabOrder = 0
        OnDblClick = edDelphiDblClick
        OnKeyUp = edDelphiKeyUp
      end
    end
    object pnCololBox: TPanel
      Left = 0
      Top = 39
      Width = 260
      Height = 57
      Align = alTop
      ParentBackground = False
      TabOrder = 1
      object lbCololBox: TLabel
        Left = 8
        Top = 9
        Width = 47
        Height = 13
        Caption = 'Color Hex'
      end
      object cbCololBox: TColorBox
        Left = 8
        Top = 28
        Width = 209
        Height = 22
        ItemHeight = 16
        TabOrder = 0
        OnChange = cbCololBoxChange
      end
      object btCololBox: TBitBtn
        Left = 223
        Top = 26
        Width = 27
        Height = 25
        TabOrder = 1
        OnClick = btCololBoxClick
      end
    end
  end
  object dgColor: TColorDialog
    Left = 224
    Top = 8
  end
end
