unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Stan.StorageXML, FireDAC.Stan.StorageBin, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteDef, FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.VCLUI.Wait,
  FireDAC.DApt, FireDAC.Phys.SQLiteVDataSet, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids;

type
  TfMain = class(TForm)
    FDStanStorageXMLLink: TFDStanStorageXMLLink;
    FDLocalSQL: TFDLocalSQL;
    dsLocal: TDataSource;
    FDPhysSQLiteDriverLink: TFDPhysSQLiteDriverLink;
    FDConnection: TFDConnection;
    fdqLocal: TFDQuery;
    fdqLocalid: TLargeintField;
    fdqLocalnome: TStringField;
    fdqLocalidcidade: TLargeintField;
    fdqLocalnomeCidade: TStringField;
    dbgLocal: TDBGrid;
    edtCity: TEdit;
    lblCity: TLabel;
    fdmtCustomer: TFDMemTable;
    fdmtCity: TFDMemTable;
    procedure FormCreate(Sender: TObject);
    procedure edtCityChange(Sender: TObject);
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
  fdmtCity.LoadFromFile('../../Cidades.xml');
  fdmtCustomer.LoadFromFile('../../Clientes.xml');

  FDLocalSQL.Active := True;
  FDConnection.Connected := True;
  fdqLocal.Active := True;
end;

procedure TfMain.edtCityChange(Sender: TObject);
var
  vCity: string;
begin
  fdqLocal.Filtered := False;

  vCity := TEdit(sender).Text;
  if vCity.Trim.IsEmpty then
    Exit;

  fdqLocal.Filter := 'Lower(nomeCidade) Like '+QuotedStr('%'+LowerCase(vCity)+'%');
  fdqLocal.Filtered := True;
end;

end.
