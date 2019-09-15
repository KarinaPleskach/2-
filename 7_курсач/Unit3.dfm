object FormName: TFormName
  Left = 264
  Top = 283
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsSingle
  Caption = #1050#1072#1088#1090#1086#1095#1082#1072' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
  ClientHeight = 297
  ClientWidth = 313
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
  object lblName: TLabel
    Left = 16
    Top = 8
    Width = 93
    Height = 19
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1080#1084#1103
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object lblPassword: TLabel
    Left = 16
    Top = 80
    Width = 170
    Height = 19
    Caption = #1047#1072#1097#1080#1090#1072' '#1080#1084#1077#1085#1080' '#1087#1072#1088#1086#1083#1077#1084
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object lblPassword1: TLabel
    Left = 32
    Top = 120
    Width = 108
    Height = 18
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1087#1072#1088#1086#1083#1100
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object lblPassword2: TLabel
    Left = 32
    Top = 176
    Width = 165
    Height = 18
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1087#1072#1088#1086#1083#1100' '#1077#1097#1077' '#1088#1072#1079
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object spl1: TSplitter
    Left = 0
    Top = 63
    Width = 313
    Height = 8
    Cursor = crDefault
    Align = alNone
    Color = clGradientInactiveCaption
    ParentColor = False
  end
  object spl2: TSplitter
    Left = 0
    Top = 231
    Width = 313
    Height = 8
    Cursor = crDefault
    Align = alNone
    Color = clGradientInactiveCaption
    ParentColor = False
  end
  object edtName: TEdit
    Left = 16
    Top = 32
    Width = 281
    Height = 21
    TabOrder = 0
  end
  object edtPassword1: TEdit
    Left = 32
    Top = 136
    Width = 265
    Height = 21
    TabOrder = 1
  end
  object edtPassword2: TEdit
    Left = 32
    Top = 192
    Width = 265
    Height = 21
    TabOrder = 2
  end
  object btnOk: TButton
    Left = 40
    Top = 256
    Width = 89
    Height = 33
    Caption = #1043#1086#1090#1086#1074#1086
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = btnOkClick
  end
  object btnDont: TButton
    Left = 184
    Top = 256
    Width = 91
    Height = 33
    Caption = #1054#1090#1084#1077#1085#1072
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = btnDontClick
  end
end
