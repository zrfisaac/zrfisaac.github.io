// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires Santana
// # - email : zrfisaac@gmail.com
// # - site : zrfisaac.github.io

// # [ delphi7 ]
program zrfisaac;

{$APPTYPE CONSOLE}

uses
  Windows, Forms, SysUtils, Classes, ActiveX, ComObj, Variants;

{$R *.res}

function GetMacAddressWMI: string;
const
  wbemFlagForwardOnly = $00000020;
var
  FSWbemLocator: OLEVariant;
  FWMIService:   OLEVariant;
  FWbemObjectSet: OLEVariant;
  FWbemObject:    OLEVariant;
  oEnum:          IEnumVariant;
  iValue:         LongWord;
begin
  Result := '';
  // This initializes the COM library for the calling thread
  CoInitialize(nil);
  try
    FSWbemLocator := CreateOleObject('WbemScripting.SWbemLocator');
    FWMIService   := FSWbemLocator.ConnectServer('.', 'root\cimv2', '', '');
    // Query for network adapters that are IP-enabled
    FWbemObjectSet := FWMIService.ExecQuery('SELECT * FROM Win32_NetworkAdapterConfiguration WHERE IPEnabled = True', 'WQL', wbemFlagForwardOnly);

    oEnum         := IUnknown(FWbemObjectSet._NewEnum) as IEnumVariant;
    while oEnum.Next(1, FWbemObject, iValue) = 0 do
    begin
      // We just grab the first one we find.
      Result := VarToStr(FWbemObject.MACAddress);
      FWbemObject := unassigned; // free the object
      if Result <> '' then
        Break; // Exit loop once we have a MAC
    end;
  finally
    // Uninitialize the COM library
    CoUninitialize;
  end;
end;

var
  // # : Finish
  vFinishMessage: String = '';

begin
  // # : Start
  // {
  Writeln('# : Start');
  Application.Initialize;
  Application.Title := 'ZRFISAAC';
  // }

  Writeln(GetMacAddressWMI);

  // # : Finish
  // {
  Writeln('# : Finish');
  if not(vFinishMessage = '') then
    Writeln(Format('# . - Message : %s',[vFinishMessage]));
  Readln;
  // }
end.

