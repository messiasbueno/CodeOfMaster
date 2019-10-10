//////////////////////////////////////////////////////////////
//  Author: Messias Bueno                                   //
//    Date: 10/10/2019                                      //
// Mission: Faça o download do XML. Crie um projeto VCL no  //
//          Delphi. Utilizando o assistante XML Data        //
//          Binding, faça a leitura do XML previamente      //
//          baixado. Leia o conteúdo do XML nas classes     //
//          geradas e o apresente em um componente TMemo no //
//          seguinte formato:                               //
//    ID: 3                                                 //
//    Nome: Tanyahbbhvvg                                    //
//    Sobrenome: Koch                                       //
//    Gênero: female                                        //
//    Data de Nascimento: 22/09/1976                        //
//    E-mail: clangosh@example.com                          //
//    Telefone: 1-440-621-2581 x967                         //
//    Website: http://www.halvorson.com/rerum-soluta-dolores//
//             -delectus-inventore-rem-architecto           //
//    Endereço: 812 Terry Wall Alvahchester, ID 41791-2432  //
//    Status: active                                        //
//    Link (HATEOAS):                                       //
//    |_Recurso: https://gorest.co.in/public-api/users/3    //
//    |_Editar: https://gorest.co.in/public-api/users/3     //
//    |_Avatar: https://lorempixel.com/250/250/people/?23168//
//////////////////////////////////////////////////////////////
program mission19;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {Form1},
  uXML in 'uXML.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfMain, fMain);
  Application.Run;
end.
