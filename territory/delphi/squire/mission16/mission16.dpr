//////////////////////////////////////////////////////////////
//  Author: Messias Bueno                                   //
//    Date: 08/10/2019                                      //
// Mission: Construa uma aplicação VCL. Esta aplicação      //
//          deverá conter uma classe que, utilizando RTTI,  //
//          faça a listagem das propriedades e métodos de   //
//          qualquer classe passada por parâmetro. A        //
//          apresentação da listagem fica por sua conta.    //
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
