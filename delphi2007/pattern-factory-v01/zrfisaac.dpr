// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io

// # [ delphi2007 ]
program zrfisaac;

{$IFDEF DEBUG}
  {$APPTYPE CONSOLE}
{$ENDIF}

uses
  Forms,
  SysUtils,
  example in 'source\example.pas';

{$R *.res}

var
  APDF: IReport;
  AExcel: IReport;
  ACSV: IReport;

begin
  Application.Initialize;
  try
    // # - begin
    Writeln('# [ begin ]');
    Writeln('# - : Factory Method');
    APDF := TReportFactory.CreateReport('PDF');
    AExcel := TReportFactory.CreateReport('Excel');
    ACSV := TReportFactory.CreateReport('CSV');
    APDF.GenerateReport;
    AExcel.GenerateReport;

    // # - end
    Writeln;
    Writeln('# [ end ]');
  except
    on E:Exception do
    begin
      Writeln(E.Message);
      raise;
    end;
  end;
  Readln;
end.
