unit uTask;

interface

uses
  System.Threading,
  System.SyncObjs,
  System.Classes,
  System.SysUtils,
  System.UITypes,
  System.Math,
  Vcl.StdCtrls,
  Vcl.Graphics,
  Winapi.Messages;

type
  RListFileParam = record
    Directory: string;
    List: TMemo;
    Message: TLabel
  end;

  TListFile = class
  private
    FTasks: TArray<ITask>;
  public
    procedure Add(pListFile: RListFileParam);
    procedure Run;

    class procedure setProcessing(pMessage: TLabel);
    class procedure setFinished(pMessage: TLabel);
    class procedure ListFile(pListFile: RListFileParam);
  end;



implementation

{ TListFile }

procedure TListFile.Add(pListFile: RListFileParam);
begin
  SetLength(Self.FTasks,Succ(Length(Self.FTasks)));
  Self.FTasks[Pred(Length(Self.FTasks))] := TTask.Create(
    procedure
    begin
      TListFile.setProcessing(pListFile.Message);
      TListFile.ListFile(pListFile);
      TListFile.setFinished(pListFile.Message);
    end
  );
end;

class procedure TListFile.ListFile(pListFile: RListFileParam);
var
  vSearchRec: TSearchRec;
  vListFile: RListFileParam;
  vSLFile: TStringList;
begin
  if (FindFirst(pListFile.Directory+'\*.*', faAnyFile, vSearchRec) <> ZeroValue) then
    Exit;

  vSLFile := TStringList.Create;
  try
    repeat
      if (vSearchRec.Attr and faDirectory = faDirectory) then
      begin
        if (vSearchRec.Name <> '.') and (vSearchRec.Name <> '..') then
        begin
          vListFile.Directory := pListFile.Directory+ '\' + vSearchRec.Name;
          vListFile.List := pListFile.List;
          TListFile.ListFile(vListFile);
        end;
      end
      else
      begin
        vSLFile.Add(vSearchRec.Name);
      end;
    until FindNext(vSearchRec) <> ZeroValue;

    pListFile.List.Lines.AddStrings(vSLFile);
    pListFile.List.Perform(EM_SCROLLCARET, 0, 0);
  finally
    FindClose(vSearchRec);
    vSLFile.free;
  end;
end;

procedure TListFile.Run;
var
  vTask: ITask;
begin
  for vTask in Self.FTasks do
    vTask.Start;
end;

class procedure TListFile.setFinished(pMessage: TLabel);
begin
  pMessage.Caption := 'Done';
  pMessage.Color := clLime;
end;

class procedure TListFile.setProcessing(pMessage: TLabel);
Const
 cOrange = $00449FDD;
begin
  pMessage.Caption := 'Processing';
  pMessage.Color := cOrange;
end;

end.
