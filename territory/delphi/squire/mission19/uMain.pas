unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfMain = class(TForm)
    mmList: TMemo;
    procedure FormCreate(Sender: TObject);
  private
    procedure ReadXML;
  end;

var
  fMain: TfMain;

implementation

uses
  System.Math,
  uXML;

{$R *.dfm}

procedure TfMain.FormCreate(Sender: TObject);
begin
  Self.ReadXML;
end;

procedure TfMain.ReadXML;
var
  oXMLResponseType: IXMLResponseType;
  oXMLItemType: IXMLItemType;
  nIndex: integer;
begin
  oXMLResponseType := uXML.Loadresponse('../../mission19.xml');

  mmList.Lines.Clear;
  for nIndex := ZeroValue to Pred(oXMLResponseType.Result.Count) do
  begin
    oXMLItemType := oXMLResponseType.Result.Item[nIndex];

    mmList.Lines.Add('ID: ' + oXMLItemType.Id.ToString);
    mmList.Lines.Add('Name: ' + oXMLItemType.First_name);
    mmList.Lines.Add('Last name: ' + oXMLItemType.Last_name);
    mmList.Lines.Add('Gender: ' + oXMLItemType.Gender);
    mmList.Lines.Add('Date of birth: ' + oXMLItemType.Dob);
    mmList.Lines.Add('E-mail: ' + oXMLItemType.Email);
    mmList.Lines.Add('Phone: ' + oXMLItemType.Phone);
    mmList.Lines.Add('Website: ' + oXMLItemType.Website);
    mmList.Lines.Add('Address: ' + oXMLItemType.Address);
    mmList.Lines.Add('Status: ' + oXMLItemType.Status);
    mmList.Lines.Add('Link (HATEOAS):');
    mmList.Lines.Add('|_ Resource: ' + oXMLItemType._links.Self.Href);
    mmList.Lines.Add('|_ Edit: ' + oXMLItemType._links.Edit.Href);
    mmList.Lines.Add('|_ Avatar: ' + oXMLItemType._links.Avatar.Href);
  end;
end;

end.
