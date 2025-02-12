object MenuMain: TMenuMain
  Left = 0
  Top = 0
  Caption = 'MenuMain'
  ClientHeight = 361
  ClientWidth = 584
  Color = clBtnFace
  Constraints.MinHeight = 200
  Constraints.MinWidth = 300
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = miMenu
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnBack: TPanel
    Left = 0
    Top = 0
    Width = 584
    Height = 342
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object pcBack: TPageControl
      Left = 0
      Top = 0
      Width = 584
      Height = 342
      ActivePage = tsWrite
      Align = alClient
      TabOrder = 0
      object tsWrite: TTabSheet
        Caption = 'XML'
        object pnXml: TPanel
          Left = 0
          Top = 0
          Width = 576
          Height = 314
          Align = alClient
          BevelOuter = bvNone
          ParentBackground = False
          TabOrder = 0
          object pnXmlFooter: TPanel
            Left = 0
            Top = 273
            Width = 576
            Height = 41
            Align = alBottom
            TabOrder = 0
            object pnXmlFooter03: TPanel
              Left = 440
              Top = 1
              Width = 135
              Height = 39
              Align = alRight
              BevelOuter = bvNone
              TabOrder = 0
            end
            object pnXmlFooter02: TPanel
              Left = 432
              Top = 1
              Width = 8
              Height = 39
              Align = alRight
              BevelOuter = bvNone
              Color = clFuchsia
              ParentBackground = False
              TabOrder = 1
              Visible = False
            end
            object pnXmlFooter01: TPanel
              Left = 1
              Top = 1
              Width = 431
              Height = 39
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 2
              object btXmlSave: TButton
                Left = 63
                Top = 6
                Width = 50
                Height = 25
                Caption = 'Save'
                TabOrder = 1
                OnClick = btXmlSaveClick
              end
              object btXmlLoad: TButton
                Left = 6
                Top = 6
                Width = 51
                Height = 25
                Caption = 'Load'
                TabOrder = 0
                OnClick = btXmlLoadClick
              end
              object btXmlNew: TButton
                Left = 119
                Top = 6
                Width = 51
                Height = 25
                Caption = 'New'
                TabOrder = 2
                OnClick = btXmlNewClick
              end
              object btXmlDelete: TButton
                Left = 176
                Top = 6
                Width = 51
                Height = 25
                Caption = 'Delete'
                TabOrder = 3
                OnClick = btXmlDeleteClick
              end
              object btXmlExterminate: TButton
                Left = 233
                Top = 6
                Width = 80
                Height = 25
                Caption = 'Exterminate'
                TabOrder = 4
                OnClick = btXmlExterminateClick
              end
            end
          end
          object meXml: TMemo
            Left = 0
            Top = 0
            Width = 576
            Height = 273
            Align = alClient
            Lines.Strings = (
              '<?xml version="1.0" encoding="UTF-8"?>'
              '<Application>'
              '    <Name>MyApp</Name>'
              '    <Version>1.0.0</Version>'
              '    <Developer>'
              '        <Name>Isaac Caires</Name>'
              '        <Website>https://zrfisaac.github.io</Website>'
              '        <Contact>zrfisaac@gmail.com</Contact>'
              '    </Developer>'
              
                '    <Description>A sample application demonstrating XML structur' +
                'e.</Description>'
              '    <Dependencies>'
              '        <Dependency name="Delphi Runtime" version="10.4" />'
              '        <Dependency name="SQL Server" version="2019" />'
              '    </Dependencies>'
              '    <Settings>'
              '        <Theme>Dark</Theme>'
              '        <Language>English</Language>'
              '        <AutoUpdate>true</AutoUpdate>'
              '    </Settings>'
              '</Application>')
            ScrollBars = ssBoth
            TabOrder = 1
            WantTabs = True
            WordWrap = False
          end
        end
      end
    end
  end
  object sbFooter: TStatusBar
    Left = 0
    Top = 342
    Width = 584
    Height = 19
    Panels = <
      item
        Width = 80
      end
      item
        Width = 50
      end>
  end
  object miMenu: TMainMenu
    Left = 552
    object miHelp: TMenuItem
      Caption = 'Help'
      object miAbout: TMenuItem
        Action = acAbout
      end
    end
  end
  object acAction: TActionList
    Left = 552
    Top = 32
    object acAbout: TAction
      Category = 'Help'
      Caption = 'About'
      ShortCut = 112
      OnExecute = acAboutExecute
    end
  end
  object dgWrite: TSaveDialog
    DefaultExt = '*.xml'
    FileName = 'sample.xml'
    Filter = 'XML File (*.xml)|*.xml'
    Left = 552
    Top = 64
  end
  object dgRead: TOpenDialog
    DefaultExt = '*.xml'
    FileName = 'sample.xml'
    Filter = 'XML File (*.xml)|*.xml'
    Left = 552
    Top = 96
  end
end
