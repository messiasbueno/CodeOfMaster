//////////////////////////////////////////////////////////////
//  Author: Messias Bueno                                   //
//    Date: 06/10/2019                                      //
// Mission: Crie uma Interface com um método de leitura de  //
//          arquivos (LerDoArquivo) e outra Interface com   //
//          um método de escrita de arquivos                //
//          (SalvarParaArquivo). Escreva uma classe que     //
//          implemente essas duas Interfaces, cujos métodos //
//          devem carregar e salvar o conteúdo dessa classe.//
//          Dica: O conteúdo pode ser uma TStringList       //
//////////////////////////////////////////////////////////////
program mission13;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  uInterface in 'uInterface.pas',
  uFile in 'uFile.pas',
  Vcl.Forms;

procedure SaveFile;
var
  oFile: IFileWrite;
begin
  oFile := TFile.Create(
    ExtractFilePath(Application.exename),
    'Mission 13.txt'
  );

  TFile(oFile).FileList.Add('Row one');
  TFile(oFile).FileList.Add('Row two');
  TFile(oFile).FileList.Add('Row trhee');
  TFile(oFile).FileList.Add('Row four');

  oFile.SaveToFile;
  Writeln('Save file to folder ' + TFile(oFile).Path);
end;

procedure ReadFile;
var
  oFile: IFileRead;
begin
  oFile := TFile.Create(
    ExtractFilePath(Application.exename),
    'Mission 13.txt'
  );

  oFile.ReadToFile;

  Writeln('Uploaded the file with the following information:');
  Writeln(TFile(oFile).FileList.Text);
end;

procedure main;
begin
  SaveFile;
  ReadFile;

  Readln;
end;

begin
  ReportMemoryLeaksOnShutdown := True;
  main;
end.
