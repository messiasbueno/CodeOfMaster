//////////////////////////////////////////////////////////////
//  Author: Messias Bueno                                   //
//    Date: 28/09/2019                                      //
// Mission: Em uma aplica��o console, construa um programa  //
//          que leia uma lista de n�meros informada pelo    //
//          usu�rio. Em seguida, atrav�s do algoritmo       //
//          merge-sort, fa�a a ordena��o da lista e         //
//          apresente o resultado.                          //
//////////////////////////////////////////////////////////////
program mission02;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  uMergeSort in 'uMergeSort.pas',
  uUtils in 'uUtils.pas';

procedure main;
var
  sList: string;
  aList: TArray<Integer>;
begin
  while True do
  begin
    write('Enter a comma-separated list of numbers: ');
    readln(sList);

    if not TUtils.ValidList(sList) then
    begin
      writeln(EmptyStr);
      continue;
    end;

    aList := TMergeSort.Sort(TUtils.StrToArrayInt(sList));

    Writeln('Ordered List: ' + TUtils.ArrayIntToStr(aList));
    readln;
    break;
  end;
end;

begin
  main;
end.
