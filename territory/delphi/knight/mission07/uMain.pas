unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IdBaseComponent, IdComponent,
  IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL,
  Vcl.Tabs, Vcl.DockTabSet, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Samples.Gauges;

type
  TfMain = class(TForm)
    PgcMain: TPageControl;
    TsEmail: TTabSheet;
    tsSettings: TTabSheet;
    GpbServer: TGroupBox;
    EdtPassword: TEdit;
    EdtUser: TEdit;
    EdtServer: TEdit;
    EdtPort: TEdit;
    LblUser: TLabel;
    LblPassword: TLabel;
    LblServer: TLabel;
    LblPort: TLabel;
    GpbSSL: TGroupBox;
    CbbSSLMethod: TComboBox;
    CbbSSLMode: TComboBox;
    EdtNickname: TEdit;
    LblNickname: TLabel;
    LblSSLMode: TLabel;
    LblSSLMethod: TLabel;
    BtnTestConnect: TButton;
    GpbRecipient: TGroupBox;
    EdtTo: TEdit;
    EdtCc: TEdit;
    EdtBcc: TEdit;
    LblTo: TLabel;
    LblCc: TLabel;
    LblBcc: TLabel;
    GpbBody: TGroupBox;
    LblSubject: TLabel;
    EdtSubject: TEdit;
    MmoBody: TMemo;
    GpbAttach: TGroupBox;
    LblAttach: TLabel;
    MmoAttachment: TMemo;
    BtnSend: TButton;
    procedure BtnTestConnectClick(Sender: TObject);
    procedure BtnSendClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMain: TfMain;

implementation

uses
  uEmail;

{$R *.dfm}

procedure TfMain.BtnSendClick(Sender: TObject);

begin
  TThread.CreateAnonymousThread(
    procedure
    var
      vEmail: TEmail;
    begin
      vEmail := TEmail.create;
      try
        vEmail.Connect(
          EdtServer.Text,
          string(EdtPort.Text).toInteger,
          EdtUser.Text,
          EdtPassword.Text,
          TIdSSLVersion(CbbSSLMethod.ItemIndex),
          TIdSSLMode(CbbSSLMode.ItemIndex)
        );

        vEmail.Sender(
          EdtUser.Text,
          EdtNickname.Text
        );

        vEmail.AddRecipients(EdtTo.Text);
        vEmail.AddCarbonCopies(EdtCc.Text);
        vEmail.AddBlindCarbonCopies(EdtBcc.Text);
        vEmail.AddAttachments(MmoAttachment.Lines.CommaText);

        vEmail.AddMessage(EdtSubject.Text, MmoBody.Lines.Text);
        vEmail.Send;
      finally
        vEmail.Free;
      end;
    end
  ).Start;
end;

procedure TfMain.BtnTestConnectClick(Sender: TObject);
var
  vEmail: TEmail;
begin
  vEmail := TEmail.create;
  try
    vEmail.Connect(
      EdtServer.Text,
      string(EdtPort.Text).toInteger,
      EdtUser.Text,
      EdtPassword.Text,
      TIdSSLVersion(CbbSSLMethod.ItemIndex),
      TIdSSLMode(CbbSSLMode.ItemIndex)
    );

    ShowMessage('Connection OK!');
  finally
    vEmail.Free;
  end;
end;

end.
