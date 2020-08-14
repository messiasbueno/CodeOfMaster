/////////////////////////////////////////////////////////////////////
//  Author: Messias Bueno                                          //
//    Date: 14/08/2020                                             //
// Mission: Crie uma aplicação VCL que permita a consulta dos      //
//          dados de endereço através do CEP. Para isso, importe o //
//          WSDL dos Correios                                      //
// (https://apps.correios.com.br/SigepMasterJPA/AtendeClienteService/AtendeCliente?wsdl)//
//          No formulário, adicione um campo de texto para         //
//          informar o CEP e apresente os dados do endereço        //
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
