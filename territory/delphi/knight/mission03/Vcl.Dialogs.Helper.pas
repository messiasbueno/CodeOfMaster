unit Vcl.Dialogs.Helper;

interface

uses
  Vcl.Dialogs;

type
  TSaveDialogHelper = class helper for TSaveDialog
  private
    function GetListExtension: TArray<string>;
    function GetExtensionFilter: string;
  public
    function FileNameWithExtension: string;
  end;

implementation

uses
  System.SysUtils,
  System.Classes,
  System.Math;

{ TSaveDialogHelper }

function TSaveDialogHelper.FileNameWithExtension: string;
var
  vExtension: string;
  vFileName: string;
begin
  vExtension := Self.GetExtensionFilter;
  vFileName := Self.FileName;

  if (not vFileName.EndsWith(vExtension)) then
    vFileName := vFileName + vExtension;

  Result := vFileName;
end;

function TSaveDialogHelper.GetExtensionFilter: string;
var
  vExtension: TArray<string>;
begin
  vExtension := Self.GetListExtension;
  Result := vExtension[Pred(Self.FilterIndex)];
end;

function TSaveDialogHelper.GetListExtension: TArray<string>;
var
  vListExtension: TStringList;
  vExtension: string;
  vIndex: Integer;
begin
  vListExtension := TStringList.create;
  try
    vListExtension.Delimiter := '|';
    vListExtension.DelimitedText := Self.Filter;

    SetLength(Result,ZeroValue);
    vIndex := ZeroValue;
    for vExtension in vListExtension do
    begin
      if (Odd(vIndex)) then
      begin
        SetLength(Result,Succ(Length(Result)));
        Result[Pred(Length(Result))] := Copy(vExtension,2);
      end;
      Inc(vIndex);
    end;
  finally
    vListExtension.Free;
  end;
end;

end.
