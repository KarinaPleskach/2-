object frmMain: TfrmMain
  Left = 192
  Top = 117
  Width = 283
  Height = 365
  Caption = 'frmMain'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pbMain: TPaintBox
    Left = 0
    Top = 0
    Width = 275
    Height = 334
    Align = alClient
    OnMouseUp = pbMainMouseUp
    OnPaint = pbMainPaint
  end
  object aeMain: TApplicationEvents
    OnIdle = aeMainIdle
  end
end
