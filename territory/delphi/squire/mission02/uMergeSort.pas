unit uMergeSort;

interface

uses
  System.SysUtils, System.Math;

type
  TMergeSort = Class
  public
    class function Sort(const pList: TArray<Integer>): TArray<Integer>;
  end;
implementation

{ TMergeSort }

class function TMergeSort.Sort(const pList: TArray<Integer>): TArray<Integer>;
var
  aList: TArray<Integer>;
  aLeft: TArray<Integer>;
  aRight: TArray<Integer>;
  nMiddle: Integer;
  nIndex: Integer;
  nLeft: Integer;
  nRight: Integer;
begin
  if (Length(pList) <= 1) then
    Exit(pList);

  nMiddle := System.Math.Ceil(Length(pList)/2);

  SetLength(aList,Length(pList));
  SetLength(aLeft,nMiddle);
  SetLength(aRight,(Length(pList)-nMiddle));

  for nIndex := 0 to Pred(nMiddle) do
    aLeft[nIndex] := pList[nIndex];

  for nIndex := nMiddle  to Pred(Length(pList)) do
    aRight[(nIndex-nMiddle)] := pList[nIndex];

  aLeft := Sort(aLeft);
  aRight := Sort(aRight);

  nIndex := 0;
  nLeft := 0;
  nRight := 0;
  while (Length(aLeft) <> nLeft) and (Length(aRight) <> nRight) do
  begin
    if (aLeft[nLeft] <= aRight[nRight]) then
    begin
      aList[nIndex] := aLeft[nLeft];
      Inc(nLeft);
    end
    else
    begin
      aList[nIndex] := aRight[nRight];
      Inc(nRight);
    end;
    Inc(nIndex);
  end;

  while (Length(aLeft) <> nLeft) do
  begin
    aList[nIndex] := aLeft[nLeft];
    Inc(nLeft);
    Inc(nIndex);
  end;

  while (Length(aRight) <> nRight) do
  begin
    aList[nIndex] := aRight[nRight];
    Inc(nRight);
    Inc(nIndex);
  end;

  Result := aList;
end;

end.
