// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires Santana
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io

// # [ delphi7 ]
unit menu_main_form;

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
  ExtCtrls,
  ComCtrls,
  Menus,
  ActnList,
  Grids,
  ValEdit,
  TlHelp32,
  StdCtrls,
  Buttons;

type
  TMenuMainForm = class(TForm)
    vleData: TValueListEditor;
    sbFooter: TStatusBar;
    pnFooter: TPanel;
    pnFooter03: TPanel;
    btClose: TBitBtn;
    pnFooter02: TPanel;
    pnFooter01: TPanel;
    btRun: TBitBtn;
    acAction: TActionList;
    acClose: TAction;
    acRun: TAction;
    btNotepadBegin: TBitBtn;
    btNotepadEnd: TBitBtn;
    pnNotepad: TPanel;
    pnNotepad03: TPanel;
    pnNotepad02: TPanel;
    pnNotepad01: TPanel;
    edNotepadPID: TEdit;
    lbNotepadPID: TLabel;
    edNotepadExecutable: TEdit;
    lbNotepadExecutable: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure acRunExecute(Sender: TObject);
    procedure btRunClick(Sender: TObject);
    procedure btCloseClick(Sender: TObject);
    procedure acCloseExecute(Sender: TObject);
    procedure btNotepadBeginClick(Sender: TObject);
    procedure btNotepadEndClick(Sender: TObject);
  public
    procedure fnClose;
    procedure fnNotepadBegin;
    procedure fnNotepadEnd;
    function fnProcesses: String;
    procedure fnRun;
    procedure fnStatus(_pText: String);
  end;

var
  MenuMainForm: TMenuMainForm;

implementation

uses
  menu_main_data,
  zrlib;

{$R *.dfm}

function IsProcessRunning(PID: DWORD): Boolean;
var
  hProcess: THandle;
begin
  hProcess := OpenProcess(PROCESS_QUERY_INFORMATION, False, PID);
  Result := hProcess <> 0;
  if Result then
    CloseHandle(hProcess);
end;

function TerminateProcessByPID(PID: DWORD): Boolean;
var
  hProcess: THandle;
begin
  hProcess := OpenProcess(PROCESS_TERMINATE, False, PID);
  if hProcess <> 0 then
  begin
    Result := TerminateProcess(hProcess, 0);
    CloseHandle(hProcess);
  end
  else
    Result := False;
end;

procedure TMenuMainForm.fnClose;
begin
  Self.Close;
end;

function TMenuMainForm.fnProcesses: String;
var
  hSnapshot: THandle;
  pe: TProcessEntry32;
  _vReturn: String;
begin
  _vReturn := '';
  hSnapshot := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  if hSnapshot = INVALID_HANDLE_VALUE then
  begin
    _vReturn := 'Failed to create snapshot.';
    Exit;
  end;
  pe.dwSize := SizeOf(TProcessEntry32);
  if Process32First(hSnapshot, pe) then
  begin
    repeat
      vleData.Values[Format('%5d',[pe.th32ProcessID])] := pe.szExeFile;
      _vReturn := 'Update';
    until not Process32Next(hSnapshot, pe);
  end
  else
    _vReturn := 'No process found.';
  CloseHandle(hSnapshot);
  Result := _vReturn;
end;

procedure TMenuMainForm.fnRun;
begin
  Self.fnStatus(Self.fnProcesses);
end;

procedure TMenuMainForm.fnStatus(_pText: String);
begin
  if (Self.sbFooter.Panels.Count > 2) then
    Self.sbFooter.Panels[1].Text := FormatDateTime('yyyy-MM-dd hh:mm:ss.zzz',Now);
  if (Self.sbFooter.Panels.Count > 3) then
    Self.sbFooter.Panels[2].Text := _pText;
end;

procedure TMenuMainForm.FormCreate(Sender: TObject);
begin
  // # : - title
  Self.Caption := Application.Title;

  // # : - footer
  if (Self.sbFooter.Panels.Count > 0) then
    Self.sbFooter.Panels[0].Text := ZRFileVersion;
  if (Self.sbFooter.Panels.Count > 1) then
    Self.sbFooter.Panels[Self.sbFooter.Panels.Count - 1].Text := ZRInternalName + '     .';

  // # : - datamodule
  if not Assigned(MenuMainData) then
    MenuMainData := TMenuMainData.Create(Self);
end;

procedure TMenuMainForm.acRunExecute(Sender: TObject);
begin
  Self.fnRun;
end;

procedure TMenuMainForm.btRunClick(Sender: TObject);
begin
  Self.fnRun;
end;

procedure TMenuMainForm.btCloseClick(Sender: TObject);
begin
  Self.fnClose;
end;

procedure TMenuMainForm.acCloseExecute(Sender: TObject);
begin
  Self.fnClose;
end;

procedure TMenuMainForm.fnNotepadBegin;
const
  _C_NOTEPAD = 'C:\Windows\notepad.exe';
var
  SI: TStartupInfo;
  PI: TProcessInformation;
begin
  ZeroMemory(@SI, SizeOf(SI));
  ZeroMemory(@PI, SizeOf(PI));
  SI.cb := SizeOf(SI);

  if CreateProcess(
       nil,                  // Application name
       PChar(_C_NOTEPAD),    // Command line
       nil, nil,             // Process and thread security attributes
       False,                // Inherit handles
       0,                    // Creation flags
       nil,                  // Environment
       nil,                  // Current directory
       SI,                   // Startup info
       PI                    // Process info
     ) then
  begin
    Self.edNotepadPID.Text := IntToStr(PI.dwProcessId);
    Self.edNotepadExecutable.Text := _C_NOTEPAD;

    // Don't forget to close handles
    CloseHandle(PI.hProcess);
    CloseHandle(PI.hThread);
  end
  else
    fnStatus('Failed to start process. Error code: ' + IntToStr(GetLastError));
end;

procedure TMenuMainForm.fnNotepadEnd;
var
  _vPID: Integer;
begin
  _vPID := StrToIntDef(Self.edNotepadPID.Text,-1);
  if (_vPID > 0) then
  begin
    if (IsProcessRunning(_vPID)) then
    begin
      if (TerminateProcessByPID(_vPID)) then
      begin
        Self.edNotepadPID.Text := '';
        Self.edNotepadExecutable.Text := '';
      end;
    end;
  end;
end;

procedure TMenuMainForm.btNotepadBeginClick(Sender: TObject);
begin
  Self.fnNotepadBegin;
end;

procedure TMenuMainForm.btNotepadEndClick(Sender: TObject);
begin
  Self.fnNotepadEnd;
end;

end.
