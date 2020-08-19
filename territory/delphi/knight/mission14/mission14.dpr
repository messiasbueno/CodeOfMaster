/////////////////////////////////////////////////////////////////////
//  Author: Messias Bueno                                          //
//    Date: 17/08/2020                                             //
// Mission: Crie um banco de dados no Firebird 3.0 com as          //
//          seguintes tabelas e campos:                            //
//          FUNCIONARIO                                            //
//            ID, Nome, Data de Admiss�o, Sal�rio                  //
//          DEPARTAMENTO                                           //
//            ID, Descricao, Telefone                              //
//          FUNCIONARIO_DEPARTAMENTO                               //
//            IDFuncionario, IDDepartamento                        //
//          Crie uma alica��o VCL que permita cadastrar            //
//          funcion�rios, departamentos e vincular funcion�rios a  //
//          departamentos (mestre-detalhe). A conex�o com o banco  //
//          de dados e a manipula��o de dados devem ser feitas     //
//          com FireDAC.                                           //
/////////////////////////////////////////////////////////////////////
program mission14;

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
