object ModuleMain: TModuleMain
  Height = 451
  Width = 730
  PixelsPerInch = 120
  object conMain: TFDConnection
    Transaction = traMain
    Left = 50
    Top = 20
  end
  object traMain: TFDTransaction
    Connection = conMain
    Left = 50
    Top = 90
  end
end
