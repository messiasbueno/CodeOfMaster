unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, Vcl.ExtCtrls, Vcl.DBCtrls,
  Vcl.Grids, Vcl.DBGrids, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Phys.IBBase, FireDAC.Comp.UI, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TfMain = class(TForm)
    FDConnection: TFDConnection;
    fdqDepartment: TFDQuery;
    fdqDepartmentIDDEPARTAMENTO: TIntegerField;
    fdqDepartmentDESCRICAO: TStringField;
    fdqDepartmentTELEFONE: TStringField;
    dsDepartment: TDataSource;
    fdqEmployee: TFDQuery;
    fdqEmployeeIDFUNCIONARIO: TIntegerField;
    fdqEmployeeNOME: TStringField;
    fdqEmployeeADMISSAO: TDateField;
    fdqEmployeeSALARIO: TCurrencyField;
    dsEmployee: TDataSource;
    fdsaEmployeeDepartment: TFDSchemaAdapter;
    PageControl: TPageControl;
    tbsEmployee: TTabSheet;
    dbgEmployee: TDBGrid;
    dbnEmployee: TDBNavigator;
    tbsDepartment: TTabSheet;
    dbgDepartment: TDBGrid;
    dbnDepartment: TDBNavigator;
    dbgEmployeeDepartment: TDBGrid;
    dbnEmployeeDepartment: TDBNavigator;
    fdqEmployeeDepartment: TFDQuery;
    fdqEmployeeDepartmentIDDEPARTAMENTO: TIntegerField;
    fdqEmployeeDepartmentIDFUNCIONARIO: TIntegerField;
    dsEmployeeDepartment: TDataSource;
    btnSave: TButton;
    lblDepartmentEmployees: TLabel;
    fdqEmployeeDepartmentnomeFuncionario: TStringField;
    procedure btnSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMain: TfMain;

implementation

{$R *.dfm}

procedure TfMain.FormCreate(Sender: TObject);
begin
  FDConnection.Connected := True;
  fdqDepartment.Active := True;
  fdqEmployee.Active := True;
  fdqEmployeeDepartment.Active := True;
end;

procedure TfMain.btnSaveClick(Sender: TObject);
begin
  fdsaEmployeeDepartment.ApplyUpdates(0);
end;

end.
