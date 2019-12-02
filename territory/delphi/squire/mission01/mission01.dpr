//////////////////////////////////////////////////////////////
//  Author: Messias Bueno                                   //
//    Date: 28/09/2019                                      //
// Mission: Em uma aplica��o console, construa um programa  //
//          que fa�a o c�lculo fatorial do n�mero informado //
//          pelo usu�rio.                                   //
//////////////////////////////////////////////////////////////
program mission01;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

function factorial(const pValue: extended): extended;
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
  repeat
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
    writeln(Format('Factorial of "%0.0f" is %0.0f',[nValue,nResult]));
    readln;
    break;
  until False;
end;

begin
  ReportMemoryLeaksOnShutdown := True;
  main;
end.
