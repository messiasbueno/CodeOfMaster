//////////////////////////////////////////////////////////////
//  Author: Messias Bueno                                   //
//    Date: 03/10/2019                                      //
// Mission: Em uma aplicação console, escreva uma classe    //
//          que implemente o algoritmo de pilha. Esta       //
//          classe deverá utilizar Generics para poder      //
//          armazenar qualquer tipo de conteúdo e conter os //
//          métodos Push, Pop, Size e IsEmpty. Após a       //
//          implementação da classe, faça:                  //
//            - Construa dois objetos. Um deve armazenar    //
//              strings e outro deve armazenar inteiros;    //
//            - Adicione três strings aleatórias e 15       //
//              números aleatórios (podem ser entradas do   //
//              usuário);                                   //
//            - Imprima o retorno da função Size dos dois   //
//              objetos;                                    //
//            - Execute o método Push da pilha de strings,  //
//              mostrando o resultado no console, até que a //
//              pilha esteja vazia;                         //
//            - Faça o mesmo procedimento com a pilha de    //
//              inteiros;                                   //
//            - Imprima o retorno da função Size dos dois   //
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
  ReportMemoryLeaksOnShutdown := True;
  main;
end.
