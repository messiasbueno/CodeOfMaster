unit uControlXML;

interface

uses
  System.SysUtils,
  Vcl.StdCtrls,
  Vcl.ComCtrls,
  Vcl.Buttons,
  uXML;

type
  TControlXML = class
  private
    FIndex: Integer;
    FId: TEdit;
    FStatus: TComboBox;
    FName: TEdit;
    FLastName: TEdit;
    FGenger: TComboBox;
    FDoB: TDateTimePicker;
    FEmail: TEdit;
    FPhone: TEdit;
    FWebSite: TEdit;
    FAddress: TEdit;
    FPrior: TSpeedButton;
    FFirst: TSpeedButton;
    FNext: TSpeedButton;
    FLast: TSpeedButton;
    FInsert: TSpeedButton;
    FRemove: TSpeedButton;
    FLoad: TSpeedButton;
    FSave: TSpeedButton;

    FXMLResponseType: IXMLResponseType;

    procedure ClearFields;
    procedure SetFields;

    procedure ControlButtons;
    procedure First(Sender: TObject);
    procedure Prior(Sender: TObject);
    procedure Next(Sender: TObject);
    procedure Last(Sender: TObject);
    procedure Load(Sender: TObject);
    procedure Remove(Sender: TObject);
    procedure Insert(Sender: TObject);
    procedure Save(Sender: TObject);
    procedure Validation;

    procedure SaveToFile;
  protected
    function StatusStrToInt(const pStatus: String): Integer;
    function IntToStatusStr(const pStatus: Integer): string;
    function GenderStrToInt(const pGender: String): Integer;
    function IntToGenderStr(const pGender: Integer): string;
  public
    constructor Create(
      pId: TEdit;
      pStatus: TComboBox;
      pName: TEdit;
      pLastName: TEdit;
      pGenger: TComboBox;
      pDoB: TDateTimePicker;
      pEmail: TEdit;
      pPhone: TEdit;
      pWebSite: TEdit;
      pAddress: TEdit;
      pPrior: TSpeedButton;
      pFirst: TSpeedButton;
      pNext: TSpeedButton;
      pLast: TSpeedButton;
      pInsert: TSpeedButton;
      pRemove: TSpeedButton;
      pLoad: TSpeedButton;
      pSave: TSpeedButton
    ); overload;
  end;


implementation

uses
  System.Math,
  System.Classes,
  Xml.XMLIntf,
  Xml.XMLDoc;

const
  cFilePath = '../../mission20.xml';
  cFilePath_edit = '../../mission20_edit.xml';

  cStatusActive = 'active';
  cStatusInactive = 'inactive';
  cStatusActiveInt = 0;
  cStatusInactiveInt = 1;

  cGenderMale = 'male';
  cGenderFemale = 'female';
  cGenderMaleInt = 0;
  cGenderFemaleInt = 1;

{ TControlXML }

constructor TControlXML.Create(pId: TEdit; pStatus: TComboBox; pName,
  pLastName: TEdit; pGenger: TComboBox; pDoB: TDateTimePicker; pEmail, pPhone,
  pWebSite, pAddress: TEdit; pPrior, pFirst, pNext, pLast, pInsert, pRemove,
  pLoad, pSave: TSpeedButton);
begin
  Self.FId := pId;
  Self.FStatus := pStatus;
  Self.FName := pName;
  Self.FLastName := pLastName;
  Self.FGenger := pGenger;
  Self.FDoB := pDoB;
  Self.FEmail := pEmail;
  Self.FPhone := pPhone;
  Self.FWebSite := pWebSite;
  Self.FAddress := pAddress;
  Self.ClearFields;

  Self.FPrior := pPrior;
  Self.FFirst := pFirst;
  Self.FNext := pNext;
  Self.FLast := pLast;
  Self.FInsert := pInsert;
  Self.FRemove := pRemove;
  Self.FLoad := pLoad;
  Self.FSave := pSave;

  Self.FPrior.OnClick := Self.Prior;
  Self.FFirst.OnClick := Self.First;
  Self.FNext.OnClick := Self.Next;
  Self.FLast.OnClick := Self.Last;
  Self.FInsert.OnClick := Self.Insert;
  Self.FRemove.OnClick := Self.Remove;
  Self.FLoad.OnClick := Self.Load;
  Self.FSave.OnClick := Self.Save;
  Self.ControlButtons;
