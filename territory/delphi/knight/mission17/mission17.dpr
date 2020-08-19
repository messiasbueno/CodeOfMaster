/////////////////////////////////////////////////////////////////////
//  Author: Messias Bueno                                          //
//    Date: 19/08/2020                                             //
// Mission: Na aplica��o do exerc�cio 13, a classe                 //
//          TfrmSalvadorDePessoas possui o m�todo                  //
//          PegarPessoaService, que devolve o servi�o criado e com //
//          o reposit�rio j� injetado. Crie uma nova classe que    //
//          implemente IPessoaRepository, dando-lhe o nome que     //
//          preferir. Implemente o m�todo PersistirDados de modo   //
//          que os dados sempre sejam salvos. Uma vez que a classe //
//          tenha sido escrita, utilizando Diretivas de compila��o,//
//          altere o fluxo do sistema. Quando o sistema estiver    //
//          compilando com a diretiva PERSISTENCIA_PADRAO, o       //
//          sistema utilizar� a vers�o do repository original. Do  //
//          contr�rio, o sistema utilizar� a persist�ncia escrita  //
//          por voc�.                                              //
/////////////////////////////////////////////////////////////////////
program mission17;

uses
  Vcl.Forms,
  uPessoa in 'ThirdParty\DB1\uPessoa.pas',
  uPessoaForm in 'ThirdParty\DB1\uPessoaForm.pas' {frmSalvadorDePessoas},
  uPessoaRepository.Impl in 'ThirdParty\DB1\uPessoaRepository.Impl.pas',
  uPessoaRepository in 'ThirdParty\DB1\uPessoaRepository.pas',
  uPessoaService.Impl in 'ThirdParty\DB1\uPessoaService.Impl.pas',
  uPessoaService in 'ThirdParty\DB1\uPessoaService.pas',
  uPersonRepository.Impl in 'uPersonRepository.Impl.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmSalvadorDePessoas, frmSalvadorDePessoas);
  Application.Run;
end.
