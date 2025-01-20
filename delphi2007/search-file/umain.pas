// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io

// # [ delphi2007 ]
unit umain;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  ExtCtrls,
  Buttons;

type
  TfrmMain = class(TForm)
    pnBack: TPanel;
    meText: TMemo;
    pnFooter: TPanel;
    btRun: TBitBtn;
    procedure btRunClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

function fnSearchFile(_pDirectory: string = '.'; _pFilePattern: string = '*'): TStrings;
var
  _vSearchRec: TSearchRec;
  _vReturn: TStrings;
begin
  _pDirectory := IncludeTrailingPathDelimiter(ExpandFileName(_pDirectory));
  _vReturn := TStringList.Create;
  if FindFirst(_pDirectory + _pFilePattern, faAnyFile, _vSearchRec) = 0 then
  begin
    try
      repeat
        if (_vSearchRec.Attr and faDirectory) = 0 then
          _vReturn.Add(_pDirectory + _vSearchRec.Name)
      until FindNext(_vSearchRec) <> 0;
    finally
      FindClose(_vSearchRec);
    end;  
  end;
  Result := _vReturn;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  Self.Caption := Application.Title;
end;

procedure TfrmMain.btRunClick(Sender: TObject);
begin
  Self.meText.Lines := fnSearchFile;
end;

end.
