object ZRFIService: TZRFIService
  OldCreateOrder = False
  DisplayName = 'ZRFIService'
  ServiceStartName = 'ZRFIService'
  OnStart = ServiceStart
  OnStop = ServiceStop
  Left = 200
  Top = 120
  Height = 400
  Width = 600
end
