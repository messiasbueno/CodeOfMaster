object fMain: TfMain
  Left = 0
  Top = 0
  Caption = 'fMain'
  ClientHeight = 484
  ClientWidth = 533
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
  object PageControl: TPageControl
    Left = 0
    Top = 0
    Width = 533
    Height = 449
    ActivePage = tbsDepartment
    Align = alTop
    TabOrder = 0
    object tbsEmployee: TTabSheet
      Caption = 'Funcionario'
      object dbgEmployee: TDBGrid
        AlignWithMargins = True
        Left = 3
        Top = 5
        Width = 519
        Height = 382
        Margins.Top = 5
        Align = alClient
        DataSource = dsEmployee
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'IDFUNCIONARIO'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Width = 250
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ADMISSAO'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SALARIO'
            Width = 100
            Visible = True
          end>
      end
      object dbnEmployee: TDBNavigator
        AlignWithMargins = True
        Left = 3
        Top = 393
        Width = 519
        Height = 25
        DataSource = dsEmployee
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel]
        Align = alBottom
        Flat = True
        TabOrder = 1
      end
    end
    object tbsDepartment: TTabSheet
      Caption = 'Departamento'
      ImageIndex = 1
      object lblDepartmentEmployees: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 205
        Width = 519
        Height = 19
        Align = alBottom
        BiDiMode = bdLeftToRight
        Caption = 'Department Employees'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBiDiMode = False
        ParentFont = False
        ExplicitWidth = 164
      end
      object dbgDepartment: TDBGrid
        AlignWithMargins = True
        Left = 3
        Top = 5
        Width = 519
        Height = 153
        Margins.Top = 5
        Align = alTop
        DataSource = dsDepartment
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'IDDEPARTAMENTO'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Width = 350
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TELEFONE'
            Width = 100
            Visible = True
          end>
      end
      object dbnDepartment: TDBNavigator
        Left = 0
        Top = 161
        Width = 525
        Height = 25
        Margins.Top = 5
        DataSource = dsDepartment
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel]
        Align = alTop
        Flat = True
        TabOrder = 1
        ExplicitTop = 166
      end
      object dbgEmployeeDepartment: TDBGrid
        AlignWithMargins = True
        Left = 3
        Top = 230
        Width = 519
        Height = 153
        Margins.Bottom = 5
        Align = alBottom
        DataSource = dsEmployeeDepartment
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'IDDEPARTAMENTO'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'IDFUNCIONARIO'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'nameEmployee'
            Width = 450
            Visible = True
          end>
      end
      object dbnEmployeeDepartment: TDBNavigator
        AlignWithMargins = True
        Left = 3
        Top = 391
        Width = 519
        Height = 25
        Margins.Bottom = 5
        DataSource = dsEmployeeDepartment
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel]
        Align = alBottom
        Flat = True
        TabOrder = 3
      end
    end
  end
  object btnSave: TButton
    Left = 8
    Top = 455
    Width = 92
    Height = 25
    Caption = 'Save'
    TabOrder = 1
    OnClick = btnSaveClick
  end
  object FDConnection: TFDConnection
    Params.Strings = (
      
        'Database=D:\GIT\CodeOfMaster\territory\delphi\knight\mission14\D' +
        'ATABASE.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'DriverID=FB')
    LoginPrompt = False
    Left = 216
    Top = 88
  end
  object fdqDepartment: TFDQuery
    CachedUpdates = True
    Connection = FDConnection
    SchemaAdapter = fdsaEmployeeDepartment
    FetchOptions.AssignedValues = [evMode, evDetailCascade, evDetailServerCascade]
    UpdateOptions.AssignedValues = [uvGeneratorName, uvAutoCommitUpdates]
    UpdateOptions.GeneratorName = 'seq_departamento'
    UpdateOptions.AutoCommitUpdates = True
    SQL.Strings = (
      'SELECT *'
      '  FROM departamento')
    Left = 368
    Top = 88
    object fdqDepartmentIDDEPARTAMENTO: TIntegerField
      AutoGenerateValue = arAutoInc
      DisplayLabel = 'Id'
      FieldName = 'IDDEPARTAMENTO'
      Origin = 'IDDEPARTAMENTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
      Visible = False
    end
    object fdqDepartmentDESCRICAO: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 100
    end
    object fdqDepartmentTELEFONE: TStringField
      DisplayLabel = 'Phone'
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
      EditMask = '!\(999\)9999-9999;0;_'
    end
  end
  object dsDepartment: TDataSource
    DataSet = fdqDepartment
    Left = 456
    Top = 88
  end
  object fdqEmployee: TFDQuery
    Connection = FDConnection
    UpdateOptions.AssignedValues = [uvGeneratorName]
    UpdateOptions.GeneratorName = 'seq_funcionario'
    SQL.Strings = (
      'select * from funcionario')
    Left = 32
    Top = 80
    object fdqEmployeeIDFUNCIONARIO: TIntegerField
      AutoGenerateValue = arAutoInc
      DisplayLabel = 'Id'
      FieldName = 'IDFUNCIONARIO'
      Origin = 'IDFUNCIONARIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
      Visible = False
    end
    object fdqEmployeeNOME: TStringField
      DisplayLabel = 'Name'
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 100
    end
    object fdqEmployeeADMISSAO: TDateField
      DisplayLabel = 'Admission date'
      FieldName = 'ADMISSAO'
      Origin = 'ADMISSAO'
      EditMask = '!99/99/9999;1;_'
    end
    object fdqEmployeeSALARIO: TCurrencyField
      DisplayLabel = 'Salary'
      FieldName = 'SALARIO'
      Origin = 'SALARIO'
    end
  end
  object dsEmployee: TDataSource
    DataSet = fdqEmployee
    Left = 104
    Top = 88
  end
  object fdsaEmployeeDepartment: TFDSchemaAdapter
    ResourceOptions.AssignedValues = [rvStoreItems]
    ResourceOptions.StoreItems = [siMeta, siData, siDelta, siVisible]
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvUpdateMode, uvLockMode, uvLockPoint, uvLockWait, uvRefreshMode, uvFetchGeneratorsPoint, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable, uvAutoCommitUpdates]
    UpdateOptions.UpdateChangedFields = False
    UpdateOptions.LockWait = True
    UpdateOptions.RefreshMode = rmAll
    UpdateOptions.FetchGeneratorsPoint = gpNone
    UpdateOptions.CheckRequired = False
    UpdateOptions.CheckReadOnly = False
    UpdateOptions.CheckUpdatable = False
    UpdateOptions.AutoCommitUpdates = True
    UpdateOptions.KeyFields = 'iddepartamento'
    Left = 264
    Top = 344
  end
  object fdqEmployeeDepartment: TFDQuery
    CachedUpdates = True
    IndexFieldNames = 'IDDEPARTAMENTO'
    MasterSource = dsDepartment
    MasterFields = 'IDDEPARTAMENTO'
    DetailFields = 'IDDEPARTAMENTO'
    Connection = FDConnection
    SchemaAdapter = fdsaEmployeeDepartment
    FetchOptions.AssignedValues = [evMode, evDetailCascade, evDetailServerCascade]
    FetchOptions.Mode = fmAll
    FetchOptions.DetailCascade = True
    FetchOptions.DetailServerCascade = True
    UpdateOptions.AssignedValues = [uvAutoCommitUpdates]
    UpdateOptions.AutoCommitUpdates = True
    SQL.Strings = (
      'select * from funcionario_departamento')
    Left = 64
    Top = 304
    object fdqEmployeeDepartmentIDDEPARTAMENTO: TIntegerField
      AutoGenerateValue = arAutoInc
      DisplayLabel = 'Department'
      FieldName = 'IDDEPARTAMENTO'
      Origin = 'IDDEPARTAMENTO'
      Visible = False
    end
    object fdqEmployeeDepartmentIDFUNCIONARIO: TIntegerField
      DisplayLabel = 'Employee'
      FieldName = 'IDFUNCIONARIO'
      Origin = 'IDFUNCIONARIO'
      Visible = False
    end
    object fdqEmployeeDepartmentnomeFuncionario: TStringField
      DisplayLabel = 'Employee'
      FieldKind = fkLookup
      FieldName = 'nameEmployee'
      LookupDataSet = fdqEmployee
      LookupKeyFields = 'IDFUNCIONARIO'
      LookupResultField = 'NOME'
      KeyFields = 'IDFUNCIONARIO'
      Size = 50
      Lookup = True
    end
  end
  object dsEmployeeDepartment: TDataSource
    DataSet = fdqEmployeeDepartment
    Left = 152
    Top = 328
  end
end
