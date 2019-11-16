//////////////////////////////////////////////////////////////
//  Author: Messias Bueno                                   //
//    Date: 29/09/2019                                      //
// Mission: Escreva uma DLL que transcreva um dado número   //
//          por extenso. Construa um programa console que   //
//          faça o carregamento estático da DLL. Neste      //
//          programa, o usuário poderá entrar com um número //
//          qualquer e, como saída, o programa deverá       //
//          transcrever o número por extenso em tela.       //
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
  main;
end.
