//////////////////////////////////////////////////////////////
//  Author: Messias Bueno                                   //
//    Date: 29/09/2019                                      //
// Mission: Escreva uma DLL que execute os seguintes        //
//          c�lculos geom�tricos: �rea de um tri�ngulo,     //
//          �rea do c�rculo e �rea do ret�ngulo/quadrado.   //
//          Construa um programa console que carregue a DLL //
//          de forma din�mica. Neste programa, o usu�rio    //
//          deve entrar com o tipo de c�lculo que deseja    //
//          executar e os valores referentes ao c�lculo. No //
//          final da execu��o, o resultado deve ser         //
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
  Writeln('1� - Calculate triangle area');
  Writeln('2� - Calculate square area');
  Writeln('3� - Calculate circle area');
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
  main;
end.
