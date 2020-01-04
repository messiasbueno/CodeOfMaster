unit uDirectory;

interface

type
  TDirectory = class
  public
    class function GetDirectories(const pDirectory: string): string;
  end;
implementation

uses
  System.SysUtils,
  System.Math;

{ TDirectory }

class function TDirectory.GetDirectories(const pDirectory: string): string;
var
  vSearchRec: TSearchRec;
begin
  Result := EmptyStr;

  if (FindFirst(pDirectory + '*.*', faAnyFile, vSearchRec) <> ZeroValue) then
    Exit;

  try
    Result := Format('"%s"',[pDirectory]);
    repeat
      if (vSearchRec.Name <> '.') and (vSearchRec.Name <> '..') then
      begin
        if (vSearchRec.Attr and faDirectory = faDirectory ) then
          Result := Format('%s,"%s"',[Result,pDirectory + vSearchRec.Name]);
      end;
    until FindNext(vSearchRec) <> ZeroValue;
  finally
    FindClose(vSearchRec);
  end;
end;

end.
