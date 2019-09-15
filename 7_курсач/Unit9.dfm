object NastroikaValut: TNastroikaValut
  Left = 443
  Top = 160
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsSingle
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1074#1072#1083#1102#1090
  ClientHeight = 401
  ClientWidth = 417
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
  object lbl1: TLabel
    Left = 8
    Top = 8
    Width = 205
    Height = 19
    Caption = #1057#1087#1080#1089#1086#1082' '#1080#1089#1087#1086#1083#1100#1079#1091#1077#1084#1099#1093' '#1074#1072#1083#1102#1090
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object spl1: TSplitter
    Left = 0
    Top = 26
    Width = 505
    Height = 8
    Cursor = crDefault
    Align = alNone
    Color = clGradientInactiveCaption
    ParentColor = False
  end
  object btnAdd: TButton
    Left = 40
    Top = 352
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
  object btnDelete: TButton
    Left = 144
    Top = 352
    Width = 89
    Height = 33
    Caption = #1059#1076#1072#1083#1080#1090#1100
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = btnDeleteClick
  end
  object tablVibor: TStringGrid
    Left = 16
    Top = 40
    Width = 385
    Height = 289
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
    TabOrder = 2
    OnMouseDown = tablViborMouseDown
    ColWidths = (
      363)
  end
  object btnClose: TButton
    Left = 286
    Top = 352
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
end
