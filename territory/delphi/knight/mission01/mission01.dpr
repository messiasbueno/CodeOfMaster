////////////////////////////////////////////////////////////////
//  Author: Messias Bueno                                     //
//    Date: 03/12/2019                                        //
// Mission: Em uma aplicação console, defina duas Interfaces, //
//          chamadas IRepositorioNuvem e IRepositorioArquivo. //
//          Ambas devem declarar o método "SalvarDados".      //
//          Em seguida, declare uma classe que implemente as  //
//          duas Interfaces e codifique o método "SalvarDados"//
//          de cada Interface. Use o conceito de Method       //
//          Resolution Clause para tratar o conflito de nomes //
//          de métodos iguais.                                //
////////////////////////////////////////////////////////////////
program mission01;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  uCloudRepository in 'uCloudRepository.pas',
  uFileRepository in 'uFileRepository.pas',
  uRepository in 'uRepository.pas';

procedure main;
var
  oCloudRepository: ICloudRepository;
  oFileRepository: IFileRepository;
begin
  oCloudRepository := TRepository.Create;
  oCloudRepository.SaveData;

  Writeln('==============================');

  oFileRepository := TRepository.Create;
  oFileRepository.SaveData;

  Readln;
end;

begin
  main;
  ReportMemoryLeaksOnShutdown := True;
end.
