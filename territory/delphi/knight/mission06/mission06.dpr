/////////////////////////////////////////////////////////////////////
//  Author: Messias Bueno                                          //
//    Date: 13/03/2020                                             //
// Mission: Em uma aplica��o VCL, declare uma classe Thread        //
//          respons�vel por fazer o download de um arquivo         //
//          qualquer da internet. Em seguida, em um formul�rio,    //
//          adicione um campo de texto para que o usu�rio informe  //
//          o endere�o do arquivo, e uma barra de progresso para   //
//          exibir o progresso do download. A classe TThread       //
//          dever� ser utilizada para baixar o arquivo e atualizar //
//          a barra de progresso sem travar a aplica��o.           //
/////////////////////////////////////////////////////////////////////
program mission06;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {fMain},
  uDownloadFile in 'uDownloadFile.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfMain, fMain);
  Application.Run;
end.
