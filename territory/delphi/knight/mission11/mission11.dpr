/////////////////////////////////////////////////////////////////////
//  Author: Messias Bueno                                          //
//    Date: 14/08/2020                                             //
// Mission: Crie uma aplica��o VCL que permita a consulta dos      //
//          dados de endere�o atrav�s do CEP. Para isso, importe o //
//          WSDL dos Correios                                      //
// (https://apps.correios.com.br/SigepMasterJPA/AtendeClienteService/AtendeCliente?wsdl)//
//          No formul�rio, adicione um campo de texto para         //
//          informar o CEP e apresente os dados do endere�o        //
//          (logradouro, bairro, cidade e UF)                      //
/////////////////////////////////////////////////////////////////////
program mission11;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {fMain},
  uAtendeCliente in 'uAtendeCliente.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfMain, fMain);
  Application.Run;
end.
