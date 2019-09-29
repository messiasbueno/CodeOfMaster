//////////////////////////////////////////////////////////////
//  Author: Messias Bueno                                   //
//    Date: 28/09/2019                                      //
// Mission: Escreva uma aplicação console que receba uma    //
//          lista de nomes completos (nome e sobrenome)     //
//          informados pelo usuário. Estes nomes deverão    //
//          ser convertidos para caixa-mista, ou seja,      //
//          as iniciais de cada nome devem ser maiúsculas.  //
//          Leve em consideração que as preposições (“de”,  //
//          “do”, “dos”, ”e”, etc.) devem ser convertidas   //
//          para minúsculas                                 //
//////////////////////////////////////////////////////////////
program mission04;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  System.StrUtils;

function convertMixedBox(pWord: string): string; overload;
begin
  Result := string(pWord[1]).toUpper + Copy(pWord,2);
end;

procedure convertMixedBox(pList: TArray<string>); overload;
const
  cDelimiter: string = ' ';
var
  nIndex: Integer;
  sModifiedWord: string;
  sWord: string;
begin
  for nIndex := 0 to Pred(Length(pList)) do
  begin
    sModifiedWord := EmptyStr;
    for sWord in SplitString(pList[nIndex],cDelimiter) do
    begin
      if (sModifiedWord.IsEmpty) then
        sModifiedWord := convertMixedBox(sWord)
      else if (Length(sWord) > 3) then
        sModifiedWord := sModifiedWord + cDelimiter + convertMixedBox(sWord)
      else
        sModifiedWord := sModifiedWord + cDelimiter +  sWord;
    end;
    pList[nIndex] := sModifiedWord;
  end;
end;

procedure main;
var
  aList: TArray<String>;
  sValue: string;
  sItem: string;
begin
  while True do
  begin
    write('Enter a name or the word "end" to end: ');
    readln(sValue);

    if (sValue.ToLower = 'end') then
      break;

    SetLength(aList,Succ(Length(aList)));
    aList[Pred(Length(aList))] := sValue;
  end;

  convertMixedBox(aList);

  Writeln(EmptyStr);
  Writeln('=================== List ===================');
  for sItem in aList do
  begin
    Writeln(sItem);
  end;
  Writeln('============================================');
  readln;
end;

begin
  main;
end.
