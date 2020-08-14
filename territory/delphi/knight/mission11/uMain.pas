unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfMain = class(TForm)
    BtnSearch: TButton;
    EdtCEP: TEdit;
    lblCEP: TLabel;
    LblStreet: TLabel;
    LblDistrict: TLabel;
    LblCity: TLabel;
    LblState: TLabel;
    lblStreetValue: TLabel;
    lblDistrictValue: TLabel;
    lblCityValue: TLabel;
    lblStateValue: TLabel;
    procedure BtnSearchClick(Sender: TObject);
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
  uAtendeCliente;

procedure TfMain.BtnSearchClick(Sender: TObject);
var
  vMailWS: AtendeCliente;
  vAddress: enderecoERP;
begin
  vMailWS := GetAtendeCliente(True);

  try
    vAddress := vMailWS.consultaCEP(EdtCEP.Text);

    lblStreetValue.Caption := vAddress.end_;
    LblDistrictValue.Caption := vAddress.bairro;
    LblCityValue.Caption := vAddress.cidade;
    LblStateValue.Caption := vAddress.uf;
  except
    lblStreetValue.Caption := EmptyStr;
    LblDistrictValue.Caption := EmptyStr;
    LblCityValue.Caption := EmptyStr;
    LblStateValue.Caption := EmptyStr;

    ShowMessage('CEP not found');
  end;
end;

end.
