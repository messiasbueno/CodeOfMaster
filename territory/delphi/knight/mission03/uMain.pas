unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.FileCtrl, Vcl.Buttons,
  Vcl.ExtCtrls, System.Zip, Vcl.ComCtrls;

type
  TMain = class(TForm)
    OpenDialog: TOpenDialog;
    lbxFiles: TListBox;
    pnlAction: TPanel;
    spbZipar: TSpeedButton;
    spbRemoveFile: TSpeedButton;
    spbAddFile: TSpeedButton;
    pnlProgression: TPanel;
    pgbCompress: TProgressBar;
    lblProgression: TLabel;
    SaveDialog: TSaveDialog;
    procedure spbAddFileClick(Sender: TObject);
    procedure spbRemoveFileClick(Sender: TObject);
    procedure spbZiparClick(Sender: TObject);
  private
    procedure setCompress(const pValue: Boolean);
    function IsValidExtension(const pNameFile: string): Boolean;
  end;

var
  Main: TMain;

implementation

uses
  uZipFile,
  System.Math,
  Vcl.Dialogs.Helper;

{$R *.dfm}

procedure TMain.spbAddFileClick(Sender: TObject);
var
  vFile: string;
begin
  if (OpenDialog.Execute) then
  begin
    for vFile in OpenDialog.Files do
    begin
      if (Self.IsValidExtension(vFile)) and
         (lbxFiles.Items.IndexOf(vFile) = -1) then
        lbxFiles.Items.Add(vFile);
    end;
  end;
end;

procedure TMain.spbRemoveFileClick(Sender: TObject);
begin
  lbxFiles.DeleteSelected;
end;

procedure TMain.spbZiparClick(Sender: TObject);
var
  vZipFile: TControllerZip;
begin
  vZipFile := TControllerZip.Create;
  try
    if (not SaveDialog.Execute) then
      Exit;

    vZipFile.NameFile := SaveDialog.FileNameWithExtension;
    vZipFile.AddFile(lbxFiles.Items.ToStringArray);
    vZipFile.ProgessBar := Self.pgbCompress;

    Self.setCompress(True);
    try
      vZipFile.Compress;

      ShowMessage('Compression performed successfully');
    finally
      Self.setCompress(False);
    end;
  finally
    vZipFile.Destroy;
  end;
end;

function TMain.IsValidExtension(const pNameFile: string): Boolean;
begin
  Result := TControllerZip.IsValidExtension(pNameFile);
  if (not Result) then
    ShowMessage(Format('File extension "%s" is invalid',[pNameFile]));
end;

procedure TMain.setCompress(const pValue: Boolean);
begin
  pnlProgression.Visible := pValue;
  pnlAction.Enabled := not pValue;
end;

end.
