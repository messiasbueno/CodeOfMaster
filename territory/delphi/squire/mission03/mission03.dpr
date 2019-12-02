//////////////////////////////////////////////////////////////
//  Author: Messias Bueno                                   //
//    Date: 28/09/2019                                      //
// Mission: Em uma aplica��o console, escreva um programa   //
//          que leia os seguintes dados: nome do vendedor,  //
//          sal�rio fixo e total de vendas. Considerando    //
//          que o sal�rio fixo tem um acr�scimo de 15% com  //
//          base no total vendido, apresente na tela: o     //
//          nome do usu�rio, o sal�rio fixo e o valor a     //
//          receber. Obs: Utilize um objeto para armazenar  //
//          essas informa��es do vendedor.                  //
//////////////////////////////////////////////////////////////
program mission03;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  uSeller in 'uSeller.pas';

procedure main;
const
 cFormat: string = '###,###,##0.00';
var
  oSeller: ISeller;
  sValue: string;
begin
  oSeller := TSeller.Create;
  Write('Enter seller name: ');
  readln(sValue);
  oSeller.Name := sValue;

  repeat
    Write('Enter the fixed salary: ');
    readln(sValue);

    if (StrToFloatDef(sValue,0) <= 0) then
    begin
      writeln('Fixed salary entered is invalid.');
      writeln(EmptyStr);
      continue;
    end;
    Break;
  until False;
  oSeller.Salary := sValue.ToDouble;

  repeat
    Write('Enter the total sales: ');
    readln(sValue);

    if (StrToFloatDef(sValue,0) <= 0) then
    begin
      writeln('Total sales reported is invalid.');
      writeln(EmptyStr);
      continue;
    end;
    Break;
  until False;
  oSeller.TotalSale := sValue.ToDouble;

  writeln(EmptyStr);
  writeln(EmptyStr);
  writeln('========== Seller ==========');
  writeln('        Name: '+ oSeller.Name);
  writeln('Fixed salary: '+ FormatFloat(cFormat,oSeller.Salary));
  writeln('  Total sale: '+ FormatFloat(cFormat,oSeller.TotalSale));
  writeln('Total salary: '+ FormatFloat(cFormat,oSeller.TotalSalary));
  writeln('============================');
  Readln;
end;

begin
  ReportMemoryLeaksOnShutdown := True;
  main;
end.
