inherited ModelPageForm: TModelPageForm
  Height = 399
  Caption = 'ModelPageForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnBack: TPanel
    Height = 360
    inherited pnTitle: TPanel
      Caption = ''
      TabOrder = 2
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
    object pcPage: TPageControl
      Left = 0
      Top = 33
      Width = 584
      Height = 286
      Align = alClient
      TabOrder = 0
    end
    object pnFooter: TPanel
      Left = 0
      Top = 319
      Width = 584
      Height = 41
      Align = alBottom
      TabOrder = 1
      object pnFooter03: TPanel
        Left = 480
        Top = 1
        Width = 103
        Height = 39
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 0
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
        TabOrder = 2
      end
    end
  end
end
