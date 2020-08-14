unit uState;

interface

uses
  Horse,
  Horse.Commons,
  System.JSON,
  System.SysUtils,
  uStateList;

implementation

procedure Get(Req: THorseRequest; Res: THorseResponse; Next: TProc);
begin
  Res.Send<TJSONArray>(uStateList.Itens).Status(THTTPStatus.OK);
end;

procedure GetId(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  vState: TJSONValue;
  vId: Integer;
begin
  vId := Req.Params.Items['id'].ToInteger;

  for vState in uStateList.Itens do
  begin
    if (vState.AsType<TJSONObject>.Values['id'].ToString.ToInteger = vId) then
    begin
      Res.Send<TJSONObject>(vState.AsType<TJSONObject>).Status(THTTPStatus.OK);
      Exit;
    end;
  end;

  Res.Status(THTTPStatus.NoContent);
end;

initialization
  THorse.Get('/estados', Get);
  THorse.Get('/estado/:id', GetId);
end.
