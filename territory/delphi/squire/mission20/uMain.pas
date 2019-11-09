unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.WinXPickers, Vcl.ComCtrls, Vcl.Buttons, uControlXML;

type
  TfMain = class(TForm)
    pnData: TPanel;
    LblId: TLabel;
    EdtId: TEdit;
    LblStatus: TLabel;
    CbxStatus: TComboBox;
    LblName: TLabel;
    EdtName: TEdit;
    LblLastName: TLabel;
    EdtLastName: TEdit;
    LblGender: TLabel;
    CbxGenger: TComboBox;
    LblDoB: TLabel;
    DtpDoB: TDateTimePicker;
    LblEmail: TLabel;
    EdtEmail: TEdit;
    LblPhone: TLabel;
    EdtPhone: TEdit;
    LblWebSite: TLabel;
    EdtWebSite: TEdit;
    EdtAddress: TEdit;
    LblAddress: TLabel;
    pnButtons: TPanel;
    SpdPrior: TSpeedButton;
    SbtFirst: TSpeedButton;
    SpdNext: TSpeedButton;
    SpdLast: TSpeedButton;
    SpdInsert: TSpeedButton;
    SpdRemove: TSpeedButton;
    SpdLoad: TSpeedButton;
    SpdSave: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FControlXML: TControlXML;
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
  Self.FControlXML := TControlXML.Create(
    EdtId, CbxStatus, EdtName, EdtLastName, CbxGenger,
    DtpDoB, EdtEmail, EdtPhone, EdtWebSite, EdtAddress,
    SpdPrior, SbtFirst, SpdNext, SpdLast, SpdInsert,
    SpdRemove, SpdLoad, SpdSave
  );
end;

procedure TfMain.FormDestroy(Sender: TObject);
begin
  Self.FControlXML.Free;
end;

end.
