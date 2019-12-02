//////////////////////////////////////////////////////////////
//  Author: Messias Bueno                                   //
//    Date: 06/10/2019                                      //
// Mission: Em uma aplica��o console, crie um tipo          //
//          enumerado que represente os continentes.        //
//          Construa um Record Helper para este tipo com os //
//          seguintes m�todos:                              //
//          AsLabel: com uma descri��o amig�vel ao usu�rio; //
//          AsString: com o nome do Enum;                   //
//          AsByte: com a representa��o num�rica do Enum;   //
//          Parse: que transforme um Byte no Enum.          //
//////////////////////////////////////////////////////////////
program mission11;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  System.Math,
  uContinent in 'uContinent.pas';

procedure main;
var
  oContinent: TContinent;
begin
  for oContinent in TContinents do
  begin
    Write('Identifier: ' + oContinent.AsByte.ToString);
    Write(' name: ' + oContinent.AsString);
    Writeln(' Description: ' +oContinent.AsLabel);
  end;

  Writeln(EmptyStr);
  Writeln('Name parse 3: ' + oContinent.Parse(3).AsString);

  Readln;
end;

begin
  ReportMemoryLeaksOnShutdown := True;
  main;
end.
