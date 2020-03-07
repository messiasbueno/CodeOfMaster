////////////////////////////////////////////////////////////////
//  Author: Messias Bueno                                     //
//    Date: 03/12/2019                                        //
// Mission: Desenvolva uma aplica��o VCL capaz de listar os   //
//          programas instalados no computador atrav�s da     //
//          leitura do registro do Windows. Para isso, utilize//
//          a classe TRegistry e apresente, em uma TDBGrid, o //
//          nome do programa, vers�o e a empresa.             //
////////////////////////////////////////////////////////////////
program mission02;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {Main},
  uRegistry in 'uRegistry.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMain, Main);
  Application.Run;

  ReportMemoryLeaksOnShutdown := True;
end.
