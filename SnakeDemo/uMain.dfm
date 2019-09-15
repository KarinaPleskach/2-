object frmMain: TfrmMain
  Left = 208
  Top = 115
  Width = 316
  Height = 638
  Caption = 'frmMain'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object pbGame: TPaintBox
    Left = 0
    Top = 0
    Width = 300
    Height = 600
    OnPaint = pbGamePaint
  end
  object tmrTimer: TTimer
    Enabled = False
    Interval = 300
    OnTimer = tmrTimerTimer
    Left = 8
    Top = 8
  end
end
