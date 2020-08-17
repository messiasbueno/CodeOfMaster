/////////////////////////////////////////////////////////////////////
//  Author: Messias Bueno                                          //
//    Date: 17/08/2020                                             //
// Mission: Em uma aplica��o console, defina uma classe chamada    //
//          TOperacoes que contenha os seguintes m�todos:          //
//          OrdenarLetras: receba uma palavra como par�metro e     //
//          retorne um texto com as letras ordenadas em ordem      //
//          alfab�tica, sem espa�os;                               //
//          ContarOcorrencias: receba dois par�metros (uma palavra //
//          e uma letra), e conte a quantidade de ocorr�ncias que  //
//          a letra � encontrada na palavra, retornando um n�mero. //
//          Caso a palavra ou a letra estejam vazios, levante uma  //
//          exce��o;                                               //
//          RemoverAcentos: receba uma palavra como par�metro e    //
//          remova todos os acentos (por exemplo: "�rg�o" para     //
//          "orgao"). Caso exista algum caracter que n�o seja      //
//          alfanum�rico, uma exce��o deve ser gerada.             //
//          Em seguida, implemente testes unit�rios para essa      //
//          classe, testando inclusive as exce��es.                //
/////////////////////////////////////////////////////////////////////
program mission12;

{$IFNDEF TESTINSIGHT}
{$APPTYPE CONSOLE}
{$ENDIF}{$STRONGLINKTYPES ON}
uses
  System.SysUtils,
  {$IFDEF TESTINSIGHT}
  TestInsight.DUnitX,
  {$ENDIF }
  DUnitX.Loggers.Console,
  DUnitX.Loggers.Xml.NUnit,
  DUnitX.TestFramework,
  uOperations in 'uOperations.pas',
  uOperationsTest in 'uOperationsTest.pas';

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
    //We don't want this happening when running under CI.
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
