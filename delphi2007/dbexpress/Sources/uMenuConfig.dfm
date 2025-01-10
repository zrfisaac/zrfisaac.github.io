inherited MenuConfig: TMenuConfig
  Caption = 'MenuConfig'
  OnCreate = FormCreate
  ExplicitWidth = 600
  ExplicitHeight = 400
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnBack: TPanel
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitWidth = 584
    ExplicitHeight = 361
    object pcBack: TPageControl
      Left = 0
      Top = 0
      Width = 584
      Height = 361
      ActivePage = tsDbrexpress
      Align = alClient
      TabOrder = 0
      object tsMain: TTabSheet
        Caption = 'Main'
      end
      object tsDbrexpress: TTabSheet
        Caption = 'dbExpress'
        ImageIndex = 1
        object pnDbrexpressFooter: TPanel
          Left = 0
          Top = 292
          Width = 576
          Height = 41
          Align = alBottom
          TabOrder = 0
          object pnDbrexpressFooter03: TPanel
            Left = 480
            Top = 1
            Width = 95
            Height = 39
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 0
            object btDbrexpressClose: TBitBtn
              Left = 5
              Top = 8
              Width = 75
              Height = 25
              Caption = 'Close'
              TabOrder = 0
            end
          end
          object pnDbrexpressFooter02: TPanel
            Left = 471
            Top = 1
            Width = 9
            Height = 39
            Align = alRight
            BevelOuter = bvNone
            Color = clFuchsia
            ParentBackground = False
            TabOrder = 1
            Visible = False
          end
          object pnDbrexpressFooter01: TPanel
            Left = 1
            Top = 1
            Width = 470
            Height = 39
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 2
            object btDbrexpressConnect: TBitBtn
              Left = 5
              Top = 8
              Width = 75
              Height = 25
              Caption = 'Connect'
              TabOrder = 0
              OnClick = btDbrexpressConnectClick
            end
          end
        end
        object pnDbexpress: TPanel
          Left = 0
          Top = 0
          Width = 576
          Height = 41
          Align = alTop
          TabOrder = 1
          DesignSize = (
            576
            41)
          object cbDbexpress: TComboBox
            Left = 8
            Top = 8
            Width = 556
            Height = 21
            Style = csDropDownList
            Anchors = [akLeft, akTop, akRight]
            ItemHeight = 13
            ItemIndex = 1
            TabOrder = 0
            Text = 'DevartSQLServer Native Client'
            Items.Strings = (
              'DevartODBCSQLServer'
              'DevartSQLServer Native Client'
              'DevartSQLServer OLE DB')
          end
        end
        object Panel3: TPanel
          Left = 0
          Top = 41
          Width = 576
          Height = 251
          Align = alClient
          Caption = 'Panel3'
          TabOrder = 2
          object pcDbexpress: TPageControl
            Left = 1
            Top = 1
            Width = 574
            Height = 249
            ActivePage = tsDbexpressMssql
            Align = alClient
            TabOrder = 0
            object tsDbexpressMssql: TTabSheet
              Caption = 'MSSQL'
              object pnDbexpressMssql: TPanel
                Left = 0
                Top = 0
                Width = 566
                Height = 221
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 0
                object sbDbexpressMssql: TScrollBox
                  Left = 0
                  Top = 0
                  Width = 566
                  Height = 221
                  Align = alClient
                  Color = clGray
                  ParentColor = False
                  TabOrder = 0
                  object Panel1: TPanel
                    Left = 0
                    Top = 0
                    Width = 545
                    Height = 57
                    Align = alTop
                    ParentBackground = False
                    TabOrder = 0
                    object Label1: TLabel
                      Left = 8
                      Top = 8
                      Width = 32
                      Height = 13
                      Caption = 'Server'
                    end
                    object edDbexpressMssqlServer: TEdit
                      Left = 8
                      Top = 27
                      Width = 525
                      Height = 21
                      TabOrder = 0
                      Text = 'vbox.com'
                    end
                  end
                  object Panel2: TPanel
                    Left = 0
                    Top = 171
                    Width = 545
                    Height = 57
                    Align = alTop
                    ParentBackground = False
                    TabOrder = 1
                    object Label2: TLabel
                      Left = 8
                      Top = 8
                      Width = 46
                      Height = 13
                      Caption = 'Password'
                    end
                    object edDbexpressMssqlPassword: TEdit
                      Left = 8
                      Top = 27
                      Width = 525
                      Height = 21
                      TabOrder = 0
                      Text = 'ABcd!@34'
                    end
                  end
                  object Panel4: TPanel
                    Left = 0
                    Top = 114
                    Width = 545
                    Height = 57
                    Align = alTop
                    ParentBackground = False
                    TabOrder = 2
                    object Label3: TLabel
                      Left = 8
                      Top = 8
                      Width = 22
                      Height = 13
                      Caption = 'User'
                    end
                    object edDbexpressMssqlUser: TEdit
                      Left = 8
                      Top = 27
                      Width = 525
                      Height = 21
                      TabOrder = 0
                      Text = 'sa'
                    end
                  end
                  object Panel5: TPanel
                    Left = 0
                    Top = 57
                    Width = 545
                    Height = 57
                    Align = alTop
                    ParentBackground = False
                    TabOrder = 3
                    object Label4: TLabel
                      Left = 8
                      Top = 8
                      Width = 46
                      Height = 13
                      Caption = 'Database'
                    end
                    object edDbexpressMssqlDatabase: TEdit
                      Left = 8
                      Top = 27
                      Width = 525
                      Height = 21
                      TabOrder = 0
                      Text = 'Teste'
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
