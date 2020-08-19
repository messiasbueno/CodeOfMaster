/////////////////////////////////////////////////////////////////////
//  Author: Messias Bueno                                          //
//    Date: 17/08/2020                                             //
// Mission: Na aplicação do exercício 13, a unit uPessoa está      //
//          emitindo um warning. Sem alterar o código da classe,   //
//          faça com que o warning não seja mais emitido e         //
//          adicione um comentário explicando o que o causava e de //
//          qual forma o código poderia ser reescrito para que ele //
//          não fosse emitido.                                     //
/////////////////////////////////////////////////////////////////////
program mission16;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  uPessoa in 'uPessoa.pas';

begin
  {
      For correction, just include the $M+ directive

      This warning refers to the Published section
      This section aims to make your information public
    With RTTI readings
      Delphi can only bring the information you need
    if the class has the $M+ directive or is a
    descendant of a class with the directive

      The public section could be used in this scenario.
  }
end.
