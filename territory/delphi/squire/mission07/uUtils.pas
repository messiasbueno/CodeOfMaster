unit uUtils;

interface

type
  TUtils = class
  private
    function getExtensive(const pValue: string): string;
    function getScale(const pScale: SmallInt): string;
  public
    function valueByExtensive(const pValue: Currency): string;
  end;
implementation

uses
 System.SysUtils,
 System.Math,
 System.StrUtils;

const
  cSpace: string = ' ';

{ TUtils }

function TUtils.valueByExtensive(const pValue: Currency): string;
Const
  cDivision: SmallInt = 3;
  cCent: string = ' cent';
  cCents: string = ' cents';
  cDollar: string = ' dollar';
  cDollars: string = ' dolars';
var
  nDollars: Int64;
  nCents: SmallInt;
  nDivisions: SmallInt;
  vIndex: Integer;
  sDollars: string;
  aDollars: TArray<String>;

  sExtensive: string;
begin
  nDollars := Trunc(pValue);
  nCents := Trunc((pValue - nDollars) * 100);

  sDollars := ReverseString(nDollars.ToString);
  nDivisions := Ceil(Length(sDollars) / cDivision);

  SetLength(aDollars,nDivisions);
  for vIndex := nDivisions downto 1 do
    aDollars[(nDivisions-vIndex)] := ReverseString(
      Copy(sDollars,Succ(cDivision*Pred(vIndex)),cDivision));

  sExtensive := EmptyStr;
  for sDollars in aDollars do
  begin
    if (sExtensive <> EmptyStr) then
      sExtensive := sExtensive + cSpace;

    sExtensive := sExtensive + getExtensive(sDollars) + getScale(nDivisions);
    Dec(nDivisions);
  end;
  if (nDollars > ZeroValue) then
  begin
    if (Trim(sExtensive) = 'one') then
     sExtensive := sExtensive + cDollar
    else
     sExtensive := sExtensive + cDollars;
  end;

  if (nCents > ZeroValue) then
  begin
    if (nDollars > ZeroValue) then
      sExtensive := sExtensive + ' and';

    sExtensive := sExtensive + getExtensive(nCents.ToString);
    if (nCents = 1) then
      sExtensive := sExtensive + cCent
    else
      sExtensive := sExtensive + cCents;
  end;

  Result := Trim(sExtensive);
end;

function TUtils.getExtensive(const pValue: string): string;
const
  cIndexCentena: SmallInt = 1;
  cIndexDezena: SmallInt = 2;
  cIndexUnidade: SmallInt = 3;
  cUnit: TArray<string> = [
    'one', 'two', 'three', 'four', 'five',
    'six', 'seven', 'eight', 'nine', 'ten', 'eleven',
    'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen',
    'seventeen', 'eighteen', 'nineteen'
  ];
  cDicker: TArray<string> = [
    'twenty', 'thirty', 'forty', 'fifty',
    'sixty', 'seventy', 'eighty', 'ninety'
  ];
  cHundred: string = 'hundred';
var
  sValue: string;
  sExtensive: string;
begin
  sValue := pValue;
  while (Length(sValue) < 3) do
    sValue := '0' + sValue;

  sExtensive := EmptyStr;
  if (string(sValue[cIndexCentena]).ToInteger > 0) then
    sExtensive := sExtensive + cUnit[Pred(string(sValue[cIndexCentena]).ToInteger)] +
      cSpace + cHundred;

  sExtensive := EmptyStr;
  if (string(sValue[cIndexCentena]).ToInteger > 0) then
    sExtensive := sExtensive + cUnit[Pred(string(sValue[cIndexCentena]).ToInteger)] +
      cSpace + cHundred;

  if (string(sValue[cIndexDezena]).ToInteger = 1) then
    sExtensive := sExtensive + cSpace + cUnit[Pred(Copy(sValue,cIndexDezena).ToInteger)]
  else
  begin
    if (string(sValue[cIndexDezena]).ToInteger > 1) then
      sExtensive := sExtensive + cSpace + cDicker[(string(sValue[cIndexDezena]).ToInteger)-2];
    if (string(sValue[cIndexUnidade]).ToInteger > 0) then
      sExtensive := sExtensive + cSpace + cUnit[Pred(string(sValue[cIndexUnidade]).ToInteger)];
  end;

  Result := sExtensive;
end;

function TUtils.getScale(const pScale: SmallInt): string;
const
  cScale: TArray<string> = [
    'thousand', 'million', 'billion', 'trillion'
  ];
begin
  if (pScale = 1) then
    Exit(EmptyStr);

  Result := cSpace + cScale[(pScale - 2)];
end;

end.
