object ZRAboutForm: TZRAboutForm
  Left = 200
  Top = 120
  BorderStyle = bsDialog
  Caption = 'About'
  ClientHeight = 161
  ClientWidth = 304
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object pnBack: TPanel
    Left = 0
    Top = 0
    Width = 304
    Height = 161
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
  end
  object acAction: TActionList
    Left = 8
    Top = 8
    object acEscape: TAction
      Caption = 'acEscape'
      ShortCut = 27
      OnExecute = acEscapeExecute
    end
    object acReturn: TAction
      Caption = 'acReturn'
      ShortCut = 13
      OnExecute = acReturnExecute
    end
  end
end
