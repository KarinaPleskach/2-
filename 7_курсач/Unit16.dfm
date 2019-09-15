object ChangeRashod: TChangeRashod
  Left = 289
  Top = 180
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsSingle
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077
  ClientHeight = 161
  ClientWidth = 273
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
    Left = 16
    Top = 16
    Width = 195
    Height = 19
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1082#1072#1090#1077#1075#1086#1088#1080#1102' '#1076#1086#1093#1086#1076#1072
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object spl1: TSplitter
    Left = 0
    Top = 79
    Width = 273
    Height = 8
    Cursor = crDefault
    Align = alNone
    Color = clGradientInactiveCaption
    ParentColor = False
  end
  object edtName: TEdit
    Left = 16
    Top = 48
    Width = 241
    Height = 21
    TabOrder = 0
  end
  object btnOk: TButton
    Left = 24
    Top = 105
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
    Left = 158
    Top = 105
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
