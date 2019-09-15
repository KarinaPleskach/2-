object AdminNames: TAdminNames
  Left = 255
  Top = 239
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsSingle
  Caption = #1040#1076#1084#1080#1085#1080#1089#1090#1088#1072#1090#1086#1088' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1077#1081
  ClientHeight = 384
  ClientWidth = 649
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
    Left = 0
    Top = 325
    Width = 657
    Height = 8
    Cursor = crDefault
    Align = alNone
    Color = clGradientInactiveCaption
    ParentColor = False
  end
  object lblName: TLabel
    Left = 8
    Top = 304
    Width = 42
    Height = 18
    Caption = #1048#1084#1105#1085':'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object lblKol: TLabel
    Left = 64
    Top = 304
    Width = 4
    Height = 18
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object btnAdd: TButton
    Left = 40
    Top = 344
    Width = 89
    Height = 33
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = btnAddClick
  end
  object btnChange: TButton
    Left = 152
    Top = 344
    Width = 89
    Height = 33
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = btnChangeClick
  end
  object btnDelete: TButton
    Left = 264
    Top = 344
    Width = 89
    Height = 33
    Caption = #1059#1076#1072#1083#1080#1090#1100
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = btnDeleteClick
  end
  object btnClose: TButton
    Left = 520
    Top = 344
    Width = 91
    Height = 33
    Caption = #1047#1072#1082#1088#1099#1090#1100
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = btnCloseClick
  end
  object tablVibor: TStringGrid
    Left = -2
    Top = 16
    Width = 651
    Height = 281
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
    TabOrder = 4
    OnMouseDown = tablViborMouseDown
    ColWidths = (
      630)
  end
end
