//////////////////////////////////////////////////////////////
//  Author: Messias Bueno                                   //
//    Date: 08/10/2019                                      //
// Mission: Construa uma aplica��o VCL. Esta aplica��o      //
//          dever� conter uma classe que, utilizando RTTI,  //
//          fa�a a listagem das propriedades e m�todos de   //
//          qualquer classe passada por par�metro. A        //
//          apresenta��o da listagem fica por sua conta.    //
//////////////////////////////////////////////////////////////
program mission16;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {fMain},
  uClassReader in 'uClassReader.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfMain, fMain);
  Application.Run;
end.
