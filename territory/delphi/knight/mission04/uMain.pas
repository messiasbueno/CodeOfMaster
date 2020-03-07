unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.WinXCtrls;

type
  TMain = class(TForm)
    PnlTask1: TPanel;
    MmoTask1: TMemo;
    SbxTask1: TSearchBox;
    PnlTask2: TPanel;
    MmoTask2: TMemo;
    SbxTask2: TSearchBox;
    PnlTask3: TPanel;
    MmoTask3: TMemo;
    SbxTask3: TSearchBox;
    PnlActions: TPanel;
    BtnProcess: TButton;
    LblTask1: TLabel;
    LblTask2: TLabel;
    LblTask3: TLabel;
    procedure SbxTaskInvokeSearch(Sender: TObject);
    procedure BtnProcessClick(Sender: TObject);
  private
    procedure ValidParams;
  end;

var
  Main: TMain;

implementation

uses
  uTask;

{$R *.dfm}

procedure TMain.BtnProcessClick(Sender: TObject);
var
  vListFile: TListFile;
  vListFileParam: TArray<RListFileParam>;
begin
  Self.ValidParams;

  vListFile := TListFile.Create;
  try
    SetLength(vListFileParam,3);
    vListFileParam[0].Directory := SbxTask1.Text;
    vListFileParam[0].List := MmoTask1;
    vListFileParam[0].Message := LblTask1;
    vListFileParam[1].Directory := SbxTask2.Text;
    vListFileParam[1].List := MmoTask2;
    vListFileParam[1].Message := LblTask2;
    vListFileParam[2].Directory := SbxTask3.Text;
    vListFileParam[2].List := MmoTask3;
    vListFileParam[2].Message := LblTask3;
    vListFile.Add(vListFileParam[0]);
    vListFile.Add(vListFileParam[1]);
    vListFile.Add(vListFileParam[2]);
    vListFile.Run;
  finally
    vListFile.Free;
  end;
end;

procedure TMain.SbxTaskInvokeSearch(Sender: TObject);
var
  vFolderDialog: TFileOpenDialog;
begin
  vFolderDialog := TFileOpenDialog.Create(Nil);
  try
    vFolderDialog.Options := [fdoPickFolders, fdoPathMustExist, fdoForceFileSystem];
    if (vFolderDialog.Execute) then
    begin
      TSearchBox(Sender).Text := vFolderDialog.FileName;
    end;
  finally
    vFolderDialog.Free;
  end;
end;

procedure TMain.ValidParams;
begin
  if (not DirectoryExists(SbxTask1.Text)) then
  begin
    SbxTask1.SetFocus;
    raise Exception.Create('Directory invalid.');
  end;
  if (not DirectoryExists(SbxTask2.Text)) then
  begin
    SbxTask2.SetFocus;
    raise Exception.Create('Directory invalid.');
  end;
  if (not DirectoryExists(SbxTask3.Text)) then
  begin
    SbxTask3.SetFocus;
    raise Exception.Create('Directory invalid.');
  end;
  if (LblTask1.Caption = 'Processing') or
     (LblTask2.Caption = 'Processing') or
     (LblTask3.Caption = 'Processing') then
    raise Exception.Create('Active processing.');
end;

end.
