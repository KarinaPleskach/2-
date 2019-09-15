object AddValut: TAddValut
  Left = 551
  Top = 286
  Width = 273
  Height = 191
  Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1074#1072#1083#1102#1090#1099
  Color = clCream
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 16
    Top = 16
    Width = 202
    Height = 19
    Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1074#1072#1083#1102#1090#1091' '#1080#1079' '#1089#1087#1080#1089#1082#1072
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object spl1: TSplitter
    Left = 0
    Top = 78
    Width = 257
    Height = 8
    Cursor = crDefault
    Align = alNone
    Color = clGradientInactiveCaption
    ParentColor = False
  end
  object cbbAddValut: TComboBox
    Left = 16
    Top = 48
    Width = 225
    Height = 21
    ItemHeight = 13
    TabOrder = 0
  end
  object btnOk: TButton
    Left = 24
    Top = 103
    Width = 89
    Height = 33
    Caption = #1043#1086#1090#1086#1074#1086
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = btnOkClick
  end
  object btnDont: TButton
    Left = 142
    Top = 103
    Width = 91
    Height = 33
    Caption = #1054#1090#1084#1077#1085#1072
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = btnDontClick
  end
end
