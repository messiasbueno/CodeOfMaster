//////////////////////////////////////////////////////////////
//  Author: Messias Bueno                                   //
//    Date: 03/10/2019                                      //
// Mission: Em uma aplica��o console, escreva uma classe    //
//          que implemente o algoritmo de pilha. Esta       //
//          classe dever� utilizar Generics para poder      //
//          armazenar qualquer tipo de conte�do e conter os //
//          m�todos Push, Pop, Size e IsEmpty. Ap�s a       //
//          implementa��o da classe, fa�a:                  //
//            - Construa dois objetos. Um deve armazenar    //
//              strings e outro deve armazenar inteiros;    //
//            - Adicione tr�s strings aleat�rias e 15       //
//              n�meros aleat�rios (podem ser entradas do   //
//              usu�rio);                                   //
//            - Imprima o retorno da fun��o Size dos dois   //
//              objetos;                                    //
//            - Execute o m�todo Push da pilha de strings,  //
//              mostrando o resultado no console, at� que a //
//              pilha esteja vazia;                         //
//            - Fa�a o mesmo procedimento com a pilha de    //
//              inteiros;                                   //
//            - Imprima o retorno da fun��o Size dos dois   //
//              objetos;                                    //
//////////////////////////////////////////////////////////////
program mission08;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  System.Math,
  uStack in 'uStack.pas';

procedure main;
var
  oStackString: IStack<string>;
  oStackInteger: IStack<Integer>;
  sValue: string;
begin
  oStackString := TStack<string>.create;
  oStackInteger := TStack<Integer>.create;

  repeat
    Write('Enter text value or \end to end: ');
    Readln(sValue);

    if (sValue.ToLower.Equals('\end')) then
      Break;

    if (sValue.Trim.IsEmpty) then
    begin
      writeln('Value is invalid.');
      writeln(EmptyStr);
      Continue;
    end;
    oStackString.Push(sValue);
  until False;

  repeat
    Write('Enter number value or \end to end: ');
    Readln(sValue);

    if (sValue.ToLower.Equals('\end')) then
      Break;

    if (StrToIntDef(sValue,ZeroValue) <= ZeroValue) then
    begin
      writeln('Value is invalid.');
      writeln(EmptyStr);
      Continue;
    end;
    oStackInteger.Push(sValue.ToInteger);
  until False;

  Writeln(EmptyStr);
  Writeln('String stack quantity: ' + oStackString.Size.ToString);
  Writeln('Integer stack quantity: ' + oStackInteger.Size.ToString);
  Readln;

  Writeln('String stack:');
  while (not oStackString.IsEmpty) do
    Writeln(oStackString.Pop);
  Readln;

  Writeln('Integer stack:');
  while (not oStackInteger.IsEmpty) do
    Writeln(oStackInteger.Pop.ToString);
  Readln;

  Writeln(EmptyStr);
  Writeln('String stack quantity: ' + oStackString.Size.ToString);
  Writeln('Integer stack quantity: ' + oStackInteger.Size.ToString);
  Readln;
end;

begin
  main;
end.
