/////////////////////////////////////////////////////////////////////
//  Author: Messias Bueno                                          //
//    Date: 17/08/2020                                             //
// Mission: O componente TFDLocalSql � utilizado para executar     //
//          comandos SQLs em DataSets em mem�ria, ou seja, sem     //
//          conex�o com bancos de dados. Neste exerc�cio, baixe os //
//          arquivos Clientes.xml e Cidades.xml (dispon�veis aqui).//
//          Em uma aplica��o VCL, carregue estes arquivos em dois  //
//          componentes TFDMemTable. Em seguida, use o componente  //
//          TFDLocalSql para ligar os dados dos dois componentes   //
//          (pelo campo IdCidade) de forma que, em uma TDBGrid,    //
//          sejam exibidos o nome do cliente e o nome da cidade. A //
//          aplica��o tamb�m deve permitir que o usu�rio filtre os //
//          clientes de uma cidade espec�fica.                     //
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
