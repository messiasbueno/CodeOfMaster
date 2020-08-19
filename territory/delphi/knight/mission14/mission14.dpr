/////////////////////////////////////////////////////////////////////
//  Author: Messias Bueno                                          //
//    Date: 17/08/2020                                             //
// Mission: Crie um banco de dados no Firebird 3.0 com as          //
//          seguintes tabelas e campos:                            //
//          FUNCIONARIO                                            //
//            ID, Nome, Data de Admissão, Salário                  //
//          DEPARTAMENTO                                           //
//            ID, Descricao, Telefone                              //
//          FUNCIONARIO_DEPARTAMENTO                               //
//            IDFuncionario, IDDepartamento                        //
//          Crie uma alicação VCL que permita cadastrar            //
//          funcionários, departamentos e vincular funcionários a  //
//          departamentos (mestre-detalhe). A conexão com o banco  //
//          de dados e a manipulação de dados devem ser feitas     //
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
