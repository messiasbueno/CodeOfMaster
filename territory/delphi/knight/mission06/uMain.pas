unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IdComponent, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TfMain = class(TForm)
    BtnDownload: TButton;
    ProgressBar: TProgressBar;
    Lblreturn: TLabel;
    EdtURL: TEdit;
    LblURL: TLabel;
    procedure BtnDownloadClick(Sender: TObject);
  private
    procedure IdHTTPWork(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCount: Int64);
    procedure IdHTTPWorkBegin(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCountMax: Int64);
    procedure IdHTTPWorkEnd(ASender: TObject; AWorkMode: TWorkMode);

  public
    { Public declarations }
  end;

var
  fMain: TfMain;

implementation

uses
  uDownloadFile;

{$R *.dfm}

{ TForm1 }

procedure TfMain.BtnDownloadClick(Sender: TObject);
var
  vDownloadFile: TDownloadFile;
begin
  vDownloadFile := TDownloadFile.Create;
  vDownloadFile.Url := EdtURL.Text;
  vDownloadFile.OnWork := IdHTTPWork;
  vDownloadFile.OnWorkBegin := IdHTTPWorkBegin;
  vDownloadFile.OnWorkEnd := IdHTTPWorkEnd;
  vDownloadFile.Start;
end;

procedure TfMain.IdHTTPWork(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCount: Int64);
begin
  ProgressBar.Position := AWorkCount;

  Lblreturn.Caption := AWorkCount.ToString+'/'+ProgressBar.Max.ToString;
end;

procedure TfMain.IdHTTPWorkBegin(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCountMax: Int64);
begin
  ProgressBar.Position := 0;
  ProgressBar.Max := AWorkCountMax;

  Lblreturn.Caption := '0/'+AWorkCountMax.ToString;

  BtnDownload.Enabled := False;
end;

procedure TfMain.IdHTTPWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
begin
  ProgressBar.Position := ProgressBar.Max;

  Lblreturn.caption := ProgressBar.Max.ToString+'/'+ProgressBar.Max.ToString;

  BtnDownload.Enabled := True;
end;

end.

