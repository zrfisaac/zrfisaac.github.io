program Projeto;

uses
  Forms,
  ufPrincipal in 'Fontes\ufPrincipal.pas' {FrmPrincipal},
  udPrincipal in 'Fontes\udPrincipal.pas' {DtmPrincipal: TDataModule},
  ufRelatorio in 'Fontes\ufRelatorio.pas' {FrmRelatorio};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Projeto';
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
