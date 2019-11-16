//////////////////////////////////////////////////////////////
//  Author: Messias Bueno                                   //
//    Date: 03/10/2019                                      //
// Mission: Em uma aplica��o console, crie uma classe que   //
//          executar� opera��es matem�ticas, chamada        //
//          TClasseMatematica. Ela ter� duas propriedades do//
//          tipo double, chamadas Esquerda e Direita, e     //
//          tamb�m uma propriedade que receber� um m�todo   //
//          an�nimo que referencie uma function, com retorno//
//          do tipo double (crie o tipo com o nome          //
//          TOperacaoMatematica). A aplica��o solicitar� ao //
//          usu�rio qual opera��o deve ser executada        //
//          (+ - * /) e os n�meros da opera��o (Esquerda e  //
//          Direita). De acordo com a entrada do usu�rio, a //
//          opera��o matem�tica correta ser� executada      //
//          atrav�s de um m�todo an�nimo, presente na       //
//          propriedade do tipo TOperacaoMatematica.        //
//////////////////////////////////////////////////////////////
program mission10;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  System.Math,
  uMathematicalClass in 'uMathematicalClass.pas';

procedure main;
var
  sValue: string;
  nOption: SmallInt;
  nLeft: Double;
  nRight: Double;
  oMathematicalClass: TMathematicalClass;
begin
  Writeln('Options:');
  Writeln('1� - Addition');
  Writeln('2� - Subtraction');
  Writeln('3� - Multiplication');
  Writeln('3� - Division');
  repeat
    Write('Select an option: ');
    Readln(sValue);

    if not (StrToIntDef(sValue,ZeroValue) in [1,2,3,4]) then
    begin
      writeln('Option is invalid.');
      continue;
    end;

    Break;
  until False;
  nOption := StrToInt(sValue);

  repeat
    Write('Enter left value: ');
    Readln(sValue);

    try
      nLeft := StrToFloat(sValue);
    Except
      writeln('Value is invalid.');
      Continue;
    end;
    Break;
  until False;

  repeat
    Write('Enter right value: ');
    Readln(sValue);

    try
      nRight := StrToFloat(sValue);
    Except
      writeln('Value is invalid.');
      Continue;
    end;
    Break;
  until False;

  oMathematicalClass := TMathematicalClass.Create;
  try
    oMathematicalClass.Left := nLeft;
    oMathematicalClass.Right := nRight;

    case nOption of
      1: oMathematicalClass.MathematicalOperation :=
         function: Double
         begin
           Result := oMathematicalClass.Left + oMathematicalClass.Right;
         end;
      2: oMathematicalClass.MathematicalOperation :=
         function: Double
         begin
           Result := oMathematicalClass.Left - oMathematicalClass.Right;
         end;
      3: oMathematicalClass.MathematicalOperation :=
         function: Double
         begin
           Result := oMathematicalClass.Left * oMathematicalClass.Right;
         end;
      4: oMathematicalClass.MathematicalOperation :=
         function: Double
         begin
           Result := oMathematicalClass.Left / oMathematicalClass.Right;
         end;
    end;

    Writeln('Operation result is: ' + oMathematicalClass.MathematicalOperation.ToString);
    Readln;
  finally
    oMathematicalClass.Free;
  end;
end;

begin
  main;
end.
