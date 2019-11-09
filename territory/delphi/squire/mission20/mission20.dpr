//////////////////////////////////////////////////////////////
//  Author: Messias Bueno                                   //
//    Date: 25/10/2019                                      //
// Mission: Construa uma aplicação VCL e carregue o XML do  //
//          exercício anterior. Sem alterar a estrutura base//
//          do XML, construa uma tela onde seja possível:   //
//            Navegar entre os registros;                   //
//            Adicionar, remover e alterar os valores de    //
//              cada campo;                                 //
//            Salvar as modificações em arquivo, mantendo a //
//              estrutura original.                         //
//////////////////////////////////////////////////////////////
program mission20;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {Form1},
  uXML in 'uXML.pas',
  uControlXML in 'uControlXML.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfMain, fMain);
  Application.Run;

  ReportMemoryLeaksOnShutdown := True;
end.
