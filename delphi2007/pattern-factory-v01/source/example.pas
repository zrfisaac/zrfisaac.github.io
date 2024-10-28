// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io

// # [ delphi2007 ]
unit example;

interface

uses
  SysUtils;

type
  IReport = interface
    procedure GenerateReport;
  end;

  TPDFReport = class(TInterfacedObject, IReport)
  public
    procedure GenerateReport; // Implement PDF report generation
  end;

  TExcelReport = class(TInterfacedObject, IReport)
  public
    procedure GenerateReport; // Implement Excel report generation
  end;

  TReportFactory = class
  public
    class function CreateReport(AType: string): IReport;
  end;

implementation

class function TReportFactory.CreateReport(AType: string): IReport;
begin
  if AType = 'PDF' then
    Result := TPDFReport.Create
  else if AType = 'Excel' then
    Result := TExcelReport.Create
  else
    Writeln('Invalid report type : ' + AType);
    //raise Exception.Create('Invalid report type');
end;

{ TPDFReport }

procedure TPDFReport.GenerateReport;
begin
    Writeln('GenerateReport : PDF');
end;

{ TExcelReport }

procedure TExcelReport.GenerateReport;
begin
    Writeln('GenerateReport : Excel');
end;

end.
