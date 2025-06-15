object MenuMainForm: TMenuMainForm
  Left = 200
  Top = 120
  Width = 600
  Height = 400
  Caption = 'MenuMainForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object vleData: TValueListEditor
    Left = 0
    Top = 0
    Width = 584
    Height = 248
    Align = alClient
    TabOrder = 0
    TitleCaptions.Strings = (
      'PID'
      'Executable')
    ColWidths = (
      95
      483)
  end
  object sbFooter: TStatusBar
    Left = 0
    Top = 342
    Width = 584
    Height = 19
    Panels = <
      item
        Width = 100
      end
      item
        Width = 135
      end
      item
        Width = 100
      end
      item
        Alignment = taRightJustify
        Width = 50
      end>
  end
  object pnFooter: TPanel
    Left = 0
    Top = 301
    Width = 584
    Height = 41
    Align = alBottom
    TabOrder = 2
    object pnFooter03: TPanel
      Left = 480
      Top = 1
      Width = 103
      Height = 39
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 2
      object btClose: TBitBtn
        Left = 8
        Top = 8
        Width = 89
        Height = 25
        Caption = 'Close (ESC)'
        TabOrder = 0
        OnClick = btCloseClick
      end
    end
    object pnFooter02: TPanel
      Left = 471
      Top = 1
      Width = 9
      Height = 39
      Align = alRight
      BevelOuter = bvNone
      Color = clFuchsia
      TabOrder = 1
      Visible = False
    end
    object pnFooter01: TPanel
      Left = 1
      Top = 1
      Width = 470
      Height = 39
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object btRun: TBitBtn
        Left = 8
        Top = 8
        Width = 89
        Height = 25
        Caption = 'Run (F5)'
        TabOrder = 0
        OnClick = btRunClick
      end
      object btNotepadBegin: TBitBtn
        Left = 104
        Top = 8
        Width = 89
        Height = 25
        Caption = 'Notepad Begin'
        TabOrder = 1
        OnClick = btNotepadBeginClick
      end
      object btNotepadEnd: TBitBtn
        Left = 200
        Top = 8
        Width = 89
        Height = 25
        Caption = 'Notepad End'
        TabOrder = 2
        OnClick = btNotepadEndClick
      end
    end
  end
  object pnNotepad: TPanel
    Left = 0
    Top = 248
    Width = 584
    Height = 53
    Align = alBottom
    TabOrder = 1
    object pnNotepad03: TPanel
      Left = 480
      Top = 1
      Width = 103
      Height = 51
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 2
      Visible = False
    end
    object pnNotepad02: TPanel
      Left = 471
      Top = 1
      Width = 9
      Height = 51
      Align = alRight
      BevelOuter = bvNone
      Color = clFuchsia
      TabOrder = 1
      Visible = False
    end
    object pnNotepad01: TPanel
      Left = 1
      Top = 1
      Width = 470
      Height = 51
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        470
        51)
      object lbNotepadPID: TLabel
        Left = 8
        Top = 8
        Width = 18
        Height = 13
        Caption = 'PID'
      end
      object lbNotepadExecutable: TLabel
        Left = 136
        Top = 8
        Width = 53
        Height = 13
        Caption = 'Executable'
      end
      object edNotepadPID: TEdit
        Left = 8
        Top = 24
        Width = 121
        Height = 21
        ReadOnly = True
        TabOrder = 0
      end
      object edNotepadExecutable: TEdit
        Left = 136
        Top = 22
        Width = 321
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        ReadOnly = True
        TabOrder = 1
      end
    end
  end
  object acAction: TActionList
    Left = 440
    Top = 304
    object acClose: TAction
      Caption = 'acClose'
      ShortCut = 27
      OnExecute = acCloseExecute
    end
    object acRun: TAction
      Caption = 'acRun'
      ShortCut = 116
      OnExecute = acRunExecute
    end
  end
end
