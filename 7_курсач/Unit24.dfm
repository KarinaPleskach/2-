object NameZaemi: TNameZaemi
  Left = 192
  Top = 124
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsSingle
  Caption = #1050#1072#1088#1090#1086#1095#1082#1072' '#1079#1072#1081#1084#1086#1074
  ClientHeight = 293
  ClientWidth = 321
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
  object lbl4: TLabel
    Left = 64
    Top = 72
    Width = 30
    Height = 18
    Caption = #1048#1084#1103
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object lbl5: TLabel
    Left = 48
    Top = 168
    Width = 45
    Height = 18
    Caption = #1057#1091#1084#1084#1072
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object spl1: TSplitter
    Left = -183
    Top = 220
    Width = 504
    Height = 8
    Align = alNone
    Color = clGradientInactiveCaption
    ParentColor = False
  end
  object lbl1: TLabel
    Left = 56
    Top = 24
    Width = 38
    Height = 18
    Caption = #1044#1072#1090#1072
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object lbl2: TLabel
    Left = 40
    Top = 120
    Width = 57
    Height = 18
    Caption = #1042#1072#1083#1102#1090#1072
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object btnOk: TButton
    Left = 48
    Top = 248
    Width = 89
    Height = 33
    Caption = #1043#1086#1090#1086#1074#1086
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = btnOkClick
  end
  object btnDont: TButton
    Left = 184
    Top = 248
    Width = 91
    Height = 33
    Caption = #1054#1090#1084#1077#1085#1072
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = btnDontClick
  end
  object edtMoney: TEdit
    Left = 112
    Top = 168
    Width = 185
    Height = 21
    TabOrder = 2
  end
  object dtpData: TDateTimePicker
    Left = 112
    Top = 24
    Width = 186
    Height = 21
    Date = 43256.344653159720000000
    Time = 43256.344653159720000000
    TabOrder = 3
  end
  object cbbValuta: TComboBox
    Left = 112
    Top = 120
    Width = 185
    Height = 21
    ItemHeight = 13
    TabOrder = 4
  end
  object edtName: TEdit
    Left = 112
    Top = 72
    Width = 185
    Height = 21
    TabOrder = 5
  end
end
