object fMain: TfMain
  Left = 0
  Top = 0
  Caption = 'fMain'
  ClientHeight = 299
  ClientWidth = 639
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid: TDBGrid
    Left = 0
    Top = 41
    Width = 639
    Height = 258
    Align = alClient
    DataSource = DataSource
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Panel: TPanel
    Left = 0
    Top = 0
    Width = 639
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitLeft = 592
    ExplicitTop = 88
    ExplicitWidth = 185
    object Edit: TEdit
      Left = 8
      Top = 11
      Width = 505
      Height = 21
      TabOrder = 0
    end
    object Button: TButton
      Left = 519
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Search'
      TabOrder = 1
      OnClick = ButtonClick
    end
  end
  object RESTRequest: TRESTRequest
    Client = RESTClient
    Params = <>
    Resource = 'users'
    Response = RESTResponse
    Left = 88
    Top = 104
  end
  object RESTClient: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    BaseURL = 'https://api.github.com'
    ContentType = 'application/json'
    Params = <>
    Left = 24
    Top = 104
  end
  object RESTResponse: TRESTResponse
    ContentType = 'application/json'
    Left = 160
    Top = 104
  end
  object RESTResponseDataSetAdapter: TRESTResponseDataSetAdapter
    Dataset = FDMemTable
    FieldDefs = <>
    Response = RESTResponse
    StringFieldSize = 20
    Left = 344
    Top = 112
  end
  object FDMemTable: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 496
    Top = 64
    object FDMemTablelogin: TWideStringField
      FieldName = 'login'
    end
    object FDMemTableid: TWideStringField
      FieldName = 'id'
    end
    object FDMemTablenode_id: TWideStringField
      FieldName = 'node_id'
    end
    object FDMemTableavatar_url: TWideStringField
      FieldName = 'avatar_url'
    end
    object FDMemTablegravatar_id: TWideStringField
      FieldName = 'gravatar_id'
    end
    object FDMemTableurl: TWideStringField
      FieldName = 'url'
    end
    object FDMemTablehtml_url: TWideStringField
      FieldName = 'html_url'
    end
    object FDMemTablefollowers_url: TWideStringField
      FieldName = 'followers_url'
    end
    object FDMemTablefollowing_url: TWideStringField
      FieldName = 'following_url'
    end
    object FDMemTablegists_url: TWideStringField
      FieldName = 'gists_url'
    end
    object FDMemTablestarred_url: TWideStringField
      FieldName = 'starred_url'
    end
    object FDMemTablesubscriptions_url: TWideStringField
      FieldName = 'subscriptions_url'
    end
    object FDMemTableorganizations_url: TWideStringField
      FieldName = 'organizations_url'
    end
    object FDMemTablerepos_url: TWideStringField
      FieldName = 'repos_url'
    end
    object FDMemTableevents_url: TWideStringField
      FieldName = 'events_url'
    end
    object FDMemTablereceived_events_url: TWideStringField
      FieldName = 'received_events_url'
    end
    object FDMemTabletype: TWideStringField
      FieldName = 'type'
    end
    object FDMemTablesite_admin: TWideStringField
      FieldName = 'site_admin'
    end
  end
  object DataSource: TDataSource
    DataSet = FDMemTable
    Left = 568
    Top = 64
  end
end
