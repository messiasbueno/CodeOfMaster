//////////////////////////////////////////////////////////////////
//  Author: Messias Bueno                                       //
//    Date: 05/12/2019                                          //
// Mission: Desenvolva uma aplicação VCL que faça a compactação //
//          de arquivos utilizando a classe TZipFile. Para isso,//
//          no formulário principal, permita que o usuário possa//
//          selecionar os arquivos que deseja compactar, bem    //
//          como o caminho e nome do arquivo compactado que será//
//          criado. A operação deve observar as seguintes regras//
//          e comportamentos: Arquivos com extensão .EXE não    //
//          podem ser selecionados (exiba uma mensagem ao       //
//          usuário);                                           //
//            Caso o arquivo que será criado já exista, deve ser//
//            sobrescrito sem confirmação;                      //
//            O progresso da compactação deve ser exibido em uma//
//            barra de progresso.                               //
//////////////////////////////////////////////////////////////////
program mission03;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {Main},
  uDirectory in 'uDirectory.pas',
  uZipFile in 'uZipFile.pas',
  Vcl.Dialogs.Helper in 'Vcl.Dialogs.Helper.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMain, Main);
  Application.Run;
end.
