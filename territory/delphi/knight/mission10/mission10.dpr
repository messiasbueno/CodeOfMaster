/////////////////////////////////////////////////////////////////////
//  Author: Messias Bueno                                          //
//    Date: 14/08/2020                                             //
// Mission: Em uma aplica��o VCL, fa�a a importa��o do WSDL do site//
//          RegExLib (http://regexlib.com/WebServices.asmx?WSDL)   //
//          Este WebService cont�m um cat�logo de express�es       //
//          regulares para serem utilizadas. Fa�a um acesso ao     //
//          WebService e consulte a express�o regular n� 3122,     //
//          referente a valida��o de e-mails. Em seguida, utilize  //
//          essa express�o para validar um endere�o de e-mail      //
//          informado pelo usu�rio, apresentando o texto           //
//          "e-mail v�lido" ou "e-mail inv�lido" conforme o        //
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
