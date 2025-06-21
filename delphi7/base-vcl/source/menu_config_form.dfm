inherited MenuConfigForm: TMenuConfigForm
  Caption = 'MenuConfigForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnBack: TPanel
    inherited pnTitle: TPanel
      Caption = 'Menu > Help > Configuration'
      inherited lbTitle: TLabel
        Caption = 'Menu > Help > Configuration'
      end
    end
    inherited pcPage: TPageControl
      ActivePage = tsMain
      object tsMain: TTabSheet
        Caption = 'Main'
      end
    end
  end
end
