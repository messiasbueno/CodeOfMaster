unit uPessoaServiceTest;

interface
uses
  System.SysUtils,
  DUnitX.TestFramework,
  Delphi.Mocks,
  uPessoa,
  uPessoaService,
  uPessoaService.Impl,
  uPessoaRepository,
  uPessoaRepository.impl;

type

  [TestFixture]
  TPessoaServiceTest = class(TObject)
  private
    function getPessoa: TPessoa;
  public
    [Test]
    procedure TestSalvarPessoa;
    [Test]
    procedure TestSalvarPessoaDateBirthNotSpecified;
    [Test]
    procedure TestSalvarPessoaUnderAge;
    [Test]
    procedure TestSalvarPessoaNameEmpty;
    [Test]
    procedure TestSalvarPessoaDataBaseError;
    [Test]
    procedure TestSalvarPessoaException;
  end;

implementation

uses
  System.Math,
  System.DateUtils,
  Data.DB;

{ TPessoaServiceTest }

procedure TPessoaServiceTest.TestSalvarPessoa;
var
  vPessoaService: IPessoaService;
  vPessoa: TPessoa;
  vMock: TMock<IPessoaRepository>;
begin
  vMock := TMock<IPessoaRepository>.Create;
  vMock.Setup.WillReturnDefault('PersistirDados',True);

  vPessoaService := TPessoaService.Create(vMock.Instance);

  vPessoa := Self.getPessoa;
  Assert.IsTrue(vPessoaService.Salvar(vPessoa));
end;

procedure TPessoaServiceTest.TestSalvarPessoaDataBaseError;
var
  vPessoaService: IPessoaService;
  vPessoa: TPessoa;
  vMock: TMock<IPessoaRepository>;
begin
  vMock := TMock<IPessoaRepository>.Create;
  vMock.Setup.WillRaise('PersistirDados',EDatabaseError);

  vPessoaService := TPessoaService.Create(vMock.Instance);
  vPessoa := Self.getPessoa;

  Assert.WillRaiseWithMessage(
    procedure
    begin
      vPessoaService.Salvar(vPessoa);
    end,
    EArgumentException
  );
end;

procedure TPessoaServiceTest.TestSalvarPessoaDateBirthNotSpecified;
var
  vPessoaService: IPessoaService;
  vPessoa: TPessoa;
  vMock: TMock<IPessoaRepository>;
begin
  vMock := TMock<IPessoaRepository>.Create;
  vMock.Setup.WillReturnDefault('PersistirDados',False);

  vPessoaService := TPessoaService.Create(vMock.Instance);

  vPessoa := Self.getPessoa;
  vPessoa.DataNascimento := ZeroValue;

  Assert.WillRaiseWithMessage(
    procedure
    begin
      vPessoaService.Salvar(vPessoa);
    end,
    Exception,
    'A Data de nascimento não foi informada'
  );
end;

procedure TPessoaServiceTest.TestSalvarPessoaException;
var
  vPessoaService: IPessoaService;
  vPessoa: TPessoa;
  vMock: TMock<IPessoaRepository>;
begin
  vMock := TMock<IPessoaRepository>.Create;
  vMock.Setup.WillRaise('PersistirDados',Exception);

  vPessoaService := TPessoaService.Create(vMock.Instance);
  vPessoa := Self.getPessoa;

  Assert.WillRaiseWithMessage(
    procedure
    begin
      vPessoaService.Salvar(vPessoa);
    end,
    Exception
  );
end;

procedure TPessoaServiceTest.TestSalvarPessoaNameEmpty;
var
  vPessoaService: IPessoaService;
  vPessoa: TPessoa;
  vMock: TMock<IPessoaRepository>;
begin
  vMock := TMock<IPessoaRepository>.Create;
  vMock.Setup.WillReturnDefault('PersistirDados',False);

  vPessoaService := TPessoaService.Create(vMock.Instance);

  vPessoa := Self.getPessoa;
  vPessoa.Nome := EmptyStr;

  Assert.WillRaiseWithMessage(
    procedure
    begin
      vPessoaService.Salvar(vPessoa);
    end,
    Exception,
    'O nome não foi informado'
  );
end;

procedure TPessoaServiceTest.TestSalvarPessoaUnderAge;
var
  vPessoaService: IPessoaService;
  vPessoa: TPessoa;
  vMock: TMock<IPessoaRepository>;
begin
  vMock := TMock<IPessoaRepository>.Create;
  vMock.Setup.WillReturnDefault('PersistirDados',False);

  vPessoaService := TPessoaService.Create(vMock.Instance);

  vPessoa := Self.getPessoa;
  vPessoa.DataNascimento := IncYear(Now,-10);

  Assert.WillRaiseWithMessage(
    procedure
    begin
      vPessoaService.Salvar(vPessoa);
    end,
    Exception,
    'Menor de idade não pode ser cadastrado'
  );
end;

function TPessoaServiceTest.getPessoa: TPessoa;
begin
  Result := TPessoa.Create;
  Result.ID := TGuid.NewGuid;
  Result.Nome := 'Messias Bueno';
  Result.DataNascimento := StrToDate('25/03/1991');
  Result.EstadoCivil := ecCasado;
end;

initialization
  TDUnitX.RegisterTestFixture(TPessoaServiceTest);
end.
