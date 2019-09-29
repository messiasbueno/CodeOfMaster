unit uUtils;

interface

uses
  System.SysUtils, System.StrUtils;

type
  TUtils = Class
  public
    class function ValidList(pList: string): Boolean;
    class function ArrayIntToStr(pList: TArray<Integer>): string;
    class function StrToArrayStr(pList: string): TArray<String>;
    class function StrToArrayInt(pList: string): TArray<Integer>;
  End;
implementation

{ TUtils }

class function TUtils.ArrayIntToStr(pList: TArray<Integer>): string;
var
  sItem: Integer;
  sList: string;
begin
  sList := EmptyStr;
  for sItem in pList do
  begin
    if sList.IsEmpty then
      sList := sItem.ToString
    else
      sList := Format('%s,%d',[sList,sItem]);
  end;

  Result := sList;
end;

class function TUtils.StrToArrayInt(pList: string): TArray<Integer>;
var
  sList: TArray<string>;
  nIndex: Integer;
begin
  sList := TUtils.StrToArrayStr(pList);

  SetLength(Result, Length(sList));
  for nIndex := 0 to Pred(Length(sList)) do
    Result[nIndex] := sList[nIndex].ToInteger;
end;

class function TUtils.StrToArrayStr(pList: string): TArray<String>;
begin
  Result := SplitString(pList,',');
end;

class function TUtils.ValidList(pList: string): Boolean;
var
  sList: TArray<string>;
  sItem: string;
begin
  if (pList.IsEmpty) then
  begin
    Writeln('List not informed');
    Exit(False);
  end;

  sList := TUtils.StrToArrayStr(pList);

  for sItem in sList do
  begin
    if (StrToIntDef(sItem,0) <= 0) then
    begin
      Writeln('List Item is not valid.');
      Exit(False);
    end;
  end;

  Result := True;
end;

end.
