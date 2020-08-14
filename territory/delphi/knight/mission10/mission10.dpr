/////////////////////////////////////////////////////////////////////
//  Author: Messias Bueno                                          //
//    Date: 14/08/2020                                             //
// Mission: Em uma aplicação VCL, faça a importação do WSDL do site//
//          RegExLib (http://regexlib.com/WebServices.asmx?WSDL)   //
//          Este WebService contém um catálogo de expressões       //
//          regulares para serem utilizadas. Faça um acesso ao     //
//          WebService e consulte a expressão regular nº 3122,     //
//          referente a validação de e-mails. Em seguida, utilize  //
//          essa expressão para validar um endereço de e-mail      //
//          informado pelo usuário, apresentando o texto           //
//          "e-mail válido" ou "e-mail inválido" conforme o        //
//          resultado                                              //
/////////////////////////////////////////////////////////////////////
program mission10;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {fMain},
  WebServices in 'WebServices.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfMain, fMain);
  Application.Run;
end.
