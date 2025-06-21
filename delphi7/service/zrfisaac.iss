#define AppNome "ZRFISAAC"
#define AppVersao "25.6.15.1"
#define AppAutor "Isaac Caires Santana / zrfisaac.github.io"
#define AppUrl "https://zrfisaac.github.io"

#define ServicoArquivo "zrfisaac.exe"
#define ServicoNome "ZRFISAAC"
#define ServicoDescricao "Isaac Caires Santana / zrfisaac.github.io"

#define LocalBinario "."
#define LocalDestino "{pf}\ZRFISAAC\DEBUG"
#define LocalIcone "."

#define IconePadrao "zrfisaac.ico"

#define SaidaCaminho "."

[Setup]
AppId={{D262DFEC-2416-449F-9508-5DBA4B7A2314}
AppName={#AppNome}
AppVersion={#AppVersao}
AppVerName={#AppNome}
AppPublisher={#AppAutor}
AppPublisherURL={#AppUrl}
AppSupportURL={#AppUrl}
AppUpdatesURL={#AppUrl}
DefaultDirName={#LocalDestino}
OutputDir={#SaidaCaminho}
OutputBaseFilename={#AppNome} {#AppVersao}
Compression=lzma
SolidCompression=yes
ChangesAssociations=yes
CloseApplications=force
SetupIconFile={#LocalIcone}\{#IconePadrao}
UninstallDisplayIcon={#LocalDestino}\{#IconePadrao}

[Dirs]
Name: "{#LocalDestino}"; Permissions: users-full

[Languages]
Name: "brazilianportuguese"; MessagesFile: "compiler:Languages\BrazilianPortuguese.isl"

[Files]
Source: "{#LocalBinario}\{#ServicoArquivo}"; DestDir: "{app}"; BeforeInstall: fnProcessoFinalizar('SallusFTPServico.exe')
Source: "{#LocalIcone}\{#IconePadrao}"; DestDir: "{app}"

[Run]
Filename: {sys}\sc.exe; Parameters: "stop {#ServicoNome}" ; Flags: runhidden
Filename: {sys}\sc.exe; Parameters: "delete {#ServicoNome}" ; Flags: runhidden
Filename: {sys}\sc.exe; Parameters: "create {#ServicoNome} start=auto DisplayName=""{#ServicoNome}"" binPath=""{#LocalDestino}\{#ServicoArquivo}"""; Flags: runhidden
Filename: {sys}\sc.exe; Parameters: "description {#ServicoNome} ""{#ServicoDescricao}"""; Flags: runhidden
Filename: {sys}\sc.exe; Parameters: "start {#ServicoNome}" ; Flags: runhidden

[UninstallRun]
Filename: {sys}\sc.exe; Parameters: "stop {#ServicoNome}" ; Flags: runhidden; RunOnceId: "DelService"
Filename: {sys}\sc.exe; Parameters: "delete {#ServicoNome}" ; Flags: runhidden; RunOnceId: "DelService"

[Code]

procedure fnProcessoFinalizar(Arquivo: String);
var
  Resultado: Integer;
begin
  Exec('taskkill.exe', '/f /im ' + '"' + Arquivo + '"', '', SW_HIDE, ewWaitUntilTerminated, Resultado);
end;
