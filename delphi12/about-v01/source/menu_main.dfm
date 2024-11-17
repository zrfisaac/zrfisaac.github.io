object MenuMain: TMenuMain
  Left = 0
  Top = 0
  Caption = 'MenuMain'
  ClientHeight = 361
  ClientWidth = 584
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = miMenu
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 13
  object pnBack: TPanel
    Left = 0
    Top = 0
    Width = 584
    Height = 342
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 582
    ExplicitHeight = 334
    object pnFooter: TPanel
      Left = 1
      Top = 300
      Width = 582
      Height = 41
      Align = alBottom
      TabOrder = 0
      ExplicitTop = 292
      ExplicitWidth = 580
      object pnFooter03: TPanel
        Left = 396
        Top = 1
        Width = 185
        Height = 39
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitLeft = 394
      end
      object pnFooter02: TPanel
        Left = 388
        Top = 1
        Width = 8
        Height = 39
        Align = alRight
        BevelOuter = bvNone
        Color = clFuchsia
        ParentBackground = False
        TabOrder = 1
        Visible = False
        ExplicitLeft = 386
      end
      object pnFooter01: TPanel
        Left = 1
        Top = 1
        Width = 387
        Height = 39
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 2
        ExplicitWidth = 385
        object btRoutine: TBitBtn
          Left = 8
          Top = 8
          Width = 75
          Height = 25
          Caption = 'Routine'
          TabOrder = 0
          OnClick = btRoutineClick
        end
      end
    end
    object pnBody: TPanel
      Left = 1
      Top = 1
      Width = 582
      Height = 299
      Align = alClient
      TabOrder = 1
      ExplicitWidth = 580
      ExplicitHeight = 291
      object meText: TMemo
        Left = 1
        Top = 1
        Width = 580
        Height = 297
        Align = alClient
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Consolas'
        Font.Style = []
        Lines.Strings = (
          
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam ' +
            'egestas a '
          
            'turpis a pretium. Donec vel consequat lacus. Nullam quis luctus ' +
            'magna. Integer '
          
            'a eros aliquam, dictum nisi vitae, convallis eros. Fusce viverra' +
            ' hendrerit '
          
            'viverra. Quisque auctor, erat a tempus pretium, mauris mi iaculi' +
            's ligula, eget '
          
            'sagittis mi mi sed enim. Nulla facilisi. Interdum et malesuada f' +
            'ames ac ante '
          'ipsum primis in faucibus.'
          ''
          
            'Nulla facilisi. Cras aliquet lorem quis augue faucibus, non ultr' +
            'icies sem '
          
            'viverra. In vestibulum eleifend consequat. In condimentum effici' +
            'tur mi '
          
            'malesuada dictum. Integer vulputate, arcu vitae pretium interdum' +
            ', velit odio '
          
            'lacinia ipsum, id rhoncus lectus nulla sit amet urna. Cras at li' +
            'bero non risus '
          
            'iaculis malesuada non non quam. Proin rhoncus magna nec ipsum mo' +
            'llis interdum. '
          
            'Nam et accumsan augue. In tincidunt ante eu nibh volutpat vestib' +
            'ulum ac vel '
          'enim. Phasellus pharetra arcu ac pretium tincidunt.'
          ''
          
            'Pellentesque dignissim dolor non nisl eleifend pulvinar. Nunc ma' +
            'ximus in '
          
            'lectus ac cursus. Sed sodales sem vel metus ultrices, in molesti' +
            'e ante tempus. '
          
            'Nullam imperdiet consectetur nisl accumsan hendrerit. In tincidu' +
            'nt quam in '
          
            'molestie pulvinar. Nam interdum vel lacus eget egestas. Cras ege' +
            'stas diam '
          
            'mollis dui congue, ut iaculis est dictum. In sollicitudin risus ' +
            'non neque '
          'maximus, a ullamcorper dolor feugiat.'
          ''
          
            'In neque lectus, volutpat quis pellentesque eget, gravida ac dui' +
            '. Duis '
          
            'eleifend malesuada ex id cursus. Sed mi ante, pellentesque non o' +
            'dio in, '
          
            'pulvinar suscipit nisi. Etiam cursus arcu id ullamcorper tincidu' +
            'nt. Class '
          
            'aptent taciti sociosqu ad litora torquent per conubia nostra, pe' +
            'r inceptos '
          
            'himenaeos. Nam aliquam varius diam, lobortis vulputate arcu lobo' +
            'rtis quis. '
          
            'Aliquam neque erat, ultricies et mauris sed, maximus fermentum e' +
            'ros. Nulla '
          
            'volutpat metus vehicula felis tincidunt, at viverra nulla feugia' +
            't. Sed '
          
            'ultricies risus sit amet mauris ornare, vitae volutpat felis sag' +
            'ittis.'
          ''
          
            'Cras lectus mauris, tincidunt dignissim facilisis tempor, finibu' +
            's sit amet '
          
            'tortor. Morbi eget laoreet arcu. Nullam egestas lacus ante, dign' +
            'issim sagittis '
          
            'elit posuere vel. Duis rutrum bibendum nibh nec dapibus. Morbi n' +
            'eque velit, '
          
            'vulputate ut molestie ac, venenatis id arcu. Mauris eu purus est' +
            '. Ut ut '
          
            'tincidunt erat. Nunc efficitur quam at erat interdum, maximus bi' +
            'bendum orci '
          
            'feugiat. Fusce posuere quis diam at iaculis. Maecenas quis aliqu' +
            'am ex. Orci '
          
            'varius natoque penatibus et magnis dis parturient montes, nascet' +
            'ur ridiculus '
          
            'mus. Duis in eros lacinia, molestie lectus et, lobortis tellus. ' +
            'Nulla '
          'facilisi. Suspendisse potenti.')
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
        WantTabs = True
        ExplicitWidth = 578
        ExplicitHeight = 289
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 342
    Width = 584
    Height = 19
    Panels = <>
    ExplicitTop = 334
    ExplicitWidth = 582
  end
  object miMenu: TMainMenu
    Left = 24
    Top = 8
  end
  object acAction: TActionList
    Left = 24
    Top = 64
    object acF1: TAction
      Category = 'F1'
      Caption = 'Esc'
      ShortCut = 112
      OnExecute = acF1Execute
    end
  end
end
