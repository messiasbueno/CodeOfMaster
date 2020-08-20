unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, Vcl.StdCtrls, Vcl.WinXPickers, Vcl.ExtCtrls,
  Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.ComCtrls, Vcl.Mask, FireDAC.Stan.StorageXML, Vcl.AppEvnts,
  System.Notification;

type
  TfMain = class(TForm)
    fdmtAlert: TFDMemTable;
    fdmtAlertDate: TDateField;
    fdmtAlertTime: TTimeField;
    fdmtAlertDescription: TStringField;
    dsAlert: TDataSource;
    dbgAlert: TDBGrid;
    fdmtAlertDone: TBooleanField;
    dbnAlert: TDBNavigator;
    dbeData: TDBEdit;
    dbeTime: TDBEdit;
    dbmDescription: TDBMemo;
    lblDescription: TLabel;
    lblDate: TLabel;
    lblTime: TLabel;
    FDStanStorageXMLLink: TFDStanStorageXMLLink;
    TrayIcon: TTrayIcon;
    ApplicationEvents: TApplicationEvents;
    Timer: TTimer;
    NotificationCenter: TNotificationCenter;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ApplicationEventsMinimize(Sender: TObject);
    procedure TrayIconDblClick(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure fdmtAlertFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure fdmtAlertAfterInsert(DataSet: TDataSet);
    procedure fdmtAlertAfterEdit(DataSet: TDataSet);
    procedure NotificationCenterReceiveLocalNotification(Sender: TObject;
      ANotification: TNotification);
  private
    procedure OpenSystem;
  public
    { Public declarations }
  end;

var
  fMain: TfMain;

implementation

{$R *.dfm}

uses
  System.DateUtils;

const
  cFile = 'Alert.xml';

procedure TfMain.FormCreate(Sender: TObject);
begin
  if FileExists(cFile) then
    fdmtAlert.LoadFromFile(cFile)
  else
    fdmtAlert.Active := True;
end;

procedure TfMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  fdmtAlert.SaveToFile(cFile);
end;

procedure TfMain.ApplicationEventsMinimize(Sender: TObject);
begin
  Self.Hide;
  Self.WindowState := wsMinimized;
  TrayIcon.Visible := True;
  TrayIcon.Animate := True;
  TrayIcon.ShowBalloonHint;
  Timer.Enabled := True;
end;

procedure TfMain.TrayIconDblClick(Sender: TObject);
begin
  Self.OpenSystem;
end;

procedure TfMain.TimerTimer(Sender: TObject);
var
  vNotification: TNotification;
begin
  Timer.Enabled := False;
  try
    fdmtAlert.Filtered := True;

    if not fdmtAlert.IsEmpty then
    begin
      vNotification := NotificationCenter.CreateNotification;
      try
        vNotification.Title := 'Alert';
        vNotification.AlertBody := fdmtAlertDescription.AsString;
        NotificationCenter.PresentNotification(vNotification);
      finally
        vNotification.Free;
      end;

      fdmtAlert.Edit;
      fdmtAlertDone.AsBoolean := True;
      fdmtAlert.Post;
    end;
  finally
    fdmtAlert.Filtered := False;
    Timer.Enabled := True;
  end;
end;

procedure TfMain.NotificationCenterReceiveLocalNotification(Sender: TObject;
  ANotification: TNotification);
begin
  Self.OpenSystem;
end;

procedure TfMain.OpenSystem;
begin
  Timer.Enabled := False;
  TrayIcon.Visible := False;
  Self.Show;
  WindowState := wsNormal;
  Application.BringToFront();
end;

procedure TfMain.fdmtAlertAfterEdit(DataSet: TDataSet);
begin
  fdmtAlertDone.AsBoolean := False;
end;

procedure TfMain.fdmtAlertAfterInsert(DataSet: TDataSet);
begin
  fdmtAlertDone.AsBoolean := False;
end;

procedure TfMain.fdmtAlertFilterRecord(DataSet: TDataSet; var Accept: Boolean);
var
  vAlert: int64;
  vNow: int64;
begin
  vAlert := DateTimeToMilliseconds(
    DataSet['Date']+DataSet['Time']
  );
  vNow := DateTimeToMilliseconds(Now);

 Accept := (not DataSet['Done']) and (vNow > vAlert);
end;

end.
