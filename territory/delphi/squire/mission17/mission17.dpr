//////////////////////////////////////////////////////////////////////
//  Author: Messias Bueno                                           //
//    Date: 09/10/2019                                              //
// Mission: A partir de uma senten�a digitada pelo usu�rio,         //
//          execute a pesquisa na API do GitHub                     //
//          (https://api.github.com/search/repositories?q={busca}), //
//          substituindo o texto {busca} pela entrada do usu�rio.   //
//          Carregue a resposta da API em um objeto com os          //
//          seguintes campos: id, name, html_url e description. Por //
//          fim, liste todas as ocorr�ncias encontradas para o      //
//          usu�rio. A aplica��o pode ser console ou VCL.           //
//////////////////////////////////////////////////////////////////////
program mission17;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  REST.Json,
  uRest in 'uRest.pas',
  uRepositories in 'uRepositories.pas';

procedure main;
var
  oRest: TRest;
  oRepositories: TRepositories;
  oRepository: TRepository;
  sValue: string;
begin
  Write('Enter value: ');
  Readln(sValue);

  oRest := TRest.Create;
  try
    sValue := oRest.Execute(
      'https://api.github.com',
      'search',
      Format('repositories?q=%s',[sValue])
    );

    oRepositories := TJson.JsonToObject<TRepositories>(sValue);
    try
      for oRepository in oRepositories.Repositories do
      begin
        Writeln('==============================================================');
        Writeln('Id: ' + oRepository.Id.ToString);
        Writeln('Name: ' + oRepository.Name);
        Writeln('Html_url: ' + oRepository.Url);
        Writeln('Description: ' + oRepository.Description);
      end;
      Writeln('==============================================================');
    finally
      oRepositories.Free;
    end;
  finally
    oRest.Free;
  end;

  Readln;
end;

begin
  ReportMemoryLeaksOnShutdown := True;
  main;
end.
