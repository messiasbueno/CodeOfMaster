//////////////////////////////////////////////////////////////
//  Author: Messias Bueno                                   //
//    Date: 28/09/2019                                      //
// Mission: Em uma aplicação console, escreva um programa   //
//          que leia os seguintes dados: nome do vendedor,  //
//          salário fixo e total de vendas. Considerando    //
//          que o salário fixo tem um acréscimo de 15% com  //
//          base no total vendido, apresente na tela: o     //
//          nome do usuário, o salário fixo e o valor a     //
//          receber. Obs: Utilize um objeto para armazenar  //
//          essas informações do vendedor.                  //
//////////////////////////////////////////////////////////////
program mission03;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  uSeller in 'uSeller.pas';

procedure main;
var
  oSeller: TSeller;
  sValue: string;
begin
  oSeller := TSeller.Create;
  try
    Write('Enter seller name: ');
    readln(sValue);
    oSeller.Name := sValue;

    while True do
    begin
      Write('Enter the fixed salary: ');
      readln(sValue);

      if (StrToFloatDef(sValue,0) <= 0) then
      begin
        writeln('Fixed salary entered is invalid.');
        writeln(EmptyStr);
        continue;
      end;
      Break;
    end;
    oSeller.Salary := sValue.ToDouble;

    while True do
    begin
      Write('Enter the total sales: ');
      readln(sValue);

      if (StrToFloatDef(sValue,0) <= 0) then
      begin
        writeln('Total sales reported is invalid.');
        writeln(EmptyStr);
        continue;
      end;
      Break;
    end;
    oSeller.TotalSale := sValue.ToDouble;

    writeln(EmptyStr);
    writeln(EmptyStr);
    writeln('========== Seller ==========');
    writeln('        Name: '+ oSeller.Name);
    writeln('Fixed salary: '+ FormatFloat('####0.00',oSeller.Salary));
    writeln('  Total sale: '+ FormatFloat('####0.00',oSeller.TotalSale));
    writeln('Total salary: '+ FormatFloat('####0.00',oSeller.TotalSalary));
    writeln('============================');
    Readln;
  finally
    oSeller.Free;
  end;
end;

begin
  main;
end.
