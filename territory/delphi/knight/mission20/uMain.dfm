object fMain: TfMain
  Left = 0
  Top = 0
  Caption = 'fMain'
  ClientHeight = 299
  ClientWidth = 852
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
  object dbgEmployee: TDBGrid
    Left = 8
    Top = 48
    Width = 836
    Height = 243
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
        FieldName = 'ID'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Width = 140
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CIDADE'
        Width = 140
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMAIL'
        Width = 140
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATANASC'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PROFISSAO'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CARTAO'
        Width = 140
        Visible = True
      end>
  end
  object btnArrayDML: TButton
    Left = 8
    Top = 8
    Width = 836
    Height = 25
    Caption = 'Array DML'
    TabOrder = 1
    OnClick = btnArrayDMLClick
  end
  object FDConnection: TFDConnection
    Params.Strings = (
      
        'Database=D:\GIT\CodeOfMaster\territory\delphi\knight\mission20\D' +
        'ATABASE.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 80
    Top = 104
  end
  object fdqEmployee: TFDQuery
    Connection = FDConnection
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    SQL.Strings = (
      
        'INSERT INTO funcionario (id, nome, cidade, email, datanasc, prof' +
        'issao, cartao)'
      
        'VALUES (:id, :nome, :cidade, :email, :datanasc, :profissao, :car' +
        'tao)')
    Left = 80
    Top = 152
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'NOME'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Name = 'CIDADE'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Name = 'EMAIL'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Name = 'DATANASC'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'PROFISSAO'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Name = 'CARTAO'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end>
    object fdqEmployeeID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
    end
    object fdqEmployeeNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 100
    end
    object fdqEmployeeCIDADE: TStringField
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Size = 100
    end
    object fdqEmployeeEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 100
    end
    object fdqEmployeeDATANASC: TDateField
      FieldName = 'DATANASC'
      Origin = 'DATANASC'
    end
    object fdqEmployeePROFISSAO: TStringField
      FieldName = 'PROFISSAO'
      Origin = 'PROFISSAO'
      Size = 100
    end
    object fdqEmployeeCARTAO: TStringField
      FieldName = 'CARTAO'
      Origin = 'CARTAO'
      Size = 100
    end
  end
  object FDBatchMoveDataSetWriter: TFDBatchMoveDataSetWriter
    Direct = True
    DataSet = fdmEmployee
    Left = 712
    Top = 184
  end
  object FDBatchMove: TFDBatchMove
    Reader = FDBatchMoveTextReader
    Writer = FDBatchMoveDataSetWriter
    Options = [poClearDest, poIdentityInsert, poCreateDest, poSkipUnmatchedDestFields, poUseTransactions]
    Mappings = <>
    LogFileName = 'Data.log'
    Left = 712
    Top = 80
  end
  object FDBatchMoveTextReader: TFDBatchMoveTextReader
    DataDef.Fields = <>
    DataDef.WithFieldNames = True
    Encoding = ecUTF8
    Left = 712
    Top = 128
  end
  object dsEmployee: TDataSource
    DataSet = fdmEmployee
    Left = 568
    Top = 72
  end
  object fdmEmployee: TFDMemTable
    Active = True
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'NOME'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'CIDADE'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'EMAIL'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'DATANASC'
        DataType = ftDate
      end
      item
        Name = 'PROFISSAO'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'CARTAO'
        DataType = ftString
        Size = 100
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    FormatOptions.AssignedValues = [fvMaxBcdPrecision, fvMaxBcdScale]
    FormatOptions.MaxBcdPrecision = 2147483647
    FormatOptions.MaxBcdScale = 1073741823
    ResourceOptions.AssignedValues = [rvPersistent, rvSilentMode]
    ResourceOptions.Persistent = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 568
    Top = 128
    Content = {
      414442530F005430EC020000FF00010001FF02FF03040014000000460044004D
      0065006D005400610062006C00650005000A0000005400610062006C00650006
      0000000000070000080032000000090000FF0AFF0B0400040000004900440005
      0004000000490044000C00010000000E000D000F000110000111000112000113
      000114000115000400000049004400FEFF0B0400080000004E004F004D004500
      0500080000004E004F004D0045000C00020000000E0016001700640000000F00
      011000011100011200011300011400011500080000004E004F004D0045001800
      64000000FEFF0B04000C00000043004900440041004400450005000C00000043
      00490044004100440045000C00030000000E0016001700640000000F00011000
      0111000112000113000114000115000C00000043004900440041004400450018
      0064000000FEFF0B04000A00000045004D00410049004C0005000A0000004500
      4D00410049004C000C00040000000E0016001700640000000F00011000011100
      0112000113000114000115000A00000045004D00410049004C00180064000000
      FEFF0B04001000000044004100540041004E0041005300430005001000000044
      004100540041004E004100530043000C00050000000E0019000F000110000111
      000112000113000114000115001000000044004100540041004E004100530043
      00FEFF0B040012000000500052004F00460049005300530041004F0005001200
      0000500052004F00460049005300530041004F000C00060000000E0016001700
      640000000F000110000111000112000113000114000115001200000050005200
      4F00460049005300530041004F00180064000000FEFF0B04000C000000430041
      005200540041004F0005000C000000430041005200540041004F000C00070000
      000E0016001700640000000F000110000111000112000113000114000115000C
      000000430041005200540041004F00180064000000FEFEFF1AFEFF1BFEFF1CFE
      FEFEFF1DFEFF1EFF1FFEFEFE0E004D0061006E0061006700650072001E005500
      7000640061007400650073005200650067006900730074007200790012005400
      610062006C0065004C006900730074000A005400610062006C00650008004E00
      61006D006500140053006F0075007200630065004E0061006D0065000A005400
      6100620049004400240045006E0066006F0072006300650043006F006E007300
      74007200610069006E00740073001E004D0069006E0069006D0075006D004300
      6100700061006300690074007900180043006800650063006B004E006F007400
      4E0075006C006C00140043006F006C0075006D006E004C006900730074000C00
      43006F006C0075006D006E00100053006F007500720063006500490044000E00
      6400740049006E00740033003200100044006100740061005400790070006500
      1400530065006100720063006800610062006C006500120041006C006C006F00
      77004E0075006C006C000800420061007300650014004F0041006C006C006F00
      77004E0075006C006C0012004F0049006E005500700064006100740065001000
      4F0049006E00570068006500720065001A004F0072006900670069006E004300
      6F006C004E0061006D00650018006400740041006E0073006900530074007200
      69006E0067000800530069007A006500140053006F0075007200630065005300
      69007A0065000C006400740044006100740065001C0043006F006E0073007400
      7200610069006E0074004C00690073007400100056006900650077004C006900
      730074000E0052006F0077004C006900730074001800520065006C0061007400
      69006F006E004C006900730074001C0055007000640061007400650073004A00
      6F00750072006E0061006C000E004300680061006E00670065007300}
    object fdmEmployeeID: TIntegerField
      FieldName = 'ID'
    end
    object fdmEmployeeNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object fdmEmployeeCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 100
    end
    object fdmEmployeeEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 100
    end
    object fdmEmployeeDATANASC: TDateField
      FieldName = 'DATANASC'
    end
    object fdmEmployeePROFISSAO: TStringField
      FieldName = 'PROFISSAO'
      Size = 100
    end
    object fdmEmployeeCARTAO: TStringField
      FieldName = 'CARTAO'
      Size = 100
    end
  end
end
