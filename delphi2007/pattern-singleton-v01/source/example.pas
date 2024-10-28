// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io

// # [ delphi2007 ]
unit example;

interface

type
  TConfigurationManager = class
  private
    class var FInstance: TConfigurationManager;
    constructor Create;
  public
    class function GetInstance: TConfigurationManager;
    // other methods to manage configuration
  end;

implementation


constructor TConfigurationManager.Create;
begin
  // Initialize settings
end;

class function TConfigurationManager.GetInstance: TConfigurationManager;
begin
  if not Assigned(FInstance) then
    FInstance := TConfigurationManager.Create;
  Result := FInstance;
end;

end.
