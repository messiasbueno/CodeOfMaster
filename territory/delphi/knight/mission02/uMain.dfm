object Main: TMain
  Left = 0
  Top = 0
  Caption = 'Mission02'
  ClientHeight = 399
  ClientWidth = 675
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object dbgProgram: TDBGrid
    Left = 0
    Top = 0
    Width = 675
    Height = 399
    Align = alClient
    DataSource = dsProgram
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'DisplayName'
        Title.Caption = 'Program'
        Width = 240
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DisplayVersion'
        Title.Caption = 'Version'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Publisher'
        Title.Caption = 'Enterprise'
        Width = 240
        Visible = True
      end>
  end
  object dsProgram: TDataSource
    Left = 504
    Top = 56
  end
end
