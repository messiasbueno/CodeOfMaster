//////////////////////////////////////////////////////////////////
//  Author: Messias Bueno                                       //
//    Date: 05/12/2019                                          //
// Mission: Desenvolva uma aplica��o VCL que fa�a a compacta��o //
//          de arquivos utilizando a classe TZipFile. Para isso,//
//          no formul�rio principal, permita que o usu�rio possa//
//          selecionar os arquivos que deseja compactar, bem    //
//          como o caminho e nome do arquivo compactado que ser�//
//          criado. A opera��o deve observar as seguintes regras//
//          e comportamentos: Arquivos com extens�o .EXE n�o    //
//          podem ser selecionados (exiba uma mensagem ao       //
//          usu�rio);                                           //
//            Caso o arquivo que ser� criado j� exista, deve ser//
//            sobrescrito sem confirma��o;                      //
//            O progresso da compacta��o deve ser exibido em uma//
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
