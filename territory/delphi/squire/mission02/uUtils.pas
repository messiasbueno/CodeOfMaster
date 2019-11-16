unit uUtils;

interface

uses
  System.SysUtils, System.StrUtils;

type
  TUtils = Class
  public
    class function ValidList(const pList: string): Boolean;
    class function ArrayIntToStr(const pList: TArray<Integer>): string;
    class function StrToArrayStr(const pList: string): TArray<String>;
    class function StrToArrayInt(const pList: string): TArray<Integer>;
  End;
implementation

uses
  System.Math;

{ TUtils }

class function TUtils.ArrayIntToStr(const pList: TArray<Integer>): string;
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

class function TUtils.StrToArrayInt(const pList: string): TArray<Integer>;
var
  sList: TArray<string>;
  nIndex: Integer;
begin
  sList := TUtils.StrToArrayStr(pList);

  SetLength(Result, Length(sList));
  for nIndex := System.Math.ZeroValue to Pred(Length(sList)) do
    Result[nIndex] := sList[nIndex].ToInteger;
end;

class function TUtils.StrToArrayStr(const pList: string): TArray<String>;
begin
  Result := SplitString(pList,',');
end;

class function TUtils.ValidList(const pList: string): Boolean;
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
    if (StrToIntDef(sItem,System.Math.ZeroValue) <= System.Math.ZeroValue) then
    begin
      Writeln('List Item is not valid.');
      Exit(False);
    end;
  end;

  Result := True;
end;

end.
