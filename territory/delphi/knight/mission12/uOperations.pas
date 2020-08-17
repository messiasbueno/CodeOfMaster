unit uOperations;

interface

uses
  System.SysUtils,
  System.Math;

type
  TOperations = class
  private
    function Sort(Const pWord: string): string;
  public
    function SortLetters(Const pWord: string): string;
    function CountOccurrences(Const pWord, pLetter: string): integer;
    function RemoveAccents(Const pWord: string): string;
  end;

  EWordIsEmpty = Class(Exception);
  ELetterIsEmpty = Class(Exception);
  ENoAlphaNumeric = Class(Exception);

implementation

{ TOperations }

function TOperations.CountOccurrences(const pWord, pLetter: string): integer;
var
  vLetter: string;
begin
  if pWord.Trim.IsEmpty then
    raise EWordIsEmpty.Create('Word is empty');

  if pLetter.Trim.IsEmpty then
    raise ELetterIsEmpty.Create('Letter is empty');

  Result := ZeroValue;
  for vLetter in pWord do
    if LowerCase(vLetter) = LowerCase(pLetter) then
      Inc(Result);
end;

function TOperations.RemoveAccents(const pWord: string): string;
type
  USAscii20127 = type AnsiString(20127);
const
  cCharsValid = ['0'..'9', 'a'..'z', 'A'..'Z'];
var
  vLetter: char;
begin
  Result := string(USAscii20127(pWord));

  for vLetter in Result do
    if not CharInSet(vLetter, cCharsValid) then
      raise ENoAlphaNumeric.Create('Word invalid');
end;

function TOperations.SortLetters(const pWord: string): string;
begin
  Result := Self.Sort(pWord);
end;

function TOperations.Sort(Const pWord: string): string;
var
 vIndexA: integer;
 vIndexB: integer;
 vWord: string;
 vTemp: char;
begin
  vWord := pWord;
  for vIndexA := PositiveValue to Pred(pWord.Length) do
  begin
    for vIndexB := Succ(vIndexA) to pWord.Length do
    begin
      if LowerCase(vWord[vIndexA]) > LowerCase(vWord[vIndexB]) then
      begin
        vTemp := vWord[vIndexA];
        vWord[vIndexA] := vWord[vIndexB];
        vWord[vIndexB] := vTemp;
      end;
    end;
  end;

  Result := vWord;
end;

end.
