object fMain: TfMain
  Left = 0
  Top = 0
  Caption = 'fMain'
  ClientHeight = 226
  ClientWidth = 275
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblCEP: TLabel
    Left = 24
    Top = 11
    Width = 19
    Height = 13
    Caption = 'CEP'
  end
  object LblStreet: TLabel
    Left = 49
    Top = 48
    Width = 30
    Height = 13
    Caption = 'Street'
  end
  object LblDistrict: TLabel
    Left = 46
    Top = 67
    Width = 33
    Height = 13
    Caption = 'District'
  end
  object LblCity: TLabel
    Left = 60
    Top = 86
    Width = 19
    Height = 13
    Caption = 'City'
  end
  object LblState: TLabel
    Left = 53
    Top = 105
    Width = 26
    Height = 13
    Caption = 'State'
  end
  object lblStreetValue: TLabel
    Left = 85
    Top = 48
    Width = 4
    Height = 13
    Caption = '.'
  end
  object lblDistrictValue: TLabel
    Left = 85
    Top = 67
    Width = 4
    Height = 13
    Caption = '.'
  end
  object lblCityValue: TLabel
    Left = 85
    Top = 86
    Width = 4
    Height = 13
    Caption = '.'
  end
  object lblStateValue: TLabel
    Left = 85
    Top = 105
    Width = 4
    Height = 13
    Caption = '.'
  end
  object BtnSearch: TButton
    Left = 176
    Top = 6
    Width = 75
    Height = 25
    Caption = 'Search'
    TabOrder = 0
    OnClick = BtnSearchClick
  end
  object EdtCEP: TEdit
    Left = 49
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 1
  end
end
