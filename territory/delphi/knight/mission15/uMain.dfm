object fMain: TfMain
  Left = 0
  Top = 0
  Caption = 'fMain'
  ClientHeight = 404
  ClientWidth = 800
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblCity: TLabel
    Left = 8
    Top = 11
    Width = 19
    Height = 13
    Caption = 'City'
  end
  object dbgLocal: TDBGrid
    Left = 8
    Top = 35
    Width = 784
    Height = 358
    DataSource = dsLocal
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome'
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'idcidade'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nomeCidade'
        Width = 300
        Visible = True
      end>
  end
  object edtCity: TEdit
    Left = 33
    Top = 8
    Width = 759
    Height = 21
    TabOrder = 1
    OnChange = edtCityChange
  end
  object FDStanStorageXMLLink: TFDStanStorageXMLLink
    Left = 48
    Top = 160
  end
  object FDLocalSQL: TFDLocalSQL
    Connection = FDConnection
    DataSets = <
      item
        DataSet = fdmtCustomer
        Name = 'Customer'
      end
      item
        DataSet = fdmtCity
        Name = 'City'
      end>
    Left = 616
    Top = 168
  end
  object dsLocal: TDataSource
    AutoEdit = False
    DataSet = fdqLocal
    Left = 736
    Top = 168
  end
  object FDPhysSQLiteDriverLink: TFDPhysSQLiteDriverLink
    Left = 712
    Top = 120
  end
  object FDConnection: TFDConnection
    Params.Strings = (
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 616
    Top = 120
  end
  object fdqLocal: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT Customer.id,'
      '       Customer.nome,'
      '       Customer.idCidade,'
      '       City.nome AS nomeCidade'
      '  FROM Customer'
      '  JOIN City ON City.IdCidade = Customer.IdCidade')
    Left = 680
    Top = 168
    object fdqLocalid: TLargeintField
      DisplayLabel = 'Customer'
      FieldName = 'id'
      Origin = 'id'
    end
    object fdqLocalnome: TStringField
      DisplayLabel = 'Customer name'
      FieldName = 'nome'
      Origin = 'nome'
      Size = 150
    end
    object fdqLocalidcidade: TLargeintField
      DisplayLabel = 'City'
      FieldName = 'idcidade'
      Origin = 'idcidade'
    end
    object fdqLocalnomeCidade: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'City name'
      FieldName = 'nomeCidade'
      Origin = 'nome'
      ProviderFlags = []
      ReadOnly = True
      Size = 150
    end
  end
  object fdmtCustomer: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 32
    Top = 104
  end
  object fdmtCity: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 104
    Top = 112
  end
end
