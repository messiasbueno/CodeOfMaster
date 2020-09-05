/////////////////////////////////////////////////////////////////////
//  Author: Messias Bueno                                          //
//    Date: 19/08/2020                                             //
// Mission: Em uma aplica��o, para transportar dados entre camadas //
//          diferentes, s�o utilizadas estruturas conhecidos como  //
//          DTO (Data Transfer Objects). A tarefa dos DTOs �       //
//          �nicamente armazenar dados, sem nenhum comportamento.  //
//          Quando precisamos preparar o DTO para envi�-lo a outra //
//          camada da aplica��o, precisamos obrigatoriamente       //
//          preencher os campos um a um. Para evitar repeti��o de  //
//          c�digo, � poss�vel sobrescrever o opera��o de casting  //
//          para que esse �de-para� seja feito em um �nico lugar.  //
//          Isso � o que chamamos de Operator Overloading.         //
//          Construa uma aplica��o que possua uma classe TCliente, //
//          com dados e valida��es (CEP, tamanho de campos,        //
//          obrigatoriedade de valores e qualquer outra a��o que   //
//          voc� queira), e uma outra estrutura chamada            //
//          TClienteDTO, que possuir� apenas os dados para         //
//          transporte. Implemente o Operator Overloading de modo  //
//          a permitir o casting impl�cito de TCliente para        //
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
