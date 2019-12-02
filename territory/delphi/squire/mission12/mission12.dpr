//////////////////////////////////////////////////////////////
//  Author: Messias Bueno                                   //
//    Date: 06/10/2019                                      //
// Mission: Criar um Class Helper para a classe TStringList //
//          com as seguintes funções:                       //
//            IsEmpty: Verifica se lista está vazia;        //
//            HasDuplicate: Verifica se a lista contém      //
//              valores duplicados;                         //
//            ToJSON: Verifica se o conteúdo da Lista está  //
//              no formato Nome=Valor. Caso esteja,         //
//              transforme o conteúdo conforme a notação    //
//              JSON e retorne como string (não é necessário//
//              utilizar as classes nativas neste momento). //
//              Caso não esteja, lance uma exceção          //
//              informando que não foi possível converter o //
//              conteúdo.                                   //
//////////////////////////////////////////////////////////////
program mission12;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  System.Classes,
  System.Classes.Helper in 'System.Classes.Helper.pas';

procedure main;
var
  oList: TStringList;
begin
  oList := TStringList.Create;
  try
    try
      oList.toJson;
    except
      on E: Exception do
        Writeln(e.Message);
    end;

    try
      oList.Add('duplicated');
      oList.Add('duplicated');
      oList.toJson;
    except
      on E: Exception do
        Writeln(e.Message);
    end;

    try
      oList.Clear;
      oList.Add('Invalid Item');
      oList.toJson;
    except
      on E: Exception do
        Writeln(e.Message);
    end;

    oList.Clear;
    oList.Values['Code'] := 10.ToString;
    oList.Values['Name'] := 'Messias';
    oList.Values['Active'] := 'True';
    oList.Values['City'] := 'null';

    Writeln(oList.toJson);
  finally
    oList.Free;
  end;

  Readln;
end;

begin
  ReportMemoryLeaksOnShutdown := True;
  main;
end.
