unit uPersonRepository.Impl;

interface

uses
  uPessoaRepository, uPessoa;

type
  TPersonRepository = class(TInterfacedObject, IPessoaRepository)
  public
    function PersistirDados(Const pPessoa: TPessoa): Boolean;
  end;

implementation

uses
  Data.DB,
  System.SysUtils;

{ TPersonRepository }

function TPersonRepository.PersistirDados(Const pPessoa: TPessoa): Boolean;
begin
  if pPessoa.ID = TGUID.Empty then
    raise EDatabaseError.Create('No person ID was entered');

  Result := True;
end;

end.