end;

procedure TControlXML.ControlButtons;
var
  bDefault: Boolean;
begin
  bDefault := (
    Assigned(Self.FXMLResponseType) and
    (Self.FXMLResponseType.Result.Count > ZeroValue)
  );

  Self.FPrior.Enabled := bDefault and (Self.FIndex > ZeroValue);
  Self.FFirst.Enabled := Self.FPrior.Enabled;
  Self.FNext.Enabled := bDefault and (Self.FIndex < Pred(Self.FXMLResponseType.Result.Count));
  Self.FLast.Enabled := Self.FNext.Enabled;
  Self.FInsert.Enabled := bDefault;
  Self.FRemove.Enabled := bDefault and (Self.FXMLResponseType.Result.Count > ZeroValue);
  Self.FLoad.Enabled := True;
  Self.FSave.Enabled := bDefault;
end;

procedure TControlXML.ClearFields;
begin
  Self.FIndex := NegativeValue;
  Self.FId.Clear;
  Self.FStatus.ItemIndex := NegativeValue;
  Self.FName.Clear;
  Self.FLastName.Clear;
  Self.FGenger.ItemIndex := NegativeValue;
  Self.FDoB.Date := Now;
  Self.FEmail.Clear;
  Self.FPhone.Clear;
  Self.FWebSite.Clear;
  Self.FAddress.Clear;
end;

procedure TControlXML.SetFields;
var
  oXMLItemType: IXMLItemType;
begin
  oXMLItemType := FXMLResponseType.Result.Item[Self.FIndex];

  Self.FId.Text := oXMLItemType.Id.ToString;
  Self.FStatus.ItemIndex := Self.StatusStrToInt(oXMLItemType.Status);
  Self.FName.Text := oXMLItemType.First_name;
  Self.FLastName.Text := oXMLItemType.Last_name;
  Self.FGenger.ItemIndex := Self.GenderStrToInt(oXMLItemType.Gender);
  Self.FDoB.Date := StrToDateDef(oXMLItemType.Dob,ZeroValue);
  Self.FEmail.Text := oXMLItemType.Email;
  Self.FPhone.Text := oXMLItemType.Phone;
  Self.FWebSite.Text := oXMLItemType.Website;
  Self.FAddress.Text := oXMLItemType.Address;
end;

function TControlXML.StatusStrToInt(const pStatus: String): Integer;
begin
  if (pStatus = cStatusActive) then
    Result := cStatusInactiveInt
  else
    Result := cStatusActiveInt;
end;

function TControlXML.IntToStatusStr(const pStatus: Integer): string;
begin
  case pStatus of
    cStatusActiveInt: Result := cStatusActive;
    cStatusInactiveInt: Result := cStatusInactive;
  end;
end;

function TControlXML.GenderStrToInt(const pGender: String): Integer;
begin
  if (pGender = cGenderFemale) then
    Result := cGenderMaleInt
  else
    Result := cGenderFemaleInt;
end;

function TControlXML.IntToGenderStr(const pGender: Integer): string;
begin
  case pGender of
    cGenderMaleInt: Result := cGenderMale;
    cGenderFemaleInt: Result := cGenderFemale;
  end;
end;

procedure TControlXML.Insert(Sender: TObject);
begin
  Self.ClearFields;
  Self.FId.SetFocus;
end;

procedure TControlXML.Validation;
var
  nId: Integer;
  nIndex: Integer;
  oXMLItemType: IXMLItemType;
