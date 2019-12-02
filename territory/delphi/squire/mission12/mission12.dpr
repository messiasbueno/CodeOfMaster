//////////////////////////////////////////////////////////////
//  Author: Messias Bueno                                   //
//    Date: 06/10/2019                                      //
// Mission: Criar um Class Helper para a classe TStringList //
//          com as seguintes fun��es:                       //
//            IsEmpty: Verifica se lista est� vazia;        //
//            HasDuplicate: Verifica se a lista cont�m      //
//              valores duplicados;                         //
//            ToJSON: Verifica se o conte�do da Lista est�  //
//              no formato Nome=Valor. Caso esteja,         //
//              transforme o conte�do conforme a nota��o    //
//              JSON e retorne como string (n�o � necess�rio//
//              utilizar as classes nativas neste momento). //
//              Caso n�o esteja, lance uma exce��o          //
//              informando que n�o foi poss�vel converter o //
//              conte�do.                                   //
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
