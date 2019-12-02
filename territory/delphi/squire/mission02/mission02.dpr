//////////////////////////////////////////////////////////////
//  Author: Messias Bueno                                   //
//    Date: 28/09/2019                                      //
// Mission: Em uma aplicação console, construa um programa  //
//          que leia uma lista de números informada pelo    //
//          usuário. Em seguida, através do algoritmo       //
//          merge-sort, faça a ordenação da lista e         //
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
  repeat
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
  until False;
end;

begin
  ReportMemoryLeaksOnShutdown := True;
  main;
end.
