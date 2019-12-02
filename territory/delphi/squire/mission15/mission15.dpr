//////////////////////////////////////////////////////////////
//  Author: Messias Bueno                                   //
//    Date: 08/10/2019                                      //
// Mission: Crie uma aplica��o console. Em uma unit, crie   //
//          uma classe TNotepad, com o m�todo Executar.     //
//          Este m�todo dever� abrir o bloco de notas para  //
//          o usu�rio. Em outro arquivo, escreva a classe   //
//          TCriadorMagico que, utilizando RTTI, construa   //
//          uma inst�ncia de TNotepad de forma din�mica,    //
//          apenas pelo seu QualifiedClassName, sem         //
//          adicion�-la � se��o uses. Na unit do projeto,   //
//          crie uma inst�ncia de TCriadorMagico para abrir //
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
  ReportMemoryLeaksOnShutdown := True;
  main;
end.
