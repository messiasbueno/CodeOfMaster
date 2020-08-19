/////////////////////////////////////////////////////////////////////
//  Author: Messias Bueno                                          //
//    Date: 17/08/2020                                             //
// Mission: O componente TFDLocalSql é utilizado para executar     //
//          comandos SQLs em DataSets em memória, ou seja, sem     //
//          conexão com bancos de dados. Neste exercício, baixe os //
//          arquivos Clientes.xml e Cidades.xml (disponíveis aqui).//
//          Em uma aplicação VCL, carregue estes arquivos em dois  //
//          componentes TFDMemTable. Em seguida, use o componente  //
//          TFDLocalSql para ligar os dados dos dois componentes   //
//          (pelo campo IdCidade) de forma que, em uma TDBGrid,    //
//          sejam exibidos o nome do cliente e o nome da cidade. A //
//          aplicação também deve permitir que o usuário filtre os //
//          clientes de uma cidade específica.                     //
/////////////////////////////////////////////////////////////////////
program mission15;

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
