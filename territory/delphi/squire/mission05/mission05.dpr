//////////////////////////////////////////////////////////////
//  Author: Messias Bueno                                   //
//    Date: 28/09/2019                                      //
// Mission: Em uma aplica��o console, construa um programa  //
//          que leia uma lista de frases. Apresente ao      //
//          usu�rio apenas as frases que formam um          //
//          pal�ndromo                                      //
//////////////////////////////////////////////////////////////
program mission05;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  System.StrUtils;

function filterByPalindrome(var pList: TArray<string>): TArray<string>;
var
  aList: TArray<string>;
  sItem: string;
begin
  for sItem in pList do
  begin
    if (sItem.ToLower = ReverseString(sItem).ToLower) then
    begin
      SetLength(aList,Succ(Length(aList)));
      aList[Pred(Length(aList))] := sItem;
    end;
  end;

  Result := aList;
end;

procedure main;
var
  aList: TArray<String>;
  sValue: string;
  sItem: string;
begin
  while True do
  begin
    write('Enter a sentence or word "end" to end: ');
    readln(sValue);

    if (sValue.ToLower = 'end') then
      break;

    SetLength(aList,Succ(Length(aList)));
    aList[Pred(Length(aList))] := sValue;
  end;

  aList := filterByPalindrome(aList);

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
