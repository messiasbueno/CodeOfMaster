//////////////////////////////////////////////////////////////
//  Author: Messias Bueno                                   //
//    Date: 03/10/2019                                      //
// Mission: Em uma aplica��o console, crie uma classe       //
//          chamada TFuncionario que armazene os dados de   //
//          funcion�rios (nome, email e telefone). Crie     //
//          tamb�m uma classe, utilizando Generics, chamada //
//          TCacheObjetos. O seu funcionamento ser� como um //
//          cache de objetos e dever� armazenar inst�ncias  //
//          de diferentes tipos. Sendo assim, caso o cache  //
//          n�o contenha uma inst�ncia da classe solicitada,//
//          TCacheObjetos dever� cri�-la, armazenar no seu  //
//          cache interno e retornar a inst�ncia. Para      //
//          testar a aplica��o, crie duas vari�veis         //
//          (funcionario1 e funcionario2). Crie tamb�m uma  //
//          inst�ncia de TCacheObjetos e pe�a que ele       //
//          retorne uma inst�ncia de TFuncionario na        //
//          vari�vel funcionario1. Preencha os valores do   //
//          funcion�rio. Em seguida, pe�a uma inst�ncia de  //
//          TFuncionario em funcionario2. Os valores das    //
//          duas vari�veis dever�o ser iguais, j� que ser�o //
//          a mesma inst�ncia.                              //
//////////////////////////////////////////////////////////////
program mission09;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  uEmployee in 'uEmployee.pas',
  uCacheObjects in 'uCacheObjects.pas';

procedure Print(const pEmployee: TEmployee);
begin
  Writeln('Memory Address : ' + Integer(pEmployee).ToString);
  Writeln('Name: ' + pEmployee.Name);
  Writeln('Email: ' + pEmployee.Email);
  Writeln('Phone: ' + pEmployee.Phone);
end;

procedure main;
var
  oCacheObjects: TCacheObjects;
  oEmployee1: TEmployee;
  oEmployee2: TEmployee;
begin
  oCacheObjects := TCacheObjects.Create;
  try
    Writeln('Creating oEmployee1 object');
    oEmployee1 := oCacheObjects.getInstance<TEmployee>;
    oEmployee1.Name := 'Messias';
    oEmployee1.Email := 'messias.bueno@db1.com.br';
    oEmployee1.Phone := '(43) 99625-6882';
    Writeln('Values Populated in oEmployee1:');
    Print(oEmployee1);
    Readln;

    Writeln('Creating oEmployee2 object');
    oEmployee2 := oCacheObjects.getInstance<TEmployee>;
    Writeln('Values Populated in oEmployee2:');
    Print(oEmployee2);
    Readln;

    Writeln('Changing oEmployee2 object');
    oEmployee2.Name := 'Messias Bueno';
    Writeln(sLineBreak+'Values Populated in oEmployee1:');
    Print(oEmployee1);
    Writeln(sLineBreak+'Values Populated in oEmployee2:');
    Print(oEmployee2);
    Readln;
  finally
    oCacheObjects.Free;
  end;
end;

begin
  ReportMemoryLeaksOnShutdown := True;
  main;
end.
