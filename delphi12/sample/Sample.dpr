program Sample;

uses
  Vcl.Forms,
  ufMain in 'Forms\ufMain.pas' {FrmMain},
  udMain in 'DataModules\udMain.pas' {DtmMain: TDataModule},
  uHelp in 'Units\uHelp.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Sample';
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
