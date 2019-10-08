//////////////////////////////////////////////////////////////
//  Author: Messias Bueno                                   //
//    Date: 08/10/2019                                      //
// Mission: Crie uma aplicação console. Em uma unit, crie   //
//          uma classe TNotepad, com o método Executar.     //
//          Este método deverá abrir o bloco de notas para  //
//          o usuário. Em outro arquivo, escreva a classe   //
//          TCriadorMagico que, utilizando RTTI, construa   //
//          uma instância de TNotepad de forma dinâmica,    //
//          apenas pelo seu QualifiedClassName, sem         //
//          adicioná-la à seção uses. Na unit do projeto,   //
//          crie uma instância de TCriadorMagico para abrir //
//          o bloco de notas.                               //
//////////////////////////////////////////////////////////////
program mission15;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  uNotePad in 'uNotePad.pas',
  uMagicCreator in 'uMagicCreator.pas';

procedure main;
begin
  Writeln('Opening Notepad.');
  TMagicCreator.OpenNotepad;
  Writeln('Open Notepad.');
  Readln;
end;

begin
  main;
end.
