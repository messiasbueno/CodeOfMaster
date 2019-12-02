//////////////////////////////////////////////////////////////
//  Author: Messias Bueno                                   //
//    Date: 03/10/2019                                      //
// Mission: Em uma aplicação console, crie uma classe que   //
//          executará operações matemáticas, chamada        //
//          TClasseMatematica. Ela terá duas propriedades do//
//          tipo double, chamadas Esquerda e Direita, e     //
//          também uma propriedade que receberá um método   //
//          anônimo que referencie uma function, com retorno//
//          do tipo double (crie o tipo com o nome          //
//          TOperacaoMatematica). A aplicação solicitará ao //
//          usuário qual operação deve ser executada        //
//          (+ - * /) e os números da operação (Esquerda e  //
//          Direita). De acordo com a entrada do usuário, a //
//          operação matemática correta será executada      //
//          através de um método anônimo, presente na       //
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
  Writeln('1ª - Addition');
  Writeln('2ª - Subtraction');
  Writeln('3ª - Multiplication');
  Writeln('4ª - Division');
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
  ReportMemoryLeaksOnShutdown := True;
  main;
end.
