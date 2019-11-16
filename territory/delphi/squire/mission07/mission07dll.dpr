library mission07dll;

uses
  System.SysUtils,
  System.Classes,
  uUtils in 'uUtils.pas';

{$R *.res}

function valueByExtensive(const pValue: Currency): string;
var
  oUtils: TUtils;
begin
  oUtils := TUtils.Create;
  try
    Result := oUtils.valueByExtensive(pValue);
  finally
    oUtils.Free;
  end;
end;

exports
  valueByExtensive;

begin
end.
