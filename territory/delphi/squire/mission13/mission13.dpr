//////////////////////////////////////////////////////////////
//  Author: Messias Bueno                                   //
//    Date: 06/10/2019                                      //
// Mission: Crie uma Interface com um m�todo de leitura de  //
//          arquivos (LerDoArquivo) e outra Interface com   //
//          um m�todo de escrita de arquivos                //
//          (SalvarParaArquivo). Escreva uma classe que     //
//          implemente essas duas Interfaces, cujos m�todos //
//          devem carregar e salvar o conte�do dessa classe.//
//          Dica: O conte�do pode ser uma TStringList       //
//////////////////////////////////////////////////////////////
program mission13;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  uInterface in 'uInterface.pas',
  uFile in 'uFile.pas',
  Vcl.Forms;

procedure main;
var
  oFileWrite: IFileWrite;
  oFileRead: IFileRead;
  oFile: TFile;
begin
  oFileWrite := TFile.Create;
  oFile := oFileWrite as TFile;
  oFile.Path := ExtractFilePath(Application.exename);
  oFile.FileName := 'Mission 13.txt';

  oFile.FileList.Add('Row one');
  oFile.FileList.Add('Row two');
  oFile.FileList.Add('Row trhee');
  oFile.FileList.Add('Row four');

  oFile.SaveToFile;
  Writeln('Save file to folder ' + oFile.Path);

  oFileRead := TFile.Create;
  oFile := oFileRead as TFile;
  oFile.Path := 'c:\Disk';
  oFile.FileName := 'Mission 13.txt';
  oFile.ReadToFile;

  Writeln('Uploaded the file with the following information:');
  Writeln(oFile.FileList.Text);

  Readln;
end;

begin
  main;
end.
