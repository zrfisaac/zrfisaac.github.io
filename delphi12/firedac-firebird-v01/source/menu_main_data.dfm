object MenuMainData: TMenuMainData
  OnCreate = DataModuleCreate
  Height = 361
  Width = 584
  object conMain: TFDConnection
    Params.Strings = (
      'DriverID=FB'
      'User_Name=sysdba'
      'Password=masterkey')
    Transaction = traMain
    Left = 40
    Top = 16
  end
  object traMain: TFDTransaction
    Connection = conMain
    Left = 40
    Top = 72
  end
  object qryMain: TFDQuery
    Connection = conMain
    Transaction = traMain
    SQL.Strings = (
      'SELECT * FROM PEOPLE;')
    Left = 40
    Top = 128
  end
  object dtsMain: TDataSource
    DataSet = qryMain
    Left = 40
    Top = 184
  end
end
