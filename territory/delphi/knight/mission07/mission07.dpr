/////////////////////////////////////////////////////////////////////
//  Author: Messias Bueno                                          //
//    Date: 14/03/2020                                             //
// Mission: Neste exercício, você deverá criar uma aplicação VCL   //
//          para envio de e-mails utilizando o Indy. O formulário  //
//          deverá disponibilizar campos de texto para informar o  //
//          endereço SMTP, usuário, senha, porta e configurações   //
//          de SSL. Além disso, adicione também um campo para      //
//          informar o anexo e um componente TMemo para informar o //
//          corpo da mensagem, no qual poderá aceitar comandos     //
//          HTML. Faça a chamada do envio do e-mail em uma         //
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
