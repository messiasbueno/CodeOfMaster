unit uZipFile;

interface

uses
  Vcl.ComCtrls,
  Vcl.Forms,
  System.Classes,
  System.Generics.Collections,
  System.Zip;

type
  TControllerZip = class
  private
    FFileList: TList<string>;
    FZipFile: TZipFile;
    FNameFile: string;
    FProgessBar: TProgressBar;
    FFilesSize: Int64;
    FCompressSize: Int64;
    FHasInvalidExtension: Boolean;
    function GetFilesSize: Int64;
    procedure EventoOnProgress(Sender: TObject; FileName: string; Header: TZipHeader; Position: Int64);
  public
    constructor Create;
    destructor Destroy; override;

    procedure AddFile(const pValue: string); overload;
    procedure AddFile(const pRange: TArray<string>); overload;
    procedure Compress;

    class function IsValidExtension(const pNameFile: string): Boolean;

    property NameFile: string read FNameFile write FNameFile;
    property HasInvalidExtension: Boolean read FHasInvalidExtension;
    property ProgessBar: TProgressBar write FProgessBar;
  end;

implementation

uses
  System.SysUtils,
  System.Math;

{ TControllerZip }

constructor TControllerZip.Create;
begin
  Self.FZipFile := TZipFile.Create;
  Self.FZipFile.OnProgress := EventoOnProgress;
  Self.FFileList := TList<string>.Create;
  Self.FHasInvalidExtension := False;
end;

destructor TControllerZip.Destroy;
begin
  Self.FZipFile.Free;
  inherited;
end;

class function TControllerZip.IsValidExtension(
  const pNameFile: string): Boolean;
begin
  Result := not pNameFile.EndsWith('.exe');
end;

procedure TControllerZip.AddFile(const pValue: string);
begin
  if (Self.IsValidExtension(pValue)) then
    Self.FFileList.Add(pValue)
  else
    FHasInvalidExtension := True;
end;

procedure TControllerZip.AddFile(const pRange: TArray<string>);
var
  vFile: string;
begin
  for vFile in pRange do
    Self.AddFile(vFile);
end;

procedure TControllerZip.Compress;
var
  vFile: string;
begin
  if (FileExists(Self.FNameFile)) then
    DeleteFile(Self.FNameFile);

  if (Assigned(Self.FProgessBar)) then
    Self.FProgessBar.Position := ZeroValue;

  Self.FFilesSize := Self.GetFilesSize;
  Self.FCompressSize := ZeroValue;

  Self.FZipFile.Open(Self.FNameFile,zmWrite);

  for vFile in Self.FFileList do
  begin
    Self.FZipFile.Add(vFile);
    Self.FCompressSize := Self.FCompressSize +
      Self.FZipFile.FileInfo[Pred(Self.FZipFile.FileCount)].UncompressedSize;
  end;
end;

function TControllerZip.GetFilesSize: Int64;
var
  vFileName: string;
  vFile: file of Byte;
begin
  Result := ZeroValue;
  for vFileName in Self.FFileList do
  begin
    AssignFile(vFile, vFileName);
    Reset(vFile);
    Result := Result + FileSize(vFile);
    CloseFile(vFile);
  end;
end;

procedure TControllerZip.EventoOnProgress(Sender: TObject; FileName: string;
  Header: TZipHeader; Position: Int64);
begin
  Application.ProcessMessages;
  if (Assigned(Self.FProgessBar)) then
    Self.FProgessBar.Position := Trunc((Self.FCompressSize + Position) / Self.FFilesSize * 100);
end;

end.