begin
  nId := StrToIntDef(Self.FId.Text,ZeroValue);
  if (nId <= ZeroValue) then
    raise Exception.Create('Field Id invalid.');

  for nIndex := ZeroValue to Pred(Self.FXMLResponseType.Result.Count) do
  begin
    oXMLItemType := Self.FXMLResponseType.Result.Item[nIndex];
    if (nIndex = Self.FIndex) then
      Continue;

    if (nId = oXMLItemType.Id) then
      raise Exception.Create('Field Id duplicated.');
  end;

  if (not Self.FStatus.ItemIndex in [cStatusActiveInt,cStatusInactiveInt]) then
    raise Exception.Create('Field Status invalid.');

  if (string(Self.FName.Text).Trim.IsEmpty) then
    raise Exception.Create('Field Name is empty.');

  if (string(Self.FLastName.Text).Trim.IsEmpty) then
    raise Exception.Create('Field Last name is empty.');

  if (not Self.FGenger.ItemIndex in [cGenderMaleInt,cGenderFemaleInt]) then
    raise Exception.Create('Field Gengar invalid.');

  if (Self.FDoB.Date > Date) then
    raise Exception.Create('Field Date of birth invalid.');
end;

procedure TControlXML.Save(Sender: TObject);
var
  oXMLItemType: IXMLItemType;
begin
  Self.Validation;

  if (Self.FIndex = NegativeValue) then
    oXMLItemType := Self.FXMLResponseType.Result.Add
  else
    oXMLItemType := Self.FXMLResponseType.Result.item[Self.FIndex];

  oXMLItemType.Id := StrToInt(Self.FId.Text);
  oXMLItemType.Status := IntToStatusStr(Self.FStatus.ItemIndex);
  oXMLItemType.First_name := Self.FName.Text;
  oXMLItemType.Last_name := Self.FLastName.Text;
  oXMLItemType.Gender := Self.IntToGenderStr(Self.FGenger.ItemIndex);
  oXMLItemType.Dob := FormatDateTime('aaaa-mm-dd',Self.FDoB.Date);
  oXMLItemType.Email := Self.FEmail.Text;
  oXMLItemType.Phone := Self.FPhone.Text;
  oXMLItemType.Website := Self.FWebSite.Text;
  oXMLItemType.Address := Self.FAddress.Text;

  if (Self.FIndex = NegativeValue) then
    Self.Last(Self.FLast);

  Self.SaveToFile;
end;

procedure TControlXML.SaveToFile;
var
  oXMLDocument: IXMLDocument;
begin
  oXMLDocument := TXMLDocument.Create(nil);
  oXMLDocument.LoadFromXML(Self.FXMLResponseType.XML);
  oXMLDocument.SaveToFile(cFilePath_edit);
end;

procedure TControlXML.Load(Sender: TObject);
begin
  Self.ClearFields;

  if (FileExists(cFilePath_edit)) then
    Self.FXMLResponseType := uXML.Loadresponse(cFilePath_edit)
  else
    Self.FXMLResponseType := uXML.Loadresponse(cFilePath);

  if (Self.FXMLResponseType.Result.Count > ZeroValue) then
  begin
    Self.FIndex := ZeroValue;
    Self.SetFields;
  end;
  Self.ControlButtons;
end;

procedure TControlXML.Remove(Sender: TObject);
begin
  if (Self.FIndex >= ZeroValue) then
  begin
    Self.FXMLResponseType.Result.Delete(Self.FIndex);
    if (Self.FIndex > Pred(Self.FXMLResponseType.Result.Count)) then
      Self.FIndex := Pred(Self.FXMLResponseType.Result.Count);

    if (Self.FIndex < ZeroValue) then
      Self.ClearFields
    else
      Self.SetFields;
    Self.ControlButtons;

    Self.SaveToFile;
  end;
end;

procedure TControlXML.First(Sender: TObject);
begin
  Self.FIndex := ZeroValue;
  Self.SetFields;
  Self.ControlButtons;
end;

procedure TControlXML.Last(Sender: TObject);
begin
  Self.FIndex := Pred(FXMLResponseType.Result.Count);
  Self.SetFields;
  Self.ControlButtons;
end;

procedure TControlXML.Next(Sender: TObject);
begin
  Inc(Self.FIndex);
  Self.SetFields;
  Self.ControlButtons;
end;

procedure TControlXML.Prior(Sender: TObject);
begin
  Dec(Self.FIndex);
  Self.SetFields;
  Self.ControlButtons;
end;

end.
