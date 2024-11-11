object MenuMainData: TMenuMainData
  OldCreateOrder = False
  Height = 361
  Width = 584
  object conMain: TSQLConnection
    Left = 24
    Top = 8
  end
  object dtsMain: TDataSource
    DataSet = qryMain
    Enabled = False
    Left = 24
    Top = 104
  end
  object qryMain: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = conMain
    Left = 24
    Top = 56
  end
end
