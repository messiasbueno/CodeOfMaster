object fMain: TfMain
  Left = 0
  Top = 0
  Caption = 'fMain'
  ClientHeight = 81
  ClientWidth = 403
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object LblEmail: TLabel
    Left = 16
    Top = 11
    Width = 33
    Height = 13
    Caption = 'Email'
  end
  object EdtEmail: TEdit
    Left = 47
    Top = 8
    Width = 266
    Height = 21
    TabOrder = 0
  end
  object BtnValid: TButton
    Left = 319
    Top = 6
    Width = 75
    Height = 25
    Caption = 'Valid'
    TabOrder = 1
    OnClick = BtnValidClick
  end
  object PnlValid: TPanel
    Left = 47
    Top = 30
    Width = 266
    Height = 41
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 2
  end
end
