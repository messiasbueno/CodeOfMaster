/////////////////////////////////////////////////////////////////////
//  Author: Messias Bueno                                          //
//    Date: 19/08/2020                                             //
// Mission: Na aplicação do exercício 13, a classe                 //
//          TfrmSalvadorDePessoas possui o método                  //
//          PegarPessoaService, que devolve o serviço criado e com //
//          o repositório já injetado. Crie uma nova classe que    //
//          implemente IPessoaRepository, dando-lhe o nome que     //
//          preferir. Implemente o método PersistirDados de modo   //
//          que os dados sempre sejam salvos. Uma vez que a classe //
//          tenha sido escrita, utilizando Diretivas de compilação,//
//          altere o fluxo do sistema. Quando o sistema estiver    //
//          compilando com a diretiva PERSISTENCIA_PADRAO, o       //
//          sistema utilizará a versão do repository original. Do  //
//          contrário, o sistema utilizará a persistência escrita  //
//          por você.                                              //
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
