// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires Santana
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io

// # [ delphi2007 ]
unit menu_main;

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
  StdCtrls,
  msxml,
  msxmldom;

type
  TMenuMain = class(TForm)
    pnBack: TPanel;
    sbFooter: TStatusBar;
    miMenu: TMainMenu;
    miHelp: TMenuItem;
    miAbout: TMenuItem;
    acAction: TActionList;
    acAbout: TAction;
    pcBack: TPageControl;
    tsWrite: TTabSheet;
    pnXml: TPanel;
    pnXmlFooter: TPanel;
    pnXmlFooter03: TPanel;
    pnXmlFooter02: TPanel;
    pnXmlFooter01: TPanel;
    meXml: TMemo;
    btXmlSave: TButton;
    dgWrite: TSaveDialog;
    dgRead: TOpenDialog;
    btXmlLoad: TButton;
    btXmlNew: TButton;
    btXmlDelete: TButton;
    btXmlExterminate: TButton;
    procedure FormCreate(Sender: TObject);
    procedure acAboutExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btXmlSaveClick(Sender: TObject);
    procedure btXmlLoadClick(Sender: TObject);
    procedure btXmlNewClick(Sender: TObject);
    procedure btXmlDeleteClick(Sender: TObject);
    procedure btXmlExterminateClick(Sender: TObject);
  end;

var
  MenuMain: TMenuMain;

implementation

uses
  zrlib;

{$R *.dfm}

procedure TMenuMain.acAboutExecute(Sender: TObject);
begin
  // # : - menu - help - about
  zrAbout;
end;

procedure TMenuMain.btXmlDeleteClick(Sender: TObject);
var
  _vDocument: IXMLDOMDocument;
  _vRoot: IXMLDOMNodeList;
  _vNode, ParentNode: IXMLDOMNode;
  _vElement: IXMLDOMElement;
  _vI0: Integer;
begin
  _vDocument := CoDOMDocument.Create;
  _vDocument.async := False;
  _vDocument.loadXML(Self.meXml.Text);
  _vRoot := _vDocument.getElementsByTagName('menu');
  if _vRoot.length > 0 then
  begin
    for _vI0 := 0 to _vRoot.length - 1 do
    begin
      _vNode := _vRoot.item[_vI0];
      if Assigned(_vNode) then
      begin
        ParentNode := _vNode.parentNode;
        if Assigned(ParentNode) then
          ParentNode.removeChild(_vNode);
      end;
    end;
  end;
  Self.meXml.Text := _vDocument.xml;
end;

procedure TMenuMain.btXmlExterminateClick(Sender: TObject);
var
  _vDocument: IXMLDOMDocument;
  _vRoot: IXMLDOMNode;
  _vNodeList: IXMLDOMNodeList;
  _vNode: IXMLDOMNode;
  _vI0: Integer;
begin
  _vDocument := CoDOMDocument.Create;
  _vDocument.async := False;
  _vDocument.loadXML(Self.meXml.Text);
  _vRoot := _vDocument.documentElement;
  if not Assigned(_vRoot) then Exit;
  _vNodeList := _vRoot.selectNodes('./menu');
  for _vI0 := _vNodeList.length - 1 downto 0 do
  begin
    _vNode := _vNodeList.item[_vI0];
    if Assigned(_vNode) then
      _vRoot.removeChild(_vNode);
  end;
  Self.meXml.Text := _vDocument.xml;
end;


procedure TMenuMain.btXmlLoadClick(Sender: TObject);
begin
  // # : - form - write - load
  if (Self.dgRead.Execute(Application.Handle)) then
  begin
    if (FileExists(Self.dgRead.FileName)) then
    begin
      Self.meXml.Lines.LoadFromFile(Self.dgRead.FileName);
    end;
  end;
end;

procedure TMenuMain.btXmlNewClick(Sender: TObject);
var
  _vDocument: IXMLDOMDocument;
  _vI0: Integer;
begin
  _vDocument := CoDOMDocument.Create;
  _vDocument.async := False;
  _vDocument.loadXML('<root><menu id="1"><description>Item 1</description></menu></root>');
  Self.meXml.Text := _vDocument.xml;
end;

procedure TMenuMain.btXmlSaveClick(Sender: TObject);
begin
  // # : - form - write - save
  if (Self.dgWrite.Execute(Application.Handle)) then
  begin
    if (FileExists(Self.dgWrite.FileName)) then
      DeleteFile(Self.dgWrite.FileName);
    Self.meXml.Lines.SaveToFile(Self.dgWrite.FileName);
  end;
end;

procedure TMenuMain.FormCreate(Sender: TObject);
begin
  // # : - title
  Self.Caption := Application.Title;

  // # : - footer
  if (Self.sbFooter.Panels.Count) > 0 then
  begin
    Self.sbFooter.Panels[0].Text := zrVersion;
    Self.sbFooter.Panels[0].BiDiMode := bdLeftToRight;
  end;
  if (Self.sbFooter.Panels.Count) > 1 then
  begin
    Self.sbFooter.Panels[Self.sbFooter.Panels.Count-1].Text := '     ' + zrInternalName;
    Self.sbFooter.Panels[Self.sbFooter.Panels.Count-1].BiDiMode := bdRightToLeft;
  end;
end;

procedure TMenuMain.FormShow(Sender: TObject);
begin
  // # : - page
  if (Self.pcBack.PageCount > 0) then
    Self.pcBack.TabIndex := 0;
end;

end.
