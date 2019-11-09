object fMain: TfMain
  Left = 0
  Top = 0
  Caption = 'memo'
  ClientHeight = 209
  ClientWidth = 523
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  ShowHint = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object pnData: TPanel
    Left = 0
    Top = 0
    Width = 523
    Height = 174
    Align = alClient
    TabOrder = 0
    object LblId: TLabel
      Left = 40
      Top = 11
      Width = 14
      Height = 13
      Caption = 'Id:'
    end
    object LblName: TLabel
      Left = 23
      Top = 38
      Width = 31
      Height = 13
      Caption = 'Name:'
    end
    object LblLastName: TLabel
      Left = 267
      Top = 38
      Width = 54
      Height = 13
      Caption = 'Last Name:'
    end
    object LblGender: TLabel
      Left = 15
      Top = 65
      Width = 39
      Height = 13
      Caption = 'Gender:'
    end
    object LblDoB: TLabel
      Left = 253
      Top = 65
      Width = 68
      Height = 13
      Caption = 'Date of Birth: '
    end
    object LblEmail: TLabel
      Left = 22
      Top = 92
      Width = 32
      Height = 13
      Caption = 'E-mail:'
    end
    object LblPhone: TLabel
      Left = 287
      Top = 92
      Width = 34
      Height = 13
      Caption = 'Phone:'
    end
    object LblWebSite: TLabel
      Left = 7
      Top = 119
      Width = 47
      Height = 13
      Caption = 'Web Site:'
    end
    object LblStatus: TLabel
      Left = 286
      Top = 11
      Width = 35
      Height = 13
      Caption = 'Status:'
      Color = clBtnFace
      ParentColor = False
    end
    object LblAddress: TLabel
      Left = 11
      Top = 146
      Width = 43
      Height = 13
      Caption = 'Address:'
    end
    object EdtId: TEdit
      Left = 60
      Top = 8
      Width = 65
      Height = 21
      NumbersOnly = True
      TabOrder = 0
    end
    object EdtName: TEdit
      Left = 60
      Top = 35
      Width = 186
      Height = 21
      TabOrder = 2
    end
    object EdtLastName: TEdit
      Left = 327
      Top = 35
      Width = 186
      Height = 21
      TabOrder = 3
    end
    object CbxGenger: TComboBox
      Left = 60
      Top = 62
      Width = 186
      Height = 22
      Style = csOwnerDrawFixed
      TabOrder = 4
      Items.Strings = (
        'male'
        'female')
    end
    object DtpDoB: TDateTimePicker
      Left = 327
      Top = 62
      Width = 186
      Height = 21
      Date = 43763.000000000000000000
      Time = 0.444367650459753300
      Checked = False
      TabOrder = 5
    end
    object EdtEmail: TEdit
      Left = 60
      Top = 89
      Width = 186
      Height = 21
      TabOrder = 6
    end
    object EdtPhone: TEdit
      Left = 327
      Top = 89
      Width = 186
      Height = 21
      TabOrder = 7
    end
    object EdtWebSite: TEdit
      Left = 60
      Top = 116
      Width = 453
      Height = 21
      TabOrder = 8
    end
    object CbxStatus: TComboBox
      Left = 327
      Top = 8
      Width = 186
      Height = 22
      Style = csOwnerDrawFixed
      TabOrder = 1
      Items.Strings = (
        'active'
        'inactive')
    end
    object EdtAddress: TEdit
      Left = 60
      Top = 143
      Width = 453
      Height = 21
      TabOrder = 9
    end
  end
  object pnButtons: TPanel
    Left = 0
    Top = 174
    Width = 523
    Height = 35
    Align = alBottom
    TabOrder = 1
    object SpdPrior: TSpeedButton
      Left = 172
      Top = 6
      Width = 23
      Height = 22
      Hint = 'Prior'
      Caption = #171
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SbtFirst: TSpeedButton
      Left = 143
      Top = 6
      Width = 23
      Height = 22
      Hint = 'First'
      Caption = #171#171
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SpdNext: TSpeedButton
      Left = 201
      Top = 6
      Width = 23
      Height = 22
      Hint = 'Next'
      Caption = #187
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SpdLast: TSpeedButton
      Left = 230
      Top = 6
      Width = 23
      Height = 22
      Hint = 'Last'
      Caption = #187#187
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SpdInsert: TSpeedButton
      Left = 288
      Top = 6
      Width = 23
      Height = 22
      Hint = 'Insert'
      Caption = '+'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SpdRemove: TSpeedButton
      Left = 317
      Top = 6
      Width = 23
      Height = 22
      Hint = 'Remove'
      Caption = #9472
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SpdLoad: TSpeedButton
      Left = 259
      Top = 6
      Width = 23
      Height = 22
      Hint = 'Load'
      Caption = #216
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SpdSave: TSpeedButton
      Left = 346
      Top = 6
      Width = 23
      Height = 22
      Hint = 'Save'
      Caption = #9632
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
end
