/////////////////////////////////////////////////////////////////////
//  Author: Messias Bueno                                          //
//    Date: 14/03/2020                                             //
// Mission: Neste exerc�cio, voc� dever� criar uma aplica��o VCL   //
//          para envio de e-mails utilizando o Indy. O formul�rio  //
//          dever� disponibilizar campos de texto para informar o  //
//          endere�o SMTP, usu�rio, senha, porta e configura��es   //
//          de SSL. Al�m disso, adicione tamb�m um campo para      //
//          informar o anexo e um componente TMemo para informar o //
//          corpo da mensagem, no qual poder� aceitar comandos     //
//          HTML. Fa�a a chamada do envio do e-mail em uma         //
//          Anonymous Thread.                                      //
/////////////////////////////////////////////////////////////////////
program mission07;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {fMain},
  uEmail in 'uEmail.pas',
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Windows10 SlateGray');
  Application.CreateForm(TfMain, fMain);
  Application.Run;
end.
