//////////////////////////////////////////////////////////////
//  Author: Messias Bueno                                   //
//    Date: 28/09/2019                                      //
// Mission: Em uma aplicação console, construa um programa  //
//          que faça o cálculo fatorial do número informado //
//          pelo usuário.                                   //
//////////////////////////////////////////////////////////////
program mission01;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

function factorial(pValue: extended): extended;
begin
  if (pValue = 1) then
    Exit(pValue);

  result := pValue * (factorial(pValue - 1));
end;

procedure main;
var
  sValue: string;
  nValue: Extended;
  nResult: Extended;
begin
  while True do
  begin
    write('Enter a value greater than zero and less than twenty: ');
    readln(sValue);
    nValue := StrToInt64Def(sValue,0);

    if (nValue <= 0) or (nValue >= 20) then
    begin
      writeln('Enter a valid value.');
      writeln(EmptyStr);
      continue;
    end;

    nResult := factorial(nValue);
    writeln(Format('Fatorial de "%0.0f" é %0.0f',[nValue,nResult]));
    readln;
    break;
  end;
end;

begin
  main;
end.
