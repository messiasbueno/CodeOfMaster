unit uDownloadFile;

interface

uses
  System.Classes,
  System.SysUtils,
  IdHTTP,
  IdComponent;

type
  TDownloadFile = Class(TThread)
  private
    FUrl: String;
    FOnWork: TWorkEvent;
    FOnWorkBegin: TWorkBeginEvent;
    FOnWorkEnd: TWorkEndEvent;

    function GetFileName: string;
  protected
    Procedure Execute; Override;
  public
    Constructor Create;

    property Url: String read FUrl write FUrl;
    property OnWork: TWorkEvent read FOnWork write FOnWork;
    property OnWorkBegin: TWorkBeginEvent read FOnWorkBegin write FOnWorkBegin;
    property OnWorkEnd: TWorkEndEvent read FOnWorkEnd write FOnWorkEnd;
  end;

implementation

uses
  System.StrUtils;

{ TDownloadFile }

constructor TDownloadFile.Create;
begin
  Inherited Create(True);
  Self.FreeOnTerminate := True;

  Self.FUrl := EmptyStr;
  Self.FOnWork := nil;
  Self.FOnWorkBegin := nil;
  Self.FOnWorkEnd := nil;
end;

procedure TDownloadFile.Execute;
var
  vFileStream: TFileStream;
  vIdHTTP: TIdHTTP;
begin
  vFileStream := TFileStream.Create(Self.GetFileName, fmCreate);
  try
    vIdHTTP := TIdHTTP.Create(nil);
    try
      vIdHTTP.OnWork := Self.FOnWork;
      vIdHTTP.OnWorkBegin := Self.FOnWorkBegin;
      vIdHTTP.OnWorkEnd := Self.FOnWorkEnd;

      vIdHTTP.Get(Self.FUrl, vFileStream);
    finally
      vIdHTTP.Free;
    end;
    finally
    vFileStream.Free;
  end;
end;

function TDownloadFile.GetFileName: string;
var
  vFirstBarra: Integer;
begin
  Result := ReverseString(Self.FUrl);
  vFirstBarra := Pred(Pos('/', Result));
  Result := Copy(Result,1 , vFirstBarra);
  Result := ReverseString(Result);
end;

end.
