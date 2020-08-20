/////////////////////////////////////////////////////////////////////
//  Author: Messias Bueno                                          //
//    Date: 19/08/2020                                             //
// Mission: Crie uma aplicação VCL que funcione como um            //
//          “notificador de lembretes”. O usuário poderá informar  //
//          a data (dd/mm/yyyy), horário (hh:mm) e descrição de    //
//          quantos lembretes desejar. Ao minimizar, a aplicação   //
//          deverá ficar na bandeja do sistema (system tray).      //
//          Utilize um TTimer para comparar a data/hora atual com  //
//          o lembrete e, quando for o horário correspondente,     //
//          exiba uma notificação no Windows com o componente      //
//          TNotificationCenter. Ao clicar na notificação, a       //
//          aplicação deverá ser restaurada e exibida para o       //
//          usuário.                                               //
/////////////////////////////////////////////////////////////////////
program mission18;

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
