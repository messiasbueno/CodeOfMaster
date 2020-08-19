/////////////////////////////////////////////////////////////////////
//  Author: Messias Bueno                                          //
//    Date: 17/08/2020                                             //
// Mission: Na aplica��o do exerc�cio 13, a unit uPessoa est�      //
//          emitindo um warning. Sem alterar o c�digo da classe,   //
//          fa�a com que o warning n�o seja mais emitido e         //
//          adicione um coment�rio explicando o que o causava e de //
//          qual forma o c�digo poderia ser reescrito para que ele //
//          n�o fosse emitido.                                     //
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
