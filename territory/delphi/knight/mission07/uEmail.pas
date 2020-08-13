unit uEmail;

interface

uses
  System.SysUtils,
  IdSMTP,
  IdMessage,
  IdSSLOpenSSL,
  IdExplicitTLSClientServerBase,
  IdAttachmentFile;

type
  TEmail = class
  private
    FIdSMTP: TIdSMTP;
    FIdMessage: TIdMessage;
    FIdSSLIOHandlerSocketOpenSSL: TIdSSLIOHandlerSocketOpenSSL;

    procedure Addlist(const pList: string; pProcAdd: TProc<string>);
  public
    constructor create;
    destructor Destroy; override;

    procedure Connect(
      Const pHost: string;
      Const pPort: SmallInt;
      Const pUser: string;
      Const pPassword: string;
      Const pSSLVersion: TIdSSLVersion;
      Const pSSLMode: TIdSSLMode
    );
    procedure Sender(
      Const pEmail: string;
      Const pName: string
    );
    procedure AddRecipient(Const pEmail: string);
    procedure AddRecipients(Const pListEmail: string);
    procedure AddCarbonCopy(Const pEmail: string);
    procedure AddCarbonCopies(Const pListEmail: string);
    procedure AddBlindCarbonCopy(Const pEmail: string);
    procedure AddBlindCarbonCopies(Const pListEmail: string);
    procedure AddAttachment(Const pAttachment: string);
    procedure AddAttachments(Const pListAttachment: string);
    procedure AddMessage(Const pSubject, pBody: string);
    procedure Send;
  end;



implementation

uses
  System.StrUtils,
  System.Types;

{ TEmail }

constructor TEmail.create;
begin
  Self.FIdSSLIOHandlerSocketOpenSSL := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  Self.FIdSMTP := TIdSMTP.Create(nil);
  Self.FIdSMTP.IOHandler := FIdSSLIOHandlerSocketOpenSSL;
  Self.FIdMessage := TIdMessage.Create(nil);
end;

destructor TEmail.Destroy;
begin
  Self.FIdSSLIOHandlerSocketOpenSSL.Free;
  Self.FIdSMTP.Free;
  Self.FIdMessage.Free;

  inherited;
end;

procedure TEmail.Connect(const pHost: string; const pPort: SmallInt;
  const pUser, pPassword: string; const pSSLVersion: TIdSSLVersion;
  const pSSLMode: TIdSSLMode);
begin
  Self.FIdSSLIOHandlerSocketOpenSSL.SSLOptions.Method := pSSLVersion;
  Self.FIdSSLIOHandlerSocketOpenSSL.SSLOptions.Mode := pSSLMode;

  Self.FIdSMTP.UseTLS := utUseRequireTLS;
  Self.FIdSMTP.Host := pHost;
  Self.FIdSMTP.Port := pPort;
  Self.FIdSMTP.Username := pUser;
  Self.FIdSMTP.Password := pPassword;

  Self.FIdSMTP.Connect;
  Self.FIdSMTP.Authenticate;
end;

procedure TEmail.Sender(const pEmail, pName: string);
begin
  Self.FIdMessage.From.Address := pEmail;
  Self.FIdMessage.From.Name := pName;
end;

procedure TEmail.AddRecipient(const pEmail: string);
begin
  Self.FIdMessage.Recipients.EMailAddresses := pEmail;
end;

procedure TEmail.AddRecipients(const pListEmail: string);
begin
  Self.Addlist(
    pListEmail,
    procedure (vItem: string)
    begin
      Self.AddRecipient(vItem);
    end
  );
end;

procedure TEmail.AddCarbonCopy(const pEmail: string);
begin
  Self.FIdMessage.CCList.EMailAddresses := pEmail;
end;

procedure TEmail.AddCarbonCopies(const pListEmail: string);
begin
  Self.Addlist(
    pListEmail,
    procedure (vItem: string)
    begin
      Self.AddCarbonCopy(vItem);
    end
  );
end;

procedure TEmail.AddBlindCarbonCopy(const pEmail: string);
begin
  Self.FIdMessage.BccList.EMailAddresses := pEmail;
end;

procedure TEmail.AddBlindCarbonCopies(const pListEmail: string);
begin
  Self.Addlist(
    pListEmail,
    procedure (vItem: string)
    begin
      Self.AddBlindCarbonCopy(vItem);
    end
  );
end;

procedure TEmail.AddAttachment(const pAttachment: string);
begin
  TIdAttachmentFile.Create(FIdMessage.MessageParts, pAttachment);
end;

procedure TEmail.AddAttachments(const pListAttachment: string);
begin
  Self.Addlist(
    pListAttachment,
    procedure (vItem: string)
    begin
      Self.AddAttachment(vItem);
    end
  );
end;

procedure TEmail.AddMessage(const pSubject, pBody: string);
const
  cCharSet = 'iso-8859-1';
  cContentType = 'text/html';
begin
  Self.FIdMessage.CharSet := cCharSet;
  Self.FIdMessage.Encoding := meMIME;
  Self.FIdMessage.ContentType := cContentType;
  Self.FIdMessage.Subject := pSubject;
  Self.FIdMessage.Body.Text := pBody;
end;

procedure TEmail.Send;
begin
  Self.FIdSMTP.Send(FIdMessage);
end;

procedure TEmail.Addlist(const pList: string; pProcAdd: TProc<string>);
var
  vList: TStringDynArray;
  vItem: string;
begin
  if (pList.Trim.IsEmpty) then
    Exit;

  vList := SplitString(pList,',');
  for vItem in vList do
    if (not vItem.Trim.IsEmpty) then
      pProcAdd(vItem);
end;

end.
