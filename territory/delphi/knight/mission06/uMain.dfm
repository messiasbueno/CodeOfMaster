object fMain: TfMain
  Left = 0
  Top = 0
  Caption = 'fMain'
  ClientHeight = 160
  ClientWidth = 373
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Lblreturn: TLabel
    Left = 8
    Top = 114
    Width = 357
    Height = 13
    Alignment = taCenter
  end
  object LblURL: TLabel
    Left = 8
    Top = 7
    Width = 43
    Height = 25
    Caption = 'URL'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object BtnDownload: TButton
    Left = 8
    Top = 65
    Width = 75
    Height = 25
    Caption = 'Download'
    TabOrder = 0
    OnClick = BtnDownloadClick
  end
  object ProgressBar: TProgressBar
    Left = 8
    Top = 133
    Width = 357
    Height = 17
    TabOrder = 1
  end
  object EdtURL: TEdit
    Left = 8
    Top = 38
    Width = 357
    Height = 21
    TabOrder = 2
    Text = 'http://download.thinkbroadband.com/20MB.zip'
  end
end
