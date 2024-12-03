object DataMain: TDataMain
  OldCreateOrder = False
  Height = 208
  Width = 292
  object sdsPostgres: TSimpleDataSet
    Aggregates = <>
    Connection = conPostgres
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 32
    Top = 56
  end
  object conPostgres: TSQLConnection
    LoginPrompt = False
    Left = 32
    Top = 8
  end
  object dsPostgres: TDataSource
    DataSet = sdsPostgres
    Left = 32
    Top = 104
  end
  object conMssql: TSQLConnection
    LoginPrompt = False
    Left = 112
    Top = 8
  end
  object dsMssql: TDataSource
    DataSet = sdsMssql
    Left = 112
    Top = 104
  end
  object sdsMssql: TSimpleDataSet
    Aggregates = <>
    Connection = conMssql
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 112
    Top = 56
  end
  object qryPostgres: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = conPostgres
    Left = 32
    Top = 152
  end
  object qryMssql: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = conMssql
    Left = 112
    Top = 152
  end
  object cdsData: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 192
    Top = 8
  end
end
