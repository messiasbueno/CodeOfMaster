object fMain: TfMain
  Left = 0
  Top = 0
  Caption = 'Alert'
  ClientHeight = 299
  ClientWidth = 706
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblDescription: TLabel
    Left = 8
    Top = 11
    Width = 53
    Height = 13
    Caption = 'Description'
  end
  object lblDate: TLabel
    Left = 589
    Top = 11
    Width = 23
    Height = 13
    Caption = 'Date'
  end
  object lblTime: TLabel
    Left = 590
    Top = 38
    Width = 22
    Height = 13
    Caption = 'Time'
  end
  object dbgAlert: TDBGrid
    Left = 8
    Top = 93
    Width = 689
    Height = 198
    TabStop = False
    DataSource = dsAlert
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Date'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Time'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Description'
        Width = 400
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Done'
        Width = 50
        Visible = True
      end>
  end
  object dbnAlert: TDBNavigator
    Left = 5
    Top = 62
    Width = 693
    Height = 25
    DataSource = dsAlert
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel]
    TabOrder = 3
  end
  object dbeData: TDBEdit
    Left = 618
    Top = 8
    Width = 80
    Height = 21
    DataField = 'Date'
    DataSource = dsAlert
    TabOrder = 1
  end
  object dbeTime: TDBEdit
    Left = 618
    Top = 35
    Width = 80
    Height = 21
    DataField = 'Time'
    DataSource = dsAlert
    TabOrder = 2
  end
  object dbmDescription: TDBMemo
    Left = 67
    Top = 8
    Width = 516
    Height = 48
    DataField = 'Description'
    DataSource = dsAlert
    TabOrder = 0
  end
  object fdmtAlert: TFDMemTable
    AfterInsert = fdmtAlertAfterInsert
    AfterEdit = fdmtAlertAfterEdit
    OnFilterRecord = fdmtAlertFilterRecord
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
    Left = 56
    Top = 200
    object fdmtAlertDate: TDateField
      FieldName = 'Date'
      EditMask = '!99/99/9999;1;_'
    end
    object fdmtAlertTime: TTimeField
      FieldName = 'Time'
      DisplayFormat = 'hh:mm'
      EditMask = '!99:99;1;_'
    end
    object fdmtAlertDescription: TStringField
      FieldName = 'Description'
      Size = 300
    end
    object fdmtAlertDone: TBooleanField
      FieldName = 'Done'
    end
  end
  object dsAlert: TDataSource
    DataSet = fdmtAlert
    Left = 120
    Top = 200
  end
  object FDStanStorageXMLLink: TFDStanStorageXMLLink
    Left = 64
    Top = 152
  end
  object TrayIcon: TTrayIcon
    Hint = 'System running in the background'
    OnDblClick = TrayIconDblClick
    Left = 456
    Top = 176
  end
  object ApplicationEvents: TApplicationEvents
    OnMinimize = ApplicationEventsMinimize
    Left = 456
    Top = 128
  end
  object Timer: TTimer
    Enabled = False
    OnTimer = TimerTimer
    Left = 456
    Top = 224
  end
  object NotificationCenter: TNotificationCenter
    OnReceiveLocalNotification = NotificationCenterReceiveLocalNotification
    Left = 560
    Top = 200
  end
end
