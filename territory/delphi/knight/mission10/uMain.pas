unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TfMain = class(TForm)
    EdtEmail: TEdit;
    LblEmail: TLabel;
    BtnValid: TButton;
    PnlValid: TPanel;
    procedure BtnValidClick(Sender: TObject);
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
  WebServices,
  System.RegularExpressions;

procedure TfMain.BtnValidClick(Sender: TObject);
var
  RegExp: RegExpDetails;
begin
  RegExp := GetWebservicesSoap(True).getRegExpDetails(3122);

  if TRegEx.IsMatch(EdtEmail.Text, RegExp.regular_expression) then
  begin
    PnlValid.Color := clGreen;
    PnlValid.Caption := 'E-mail Valid';
  end
  else
  begin
    PnlValid.Color := clRed;
    PnlValid.Caption := 'E-mail Invalid';
  end;
end;

end.
