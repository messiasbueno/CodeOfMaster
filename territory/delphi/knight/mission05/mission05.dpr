///////////////////////////////////////////////////////////////////
//  Author: Messias Bueno                                        //
//    Date: 07/03/2020                                           //
// Mission: Em uma aplica��o console ou VCL, fa�a um la�o de     //
//          repeti��o de 1 at� 1 milh�o listando os n�meros      //
//          primos encontrados, utilizando o TParallel da        //
//          biblioteca System.Threading para paralelizar as      //
//          itera��es.                                           //
///////////////////////////////////////////////////////////////////
program mission05;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  System.Threading;

function IsPrime(pNumber: Integer): Boolean;
var
  vNumber: Integer;
begin
  if pNumber = 1 then
    Exit(False);

  for vNumber := 2 to (pNumber div 2) do
    if (pNumber mod vNumber = 0) then
      Exit(False);

  Result := True;
end;

procedure Main;
begin
  TParallel.For(
    1,
    1000000,
    procedure(pIndex: Integer)
    begin
      if (IsPrime(pIndex)) then
        Write(pIndex.ToString+',');
    end
  );

  Readln;
end;

begin
  Main;
end.
