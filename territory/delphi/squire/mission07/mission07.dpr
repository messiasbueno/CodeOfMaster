//////////////////////////////////////////////////////////////
//  Author: Messias Bueno                                   //
//    Date: 29/09/2019                                      //
// Mission: Escreva uma DLL que transcreva um dado n�mero   //
//          por extenso. Construa um programa console que   //
//          fa�a o carregamento est�tico da DLL. Neste      //
//          programa, o usu�rio poder� entrar com um n�mero //
//          qualquer e, como sa�da, o programa dever�       //
//          transcrever o n�mero por extenso em tela.       //
//////////////////////////////////////////////////////////////
program mission07;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

function valueByExtensive(const pValue: Currency): string;
  external 'mission07dll';

procedure main;
var
  sValue: string;
  nValue: Currency;
begin
  repeat
    Write('Enter the value: ');
    Readln(sValue);

    if (StrToCurrDef(sValue,0) <= 0) then
    begin
      writeln('Value is invalid.');
      writeln(EmptyStr);
      continue;
    end;

    Break;
  until False;
  nValue := StrToCurr(sValue);

  Writeln('The value by extensive is');
  Write(valueByExtensive(nValue));
  Readln;
end;

begin
  ReportMemoryLeaksOnShutdown := True;
  main;
end.
