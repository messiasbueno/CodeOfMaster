/////////////////////////////////////////////////////////////////////
//  Author: Messias Bueno                                          //
//    Date: 20/08/2020                                             //
// Mission: Crie um banco de dados no Firebird 3.0 com a seguinte  //
//          tabela: FUNCIONARIO                                    //
//          ID (inteiro) Nome (texto) Cidade (texto) Email (texto) //
//          DataNasc (data) Profissao (texto) Cartao (texto )      //
//          Desenvolva uma aplicação VCL que carregue o arquivo    //
//          Dados.csv e faça a inserção dos 20 mil registros nessa //
//          tabela usando o recurso ArrayDML do FireDAC. Calcule o //
//          tempo de inserção utilizando a classe TStopWatch e     //
//          exiba-o em uma mensagem após a conclusão da operação.  //
/////////////////////////////////////////////////////////////////////
program mission20;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {fMain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfMain, fMain);
  Application.Run;
end.
