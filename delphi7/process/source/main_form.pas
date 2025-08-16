unit main_form;

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
  ComCtrls,
  Grids,
  ValEdit,
  ExtCtrls,
  StdCtrls,
  TlHelp32,
  PsAPI,
  ActnList;

type
  TMainForm = class(TForm)
    sbFooter: TStatusBar;
    pnFooter: TPanel;
    pnProcessBack: TPanel;
    spSeparator: TSplitter;
    pnPropertyBack: TPanel;
    pnPropertyTitle: TPanel;
    pnProcessTitle: TPanel;
    vlProcess: TValueListEditor;
    vlProperty: TValueListEditor;
    btRun: TButton;
    acAction: TActionList;
    acRun: TAction;
    btPath: TButton;
    pnMessage: TPanel;
    btGet: TButton;
    procedure FormCreate(Sender: TObject);
    procedure acRunExecute(Sender: TObject);
    procedure btRunClick(Sender: TObject);
    procedure btPathClick(Sender: TObject);
    procedure btGetClick(Sender: TObject);
  public
    procedure fnProcess;
    function fnProcessPath(_pProcessId: DWORD): string;
    procedure fnRun;
    function fnVersion(_pPath, _pValue: string): string;
  end;

var
  MainForm: TMainForm;

implementation

uses
  main_data;

{$R *.dfm}

procedure TMainForm.fnProcess;
var
  _vHandle: THandle;
  _vProcessEntry: TProcessEntry32;
begin
  _vHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  if (_vHandle = INVALID_HANDLE_VALUE) then
    Exit;
  _vProcessEntry.dwSize := SizeOf(_vProcessEntry);
  if Process32First(_vHandle, _vProcessEntry) then
  begin
    repeat
      vlProcess.Values[IntToStr(_vProcessEntry.th32ProcessID)] := _vProcessEntry.szExeFile;
    until not Process32Next(_vHandle, _vProcessEntry);
  end;
  CloseHandle(_vHandle);
end;

procedure TMainForm.fnRun;
begin
  Self.fnProcess;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  // # : - title
  Self.Caption := Application.Title;

  // # : - data
  if not Assigned(MainData) then
    MainData := TMainData.Create(Application);
end;

procedure TMainForm.acRunExecute(Sender: TObject);
begin
  Self.fnRun;
end;

function TMainForm.fnProcessPath(_pProcessId: DWORD): string;
var
  _vHandle: THandle;
  _vPath: array[0..MAX_PATH - 1] of Char;
begin
  Result := '';
  _vHandle := OpenProcess(PROCESS_QUERY_INFORMATION or PROCESS_VM_READ, False, _pProcessId);
  if _vHandle <> 0 then
  begin
    if GetModuleFileNameEx(_vHandle, 0, _vPath, SizeOf(_vPath)) > 0 then
      Result := _vPath;
    CloseHandle(_vHandle);
  end;
end;

procedure TMainForm.btRunClick(Sender: TObject);
begin
  Self.fnRun;
end;

procedure TMainForm.btPathClick(Sender: TObject);
var
  _vProcessId: Integer;
begin
  _vProcessId := -1;
  if (Self.vlProcess.Strings.Count > 0) then
    _vProcessId := StrToIntDef(Self.vlProcess.Strings.Names[Self.vlProcess.Row-1],-1);
  if (_vProcessId >= 0) then
    Self.pnMessage.Caption := fnProcessPath(_vProcessId);
end;

function TMainForm.fnVersion(_pPath, _pValue: string): string;
var
  _vSize: DWORD;
  _vHandle: DWORD;
  _vBuffer: Pointer;
  _vLang: array[0..3] of Word;
  _vSubBlock: string;
  _vValue: PChar;
  _vLen: UINT;
begin
  Result := '';
  _vSize := GetFileVersionInfoSize(PChar(_pPath), _vHandle);
  if _vSize = 0 then Exit;
  GetMem(_vBuffer, _vSize);
  try
    if GetFileVersionInfo(PChar(_pPath), _vHandle, _vSize, _vBuffer) then
    begin
      if VerQueryValue(_vBuffer, '\VarFileInfo\Translation', Pointer(_vValue), _vLen) and (_vLen >= 4) then
      begin
        Move(_vValue^, _vLang, 4);
        _vSubBlock := Format('\StringFileInfo\%.4x%.4x\%s',
          [_vLang[0], _vLang[1], _pValue]);
        if VerQueryValue(_vBuffer, PChar(_vSubBlock), Pointer(_vValue), _vLen) then
          Result := _vValue;
      end;
    end;
  finally
    FreeMem(_vBuffer);
  end;
end;

procedure TMainForm.btGetClick(Sender: TObject);
var
  _vPath: String;
  _vProcessId: Integer;
begin
  Self.vlProperty.Strings.Clear;
  _vProcessId := -1;
  if (Self.vlProcess.Strings.Count > 0) then
    _vProcessId := StrToIntDef(Self.vlProcess.Strings.Names[Self.vlProcess.Row-1],-1);
  if (_vProcessId >= 0) then
  begin
    _vPath := fnProcessPath(_vProcessId);
    Self.vlProperty.Strings.Clear;
    if not(_vPath = '') then
    begin
      Self.vlProperty.InsertRow('CompanyName',     Self.fnVersion(_vPath, 'CompanyName'), True);
      Self.vlProperty.InsertRow('InternalName',    Self.fnVersion(_vPath, 'InternalName'), True);
      Self.vlProperty.InsertRow('FileDescription', Self.fnVersion(_vPath, 'FileDescription'), True);
      Self.vlProperty.InsertRow('LegalCopyright',  Self.fnVersion(_vPath, 'LegalCopyright'), True);
      Self.vlProperty.InsertRow('LegalTrademarks', Self.fnVersion(_vPath, 'LegalTrademarks'), True);
      Self.vlProperty.InsertRow('OriginalFilename',Self.fnVersion(_vPath, 'OriginalFilename'), True);
      Self.vlProperty.InsertRow('ProductName',     Self.fnVersion(_vPath, 'ProductName'), True);
      Self.vlProperty.InsertRow('Comments',        Self.fnVersion(_vPath, 'Comments'), True);
    end;
  end;
end;

end.
