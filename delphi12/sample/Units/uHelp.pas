// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires Santana
// # - email : zrfisaac@gmail.com
// # - site : zrfisaac.github.io

// # [ delphi12 ]
unit uHelp;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.Menus,
  Vcl.StdCtrls;

type
  ELanguage = (
    langEnglish,
    langJapanese,
    langPortuguese,
    langSpanish
  );

var
  vTranslation: string;
  vLanguage: ELanguage;

procedure fnTranslate(_pObject: TControl);
function fnTranslationPath: string;
function fnTranslation: TStrings;
function fnTranslationEN: string;
function fnTranslationES: string;
function fnTranslationPT: string;
function fnTranslationJA: string;

function Pass: string;

implementation

var
  vTranslationFile: TStrings;

procedure fnTranslate(_pObject: TControl);
var
  _vB0,_vB1: Boolean;
  _vI0,_vI1: Integer;
  _vTranslation: TStrings;
  _vTypes: array of TClass;
begin
  _vTranslation := fnTranslation;
  _vTypes := [
     TButton
    ,TCheckBox
    ,TGroupBox
    ,TLabel
    ,TMainMenu
    ,TMenuItem
    ,TPanel
    ,TRadioButton
  ];
  _vB0 := False;
  for _vI0 := 0 to Length(_vTypes)-1 do
    if (_pObject is _vTypes[_vI0]) then
      _vB0 := True;
  if (_vB0) then
    if (_pObject.ClassName = TMainMenu.ClassName) then
      Pass
    else if (_pObject.ClassName = TMenuItem.ClassName) then
    begin
      if Pos('al_', TMenuItem(_pObject).Caption) > 0 then
        if not(_vTranslation.Values[TMenuItem(_pObject).Caption] = '') then
          TMenuItem(_pObject).Caption := _vTranslation.Values[TMenuItem(_pObject).Caption];
    end
    else
      if Pos('al_', TLabel(_pObject).Caption) > 0 then
        if not(_vTranslation.Values[TLabel(_pObject).Caption] = '') then
          //Pass;
          TLabel(_pObject).Caption := _vTranslation.Values[TLabel(_pObject).Caption];
  for _vI0 := 0 to TWinControl(_pObject).ControlCount - 1 do
  begin
    _vB1 := False;
    for _vI1 := 0 to Length(_vTypes)-1 do
      if (_pObject is _vTypes[_vI1]) then
        _vB1 := True;
    if (_vB1) then
      fnTranslate(TWinControl(TWinControl(_pObject).Controls[_vI0]));
  end;
  if _pObject is TForm then
    if Assigned(TForm(_pObject).Menu) then
      //for _vI0 := Low to High do
      //fnTranslate(TWinControl(TForm(_pObject).Menu));

end;

function fnTranslation: TStrings;
begin
  if not(Assigned(vTranslationFile)) then
  begin
    vTranslationFile := TStringList.Create;
    if FileExists(fnTranslationPath) then
      vTranslationFile.LoadFromFile(fnTranslationPath);
  end;
  Result := vTranslationFile;
end;

function fnTranslationPath: string;
begin
  case vLanguage of
    langEnglish:    Result := fnTranslationEN;
    langSpanish:    Result := fnTranslationES;
    langPortuguese: Result := fnTranslationPT;
    langJapanese:   Result := fnTranslationJA;
  end;
end;

function fnTranslationEN: string;
var
  vFile: string;
  vPath: string;
begin
  vFile := 'TranslationEN.lang';
  vPath := ExtractFileDir(ExcludeTrailingPathDelimiter(vTranslation)) + '\' + vFile;
  if FileExists(vPath) then
    Result := vPath;
  vPath := vTranslation + '\' + vFile;
  if FileExists(vPath) then
    Result := vPath;
end;

function fnTranslationES: string;
var
  vFile: string;
  vPath: string;
begin
  vFile := 'TranslationES.lang';
  vPath := ExtractFileDir(ExcludeTrailingPathDelimiter(vTranslation)) + '\' + vFile;
  if FileExists(vPath) then
    Result := vPath;
  vPath := vTranslation + '\' + vFile;
  if FileExists(vPath) then
    Result := vPath;
end;

function fnTranslationPT: string;
var
  vFile: string;
  vPath: string;
begin
  vFile := 'TranslationPT.lang';
  vPath := ExtractFileDir(ExcludeTrailingPathDelimiter(vTranslation)) + '\' + vFile;
  if FileExists(vPath) then
    Result := vPath;
  vPath := vTranslation + '\' + vFile;
  if FileExists(vPath) then
    Result := vPath;
end;

function fnTranslationJA: string;
var
  vFile: string;
  vPath: string;
begin
  vFile := 'TranslationJA.lang';
  vPath := ExtractFileDir(ExcludeTrailingPathDelimiter(vTranslation)) + '\' + vFile;
  if FileExists(vPath) then
    Result := vPath;
  vPath := vTranslation + '\' + vFile;
  if FileExists(vPath) then
    Result := vPath;
end;

function Pass: string;
begin
end;

initialization
  vLanguage := langEnglish;
  vTranslation := ExtractFileDir(ParamStr(0));
end.

