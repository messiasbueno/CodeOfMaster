/////////////////////////////////////////////////////////////////////
//  Author: Messias Bueno                                          //
//    Date: 19/08/2020                                             //
// Mission: Em uma aplicação, para transportar dados entre camadas //
//          diferentes, são utilizadas estruturas conhecidos como  //
//          DTO (Data Transfer Objects). A tarefa dos DTOs é       //
//          únicamente armazenar dados, sem nenhum comportamento.  //
//          Quando precisamos preparar o DTO para enviá-lo a outra //
//          camada da aplicação, precisamos obrigatoriamente       //
//          preencher os campos um a um. Para evitar repetição de  //
//          código, é possível sobrescrever o operação de casting  //
//          para que esse “de-para” seja feito em um único lugar.  //
//          Isso é o que chamamos de Operator Overloading.         //
//          Construa uma aplicação que possua uma classe TCliente, //
//          com dados e validações (CEP, tamanho de campos,        //
//          obrigatoriedade de valores e qualquer outra ação que   //
//          você queira), e uma outra estrutura chamada            //
//          TClienteDTO, que possuirá apenas os dados para         //
//          transporte. Implemente o Operator Overloading de modo  //
//          a permitir o casting implícito de TCliente para        //
//          TClienteDTO.                                           //
/////////////////////////////////////////////////////////////////////
program mission19;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

begin
  // This mission cannot be completed
end.
