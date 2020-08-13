/////////////////////////////////////////////////////////////////////
//  Author: Messias Bueno                                          //
//    Date: 13/08/2020                                             //
// Mission: Em uma aplica��o VCL, voc� dever� criar um formul�rio  //
//          que permita a pesquisa de usu�rios do GitHub. Para     //
//          isso, utilize os componentes da paleta REST Client     //
//          para acessar a API p�blica do GitHub                   //
//          (https://api.github.com/users/{busca}), substituindo o //
//          texto "{busca}" pela entrada do usu�rio. Utilize o     //
//          componente TRestResponseDataSetAdapter para apresentar //
//          os resultados em um componente TDBGrid.                //
/////////////////////////////////////////////////////////////////////
program mission08;

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
