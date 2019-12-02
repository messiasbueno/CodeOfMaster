//////////////////////////////////////////////////////////////
//  Author: Messias Bueno                                   //
//    Date: 29/09/2019                                      //
// Mission: Escreva uma DLL que execute os seguintes        //
//          cálculos geométricos: área de um triângulo,     //
//          área do círculo e área do retângulo/quadrado.   //
//          Construa um programa console que carregue a DLL //
//          de forma dinâmica. Neste programa, o usuário    //
//          deve entrar com o tipo de cálculo que deseja    //
//          executar e os valores referentes ao cálculo. No //
//          final da execução, o resultado deve ser         //
//          apresentado em tela.                            //
//////////////////////////////////////////////////////////////
program mission06;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  uUtils in 'uUtils.pas';

procedure main;
var
  sValue: string;
begin
  Writeln('Options:');
  Writeln('1ª - Calculate triangle area');
  Writeln('2ª - Calculate square area');
  Writeln('3ª - Calculate circle area');
  repeat
    Write('Select an option: ');
    Readln(sValue);

    if not (StrToIntDef(sValue,0) in [1,2,3]) then
    begin
      writeln('Option is invalid.');
      writeln(EmptyStr);
      continue;
    end;

    Break;
  until False;

  Writeln(EmptyStr);

  case StrToInt(sValue) of
    1: TUtils.calculateTriangleArea;
    2: TUtils.calculateSquareArea;
    3: TUtils.calculateCircleArea;
  end;
end;

begin
  ReportMemoryLeaksOnShutdown := True;
  main;
end.
