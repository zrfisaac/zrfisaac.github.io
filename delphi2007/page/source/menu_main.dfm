object MenuMain: TMenuMain
  Left = 0
  Top = 0
  Caption = 'MenuMain'
  ClientHeight = 361
  ClientWidth = 584
  Color = clBtnFace
  Constraints.MinHeight = 200
  Constraints.MinWidth = 300
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = miMenu
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnBack: TPanel
    Left = 0
    Top = 0
    Width = 584
    Height = 342
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object pcBack: TPageControl
      Left = 0
      Top = 0
      Width = 584
      Height = 342
      ActivePage = tsMain
      Align = alClient
      TabOrder = 0
      object tsMain: TTabSheet
        Caption = 'Main'
        object pnMain: TPanel
          Left = 0
          Top = 0
          Width = 576
          Height = 314
          Align = alClient
          BevelOuter = bvNone
          ParentBackground = False
          TabOrder = 0
          object sbMain: TScrollBox
            Left = 0
            Top = 0
            Width = 576
            Height = 273
            Align = alClient
            Color = clGray
            ParentColor = False
            TabOrder = 0
            object pnMainSample: TPanel
              Left = 0
              Top = 0
              Width = 572
              Height = 57
              Align = alTop
              ParentBackground = False
              TabOrder = 0
              DesignSize = (
                572
                57)
              object lbMainSample: TLabel
                Left = 8
                Top = 8
                Width = 34
                Height = 13
                Caption = 'Sample'
              end
              object edMainSample: TEdit
                Left = 8
                Top = 27
                Width = 545
                Height = 21
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 0
              end
            end
          end
          object pnMainFooter: TPanel
            Left = 0
            Top = 273
            Width = 576
            Height = 41
            Align = alBottom
            TabOrder = 1
            object pnMainFooter03: TPanel
              Left = 440
              Top = 1
              Width = 135
              Height = 39
              Align = alRight
              BevelOuter = bvNone
              TabOrder = 0
            end
            object pnMainFooter02: TPanel
              Left = 432
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
            object pnMainFooter01: TPanel
              Left = 1
              Top = 1
              Width = 431
              Height = 39
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 2
              object btMainRun: TButton
                Left = 4
                Top = 6
                Width = 75
                Height = 25
                Caption = 'Run'
                TabOrder = 0
              end
            end
          end
        end
      end
    end
  end
  object sbFooter: TStatusBar
    Left = 0
    Top = 342
    Width = 584
    Height = 19
    Panels = <
      item
        Width = 80
      end
      item
        Width = 50
      end>
  end
  object miMenu: TMainMenu
    Left = 552
    object miHelp: TMenuItem
      Caption = 'Help'
      object miAbout: TMenuItem
        Action = acAbout
      end
    end
  end
  object acAction: TActionList
    Left = 552
    Top = 32
    object acAbout: TAction
      Category = 'Help'
      Caption = 'About'
      ShortCut = 112
      OnExecute = acAboutExecute
    end
  end
end
