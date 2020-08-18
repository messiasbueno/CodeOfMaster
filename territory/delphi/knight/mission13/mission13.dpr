/////////////////////////////////////////////////////////////////////
//  Author: Messias Bueno                                          //
//    Date: 17/08/2020                                             //
// Mission: Sistemas, para serem test�veis, precisam possuir baixo //
//          acoplamento. Assim, durante a etapa de testes, �       //
//          poss�vel, por exemplo, substituir a camada de          //
//          persist�ncia de dados por um mock que �far� de conta�  //
//          que os dados foram salvos com sucesso. Ou ainda, emitir//
//          uma exce��o simulando um erro na camada de             //
//          infraestrutura. Para constru��o de mocks e stubs,      //
//          existe uma biblioteca gratuita chamada Delphi-Mocks    //
//          (https://github.com/VSoftTechnologies/Delphi-Mocks).   //
//          Utilizando a biblioteca Delphi-Mocks, escreva os teste //
//          unit�rios para a classe TPessoaService. Utilize o      //
//          framework Delphi-Mocks para mockar o reposit�rio. N�o  //
//          ser�o aceitos c�digos implementados com classes fake.  //
//          Os testes devem incluir:                               //
//          O comportamento de quando TPessoa est� inv�lido;       //
//          Garantir que o m�todo de TPessoaRepository n�o ser�    //
//          chamado quando TPessoa n�o estiver v�lida;             //
//          Garantir que o m�todo de TPessoaRepository ser� chamado//
//          quando TPessoa estiver v�lido;                         //
//          O comportamento de TPessoaService quando               //
//          TPessoaRepository emite uma exce��o EDatabaseError;    //
//          O comportamento de TPessoaService, caso                //
//          TPessoaRepository emita qualquer outra exce��o que n�o //
//          seja EDatabaseError;                                   //
/////////////////////////////////////////////////////////////////////
program mission13;

{$IFNDEF TESTINSIGHT}
{$APPTYPE CONSOLE}
{$ENDIF}{$STRONGLINKTYPES ON}
{$WARN DUPLICATE_CTOR_DTOR OFF}
uses
  System.SysUtils,
  {$IFDEF TESTINSIGHT}
  TestInsight.DUnitX,
  {$ENDIF }
  DUnitX.Loggers.Console,
  DUnitX.Loggers.Xml.NUnit,
  DUnitX.TestFramework,
  Delphi.Mocks.AutoMock in 'ThirdParty\Delphi-Mocks\Delphi.Mocks.AutoMock.pas',
  Delphi.Mocks.Behavior in 'ThirdParty\Delphi-Mocks\Delphi.Mocks.Behavior.pas',
  Delphi.Mocks.Expectation in 'ThirdParty\Delphi-Mocks\Delphi.Mocks.Expectation.pas',
  Delphi.Mocks.Helpers in 'ThirdParty\Delphi-Mocks\Delphi.Mocks.Helpers.pas',
  Delphi.Mocks.Interfaces in 'ThirdParty\Delphi-Mocks\Delphi.Mocks.Interfaces.pas',
  Delphi.Mocks.MethodData in 'ThirdParty\Delphi-Mocks\Delphi.Mocks.MethodData.pas',
  Delphi.Mocks.ObjectProxy in 'ThirdParty\Delphi-Mocks\Delphi.Mocks.ObjectProxy.pas',
  Delphi.Mocks.ParamMatcher in 'ThirdParty\Delphi-Mocks\Delphi.Mocks.ParamMatcher.pas',
  Delphi.Mocks in 'ThirdParty\Delphi-Mocks\Delphi.Mocks.pas',
  Delphi.Mocks.Proxy in 'ThirdParty\Delphi-Mocks\Delphi.Mocks.Proxy.pas',
  Delphi.Mocks.Proxy.TypeInfo in 'ThirdParty\Delphi-Mocks\Delphi.Mocks.Proxy.TypeInfo.pas',
  Delphi.Mocks.ReturnTypePatch in 'ThirdParty\Delphi-Mocks\Delphi.Mocks.ReturnTypePatch.pas',
  Delphi.Mocks.Utils in 'ThirdParty\Delphi-Mocks\Delphi.Mocks.Utils.pas',
  Delphi.Mocks.Validation in 'ThirdParty\Delphi-Mocks\Delphi.Mocks.Validation.pas',
  Delphi.Mocks.VirtualInterface in 'ThirdParty\Delphi-Mocks\Delphi.Mocks.VirtualInterface.pas',
  Delphi.Mocks.VirtualMethodInterceptor in 'ThirdParty\Delphi-Mocks\Delphi.Mocks.VirtualMethodInterceptor.pas',
  Delphi.Mocks.WeakReference in 'ThirdParty\Delphi-Mocks\Delphi.Mocks.WeakReference.pas',
  Delphi.Mocks.When in 'ThirdParty\Delphi-Mocks\Delphi.Mocks.When.pas',
  uPessoa in 'ThirdParty\DB1\uPessoa.pas',
  uPessoaRepository.Impl in 'ThirdParty\DB1\uPessoaRepository.Impl.pas',
  uPessoaRepository in 'ThirdParty\DB1\uPessoaRepository.pas',
  uPessoaService.Impl in 'ThirdParty\DB1\uPessoaService.Impl.pas',
  uPessoaService in 'ThirdParty\DB1\uPessoaService.pas',
  uPessoaServiceTest in 'uPessoaServiceTest.pas';

var
  runner : ITestRunner;
  results : IRunResults;
  logger : ITestLogger;
  nunitLogger : ITestLogger;
begin
{$IFDEF TESTINSIGHT}
  TestInsight.DUnitX.RunRegisteredTests;
  exit;
{$ENDIF}
  try
    TDUnitX.CheckCommandLine;
    logger := TDUnitXConsoleLogger.Create(true);

    runner := TDUnitX.CreateRunner;
    runner.UseRTTI := True;
    runner.AddLogger(logger);
    nunitLogger := TDUnitXXMLNUnitFileLogger.Create(TDUnitX.Options.XMLOutputFile);
    runner.AddLogger(nunitLogger);
    runner.FailsOnNoAsserts := False;

    results := runner.Execute;
    if not results.AllPassed then
      System.ExitCode := EXIT_ERRORS;

    {$IFNDEF CI}
    if TDUnitX.Options.ExitBehavior = TDUnitXExitBehavior.Pause then
    begin
      System.Write('Done.. press <Enter> key to quit.');
      System.Readln;
    end;
    {$ENDIF}
  except
    on E: Exception do
      System.Writeln(E.ClassName, ': ', E.Message);
  end;
end.
