//////////////////////////////////////////////////////////////
//  Author: Messias Bueno                                   //
//    Date: 03/10/2019                                      //
// Mission: Em uma aplicação console, crie uma classe       //
//          chamada TFuncionario que armazene os dados de   //
//          funcionários (nome, email e telefone). Crie     //
//          também uma classe, utilizando Generics, chamada //
//          TCacheObjetos. O seu funcionamento será como um //
//          cache de objetos e deverá armazenar instâncias  //
//          de diferentes tipos. Sendo assim, caso o cache  //
//          não contenha uma instância da classe solicitada,//
//          TCacheObjetos deverá criá-la, armazenar no seu  //
//          cache interno e retornar a instância. Para      //
//          testar a aplicação, crie duas variáveis         //
//          (funcionario1 e funcionario2). Crie também uma  //
//          instância de TCacheObjetos e peça que ele       //
//          retorne uma instância de TFuncionario na        //
//          variável funcionario1. Preencha os valores do   //
//          funcionário. Em seguida, peça uma instância de  //
//          TFuncionario em funcionario2. Os valores das    //
//          duas variáveis deverão ser iguais, já que serão //
//          a mesma instância.                              //
//////////////////////////////////////////////////////////////
program mission09;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  uEmployee in 'uEmployee.pas',
  uCacheObjects in 'uCacheObjects.pas';

procedure Print(pEmployee: TEmployee);
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
    Writeln('Values Populated in oEmployee1:');
    Print(oEmployee1);
    Writeln(sLineBreak+'Values Populated in oEmployee2:');
    Print(oEmployee2);
    Readln;
  finally
    oCacheObjects.Free;
  end;
end;

begin
  main;
end.
