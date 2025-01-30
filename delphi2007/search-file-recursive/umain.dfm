object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'frmMain'
  ClientHeight = 361
  ClientWidth = 584
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
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
    object meText: TMemo
      Left = 0
      Top = 0
      Width = 584
      Height = 320
      Align = alClient
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 0
      WantTabs = True
      WordWrap = False
    end
    object pnFooter: TPanel
      Left = 0
      Top = 320
      Width = 584
      Height = 41
      Align = alBottom
      TabOrder = 1
      object btRun: TBitBtn
        Left = 8
        Top = 6
        Width = 75
        Height = 25
        Caption = 'Run'
        TabOrder = 0
        OnClick = btRunClick
      end
    end
  end
end
