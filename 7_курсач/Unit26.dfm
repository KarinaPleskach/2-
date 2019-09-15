object Otchet: TOtchet
  Left = 183
  Top = 40
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsSingle
  Caption = #1054#1090#1095#1077#1090#1099
  ClientHeight = 617
  ClientWidth = 921
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
  object btnMain: TButton
    Left = 32
    Top = 568
    Width = 105
    Height = 33
    Caption = #1043#1083#1072#1074#1085#1072#1103
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = btnMainClick
  end
  object btnRashod: TButton
    Left = 168
    Top = 568
    Width = 105
    Height = 33
    Caption = #1056#1072#1089#1093#1086#1076#1099
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = btnRashodClick
  end
  object btnDohod: TButton
    Left = 304
    Top = 568
    Width = 105
    Height = 33
    Caption = #1044#1086#1093#1086#1076#1099
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = btnDohodClick
  end
  object btnDolgi: TButton
    Left = 440
    Top = 568
    Width = 105
    Height = 33
    Caption = #1044#1086#1083#1075#1080
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = btnDolgiClick
  end
  object btnZaemi: TButton
    Left = 576
    Top = 568
    Width = 105
    Height = 33
    Caption = #1047#1072#1081#1084#1099
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = btnZaemiClick
  end
  object pnlMain: TPanel
    Left = -8
    Top = 0
    Width = 929
    Height = 553
    TabOrder = 5
    object lbl1: TLabel
      Left = 768
      Top = 416
      Width = 131
      Height = 19
      Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1074#1072#1083#1102#1090#1091
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
    object cbbMain: TComboBox
      Left = 768
      Top = 440
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 0
    end
    object btnGoMain: TButton
      Left = 792
      Top = 488
      Width = 107
      Height = 33
      Caption = #1053#1072#1088#1080#1089#1086#1074#1072#1090#1100
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnGoMainClick
    end
    object chtMain: TChart
      Left = 16
      Top = 16
      Width = 729
      Height = 521
      AllowPanning = pmNone
      AllowZoom = False
      BackWall.Brush.Color = clWhite
      BackWall.Brush.Style = bsClear
      BackWall.Pen.Visible = False
      Title.Font.Charset = RUSSIAN_CHARSET
      Title.Font.Color = clBlack
      Title.Font.Height = -16
      Title.Font.Name = 'Times New Roman'
      Title.Font.Style = [fsBold, fsItalic]
      Title.Text.Strings = (
        #1057#1090#1072#1090#1080#1089#1090#1080#1082#1072' '#1088#1072#1089#1093#1086#1076#1086#1074)
      AxisVisible = False
      ClipPoints = False
      Frame.Visible = False
      View3DOptions.Elevation = 315
      View3DOptions.Orthogonal = False
      View3DOptions.Perspective = 0
      View3DOptions.Rotation = 360
      View3DWalls = False
      TabOrder = 2
      object psrsMain: TPieSeries
        Marks.ArrowLength = 8
        Marks.Visible = True
        SeriesColor = clRed
        OtherSlice.Text = 'Other'
        PieValues.DateTime = False
        PieValues.Name = 'Pie'
        PieValues.Multiplier = 1.000000000000000000
        PieValues.Order = loNone
      end
    end
  end
  object pnlDohod: TPanel
    Left = 0
    Top = 0
    Width = 921
    Height = 553
    TabOrder = 6
    object lbl2: TLabel
      Left = 768
      Top = 416
      Width = 131
      Height = 19
      Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1074#1072#1083#1102#1090#1091
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
    object cbbdohod: TComboBox
      Left = 768
      Top = 440
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 0
    end
    object btngodohod: TButton
      Left = 792
      Top = 488
      Width = 107
      Height = 33
      Caption = #1053#1072#1088#1080#1089#1086#1074#1072#1090#1100
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btngodohodClick
    end
    object chtdohod: TChart
      Left = 16
      Top = 16
      Width = 729
      Height = 521
      AllowPanning = pmNone
      AllowZoom = False
      BackWall.Brush.Color = clWhite
      BackWall.Brush.Style = bsClear
      BackWall.Pen.Visible = False
      Title.Font.Charset = RUSSIAN_CHARSET
      Title.Font.Color = clBlack
      Title.Font.Height = -16
      Title.Font.Name = 'Times New Roman'
      Title.Font.Style = [fsBold, fsItalic]
      Title.Text.Strings = (
        #1057#1090#1072#1090#1080#1089#1090#1080#1082#1072' '#1076#1086#1093#1086#1076#1086#1074)
      AxisVisible = False
      ClipPoints = False
      Frame.Visible = False
      View3DOptions.Elevation = 315
      View3DOptions.Orthogonal = False
      View3DOptions.Perspective = 0
      View3DOptions.Rotation = 360
      View3DWalls = False
      TabOrder = 2
      object psrsdohod: TPieSeries
        Marks.ArrowLength = 8
        Marks.Visible = True
        SeriesColor = clRed
        OtherSlice.Text = 'Other'
        PieValues.DateTime = False
        PieValues.Name = 'Pie'
        PieValues.Multiplier = 1.000000000000000000
        PieValues.Order = loNone
      end
    end
  end
  object pnlDolgi: TPanel
    Left = 0
    Top = 0
    Width = 921
    Height = 553
    TabOrder = 7
    object lbl3: TLabel
      Left = 768
      Top = 416
      Width = 131
      Height = 19
      Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1074#1072#1083#1102#1090#1091
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
    object cbbDolgi: TComboBox
      Left = 768
      Top = 440
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 0
    end
    object btnGodolgi: TButton
      Left = 792
      Top = 488
      Width = 107
      Height = 33
      Caption = #1053#1072#1088#1080#1089#1086#1074#1072#1090#1100
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnGodolgiClick
    end
    object chtdolgi: TChart
      Left = 16
      Top = 16
      Width = 729
      Height = 521
      AllowPanning = pmNone
      AllowZoom = False
      BackWall.Brush.Color = clWhite
      BackWall.Brush.Style = bsClear
      BackWall.Pen.Visible = False
      Title.Font.Charset = RUSSIAN_CHARSET
      Title.Font.Color = clBlack
      Title.Font.Height = -16
      Title.Font.Name = 'Times New Roman'
      Title.Font.Style = [fsBold, fsItalic]
      Title.Text.Strings = (
        #1057#1090#1072#1090#1080#1089#1090#1080#1082#1072' '#1076#1086#1083#1075#1086#1074)
      AxisVisible = False
      ClipPoints = False
      Frame.Visible = False
      View3DOptions.Elevation = 315
      View3DOptions.Orthogonal = False
      View3DOptions.Perspective = 0
      View3DOptions.Rotation = 360
      View3DWalls = False
      TabOrder = 2
      object psrsdolgi: TPieSeries
        Marks.ArrowLength = 8
        Marks.Visible = True
        SeriesColor = clRed
        OtherSlice.Text = 'Other'
        PieValues.DateTime = False
        PieValues.Name = 'Pie'
        PieValues.Multiplier = 1.000000000000000000
        PieValues.Order = loNone
      end
    end
  end
  object pnlZaemi: TPanel
    Left = 0
    Top = 0
    Width = 921
    Height = 553
    TabOrder = 8
    object lbl4: TLabel
      Left = 768
      Top = 416
      Width = 131
      Height = 19
      Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1074#1072#1083#1102#1090#1091
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
    object cbbzaemi: TComboBox
      Left = 768
      Top = 440
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 0
    end
    object btngozaemi: TButton
      Left = 792
      Top = 488
      Width = 107
      Height = 33
      Caption = #1053#1072#1088#1080#1089#1086#1074#1072#1090#1100
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btngozaemiClick
    end
    object chtzaemi: TChart
      Left = 16
      Top = 16
      Width = 729
      Height = 521
      AllowPanning = pmNone
      AllowZoom = False
      BackWall.Brush.Color = clWhite
      BackWall.Brush.Style = bsClear
      BackWall.Pen.Visible = False
      Title.Font.Charset = RUSSIAN_CHARSET
      Title.Font.Color = clBlack
      Title.Font.Height = -16
      Title.Font.Name = 'Times New Roman'
      Title.Font.Style = [fsBold, fsItalic]
      Title.Text.Strings = (
        #1057#1090#1072#1090#1080#1089#1090#1080#1082#1072' '#1079#1072#1081#1084#1086#1074)
      AxisVisible = False
      ClipPoints = False
      Frame.Visible = False
      View3DOptions.Elevation = 315
      View3DOptions.Orthogonal = False
      View3DOptions.Perspective = 0
      View3DOptions.Rotation = 360
      View3DWalls = False
      TabOrder = 2
      object psrszaemi: TPieSeries
        Marks.ArrowLength = 8
        Marks.Visible = True
        SeriesColor = clRed
        OtherSlice.Text = 'Other'
        PieValues.DateTime = False
        PieValues.Name = 'Pie'
        PieValues.Multiplier = 1.000000000000000000
        PieValues.Order = loNone
      end
    end
  end
end
