unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, REST.Types, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Vcl.StdCtrls, Vcl.ExtCtrls,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, REST.Response.Adapter, Vcl.Grids,
  Vcl.DBGrids, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope;

type
  TfMain = class(TForm)
    RESTRequest: TRESTRequest;
    RESTClient: TRESTClient;
    RESTResponse: TRESTResponse;
    DBGrid: TDBGrid;
    RESTResponseDataSetAdapter: TRESTResponseDataSetAdapter;
    FDMemTable: TFDMemTable;
    DataSource: TDataSource;
    Panel: TPanel;
    Edit: TEdit;
    Button: TButton;
    FDMemTablelogin: TWideStringField;
    FDMemTableid: TWideStringField;
    FDMemTablenode_id: TWideStringField;
    FDMemTableavatar_url: TWideStringField;
    FDMemTablegravatar_id: TWideStringField;
    FDMemTableurl: TWideStringField;
    FDMemTablehtml_url: TWideStringField;
    FDMemTablefollowers_url: TWideStringField;
    FDMemTablefollowing_url: TWideStringField;
    FDMemTablegists_url: TWideStringField;
    FDMemTablestarred_url: TWideStringField;
    FDMemTablesubscriptions_url: TWideStringField;
    FDMemTableorganizations_url: TWideStringField;
    FDMemTablerepos_url: TWideStringField;
    FDMemTableevents_url: TWideStringField;
    FDMemTablereceived_events_url: TWideStringField;
    FDMemTabletype: TWideStringField;
    FDMemTablesite_admin: TWideStringField;
    procedure ButtonClick(Sender: TObject);
  end;

var
  fMain: TfMain;

implementation

uses
  REST.HttpClient;

{$R *.dfm}

procedure TfMain.ButtonClick(Sender: TObject);
begin
  RESTResponseDataSetAdapter.Active := False;

  RESTRequest.ResourceSuffix := Edit.Text;
  RESTRequest.Execute;

  if (RESTResponse.Status.ClientErrorNotFound_404) then
    ShowMessage('Data not found')
  else
    RESTResponseDataSetAdapter.Active := True;
end;

end.
