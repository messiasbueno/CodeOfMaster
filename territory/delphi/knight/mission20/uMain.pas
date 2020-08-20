unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Comp.BatchMove.Text, FireDAC.Comp.BatchMove,
  FireDAC.Comp.BatchMove.DataSet, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Stan.StorageBin, Vcl.StdCtrls;

type
  TfMain = class(TForm)
    FDConnection: TFDConnection;
    fdqEmployee: TFDQuery;
    FDBatchMoveDataSetWriter: TFDBatchMoveDataSetWriter;
    FDBatchMove: TFDBatchMove;
    FDBatchMoveTextReader: TFDBatchMoveTextReader;
    fdqEmployeeID: TIntegerField;
    fdqEmployeeNOME: TStringField;
    fdqEmployeeCIDADE: TStringField;
    fdqEmployeeEMAIL: TStringField;
    fdqEmployeeDATANASC: TDateField;
    fdqEmployeePROFISSAO: TStringField;
    fdqEmployeeCARTAO: TStringField;
    dsEmployee: TDataSource;
    dbgEmployee: TDBGrid;
    fdmEmployee: TFDMemTable;
    fdmEmployeeID: TIntegerField;
    fdmEmployeeNOME: TStringField;
    fdmEmployeeCIDADE: TStringField;
    fdmEmployeeEMAIL: TStringField;
    fdmEmployeeDATANASC: TDateField;
    fdmEmployeePROFISSAO: TStringField;
    fdmEmployeeCARTAO: TStringField;
    btnArrayDML: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnArrayDMLClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMain: TfMain;

implementation

{$R *.dfm}

uses
  System.Diagnostics;

procedure TfMain.FormCreate(Sender: TObject);
begin
  fdmEmployee.DisableControls;
  try
    FDBatchMoveTextReader.FileName := '../../Dados.csv';
    FDBatchMove.Execute;
    fdmEmployee.First;
  finally
    fdmEmployee.EnableControls;
  end;
end;

procedure TfMain.btnArrayDMLClick(Sender: TObject);
var
  vPosition: integer;
  vIndex: integer;
  vStopwatch: TStopwatch;
begin
  fdqEmployee.DisableControls;
  fdmEmployee.DisableControls;
  vPosition := fdmEmployee.RecNo;
  try
    fdqEmployee.Params.ArraySize := fdmEmployee.RecordCount;

    vStopwatch := TStopwatch.StartNew;

    fdmEmployee.First;
    while (not fdmEmployee.Eof) do
    begin
      vIndex := Pred(fdmEmployee.RecNo);
      fdqEmployee.ParamByName('id').AsIntegers[vIndex] := fdmEmployeeID.AsInteger;
      fdqEmployee.ParamByName('nome').AsStrings[vIndex] := fdmEmployeeNOME.AsString;
      fdqEmployee.ParamByName('cidade').AsStrings[vIndex] := fdmEmployeeCIDADE.AsString;
      fdqEmployee.ParamByName('email').AsStrings[vIndex] := fdmEmployeeEMAIL.AsString;
      fdqEmployee.ParamByName('datanasc').AsDates[vIndex] := fdmEmployeeDATANASC.AsDateTime;
      fdqEmployee.ParamByName('profissao').AsStrings[vIndex] := fdmEmployeePROFISSAO.AsString;
      fdqEmployee.ParamByName('cartao').AsStrings[vIndex] := fdmEmployeeCARTAO.AsString;

      fdmEmployee.Next;
    end;

    fdqEmployee.Execute(fdmEmployee.RecordCount, 0);
  finally
    fdmEmployee.RecNo := vPosition;
    fdmEmployee.EnableControls;
    fdqEmployee.EnableControls;
  end;

  vStopwatch.Stop;
  ShowMessage('Done in '+ vStopwatch.Elapsed.ToString);
end;


end.
