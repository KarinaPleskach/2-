object nastroikaCategory: TnastroikaCategory
  Left = 373
  Top = 138
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsSingle
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1082#1072#1090#1077#1075#1086#1088#1080#1081
  ClientHeight = 506
  ClientWidth = 569
  Color = clCream
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object spl1: TSplitter
    Left = 280
    Top = -8
    Width = 8
    Height = 457
    Cursor = crDefault
    Align = alNone
    Color = clGradientInactiveCaption
    ParentColor = False
  end
  object spl2: TSplitter
    Left = 0
    Top = 390
    Width = 569
    Height = 8
    Cursor = crDefault
    Align = alNone
    Color = clGradientInactiveCaption
    ParentColor = False
  end
  object spl3: TSplitter
    Left = 0
    Top = 446
    Width = 569
    Height = 8
    Cursor = crDefault
    Align = alNone
    Color = clGradientInactiveCaption
    ParentColor = False
  end
  object tablDohod: TStringGrid
    Left = 8
    Top = 8
    Width = 265
    Height = 369
    ColCount = 1
    FixedColor = clGradientInactiveCaption
    FixedCols = 0
    RowCount = 2
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnMouseDown = tablDohodMouseDown
    ColWidths = (
      243)
  end
  object tablRashod: TStringGrid
    Left = 296
    Top = 8
    Width = 265
    Height = 369
    ColCount = 1
    FixedColor = clGradientInactiveCaption
    FixedCols = 0
    RowCount = 2
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnMouseDown = tablRashodMouseDown
    ColWidths = (
      244)
  end
  object btnAddDohod: TButton
    Left = 16
    Top = 408
    Width = 75
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = btnAddDohodClick
  end
  object btnChangeDohod: TButton
    Left = 104
    Top = 408
    Width = 75
    Height = 25
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = btnChangeDohodClick
  end
  object btnDeleteDohod: TButton
    Left = 192
    Top = 408
    Width = 75
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = btnDeleteDohodClick
  end
  object btnAddRashod: TButton
    Left = 304
    Top = 408
    Width = 75
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = btnAddRashodClick
  end
  object btnChangeRashod: TButton
    Left = 392
    Top = 408
    Width = 75
    Height = 25
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnClick = btnChangeRashodClick
  end
  object btnDeleteRashod: TButton
    Left = 480
    Top = 408
    Width = 75
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    OnClick = btnDeleteRashodClick
  end
  object btnDont: TButton
    Left = 472
    Top = 464
    Width = 83
    Height = 33
    Caption = #1054#1090#1084#1077#1085#1072
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    OnClick = btnDontClick
  end
end
