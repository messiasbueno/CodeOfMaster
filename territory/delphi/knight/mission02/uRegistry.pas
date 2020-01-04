unit uRegistry;

interface

uses
  System.Classes,
  Winapi.Windows,
  Datasnap.DBClient,
  Data.DB,
  System.SysUtils,
  System.Win.Registry;

type
  TRegistry = class
  private
    FRegistry: System.Win.Registry.TRegistry;
    FProgramList: TClientDataSet;

    function getListKeys: TStringList;
    procedure CreateProgramList;
    procedure DeleteProgramList;
    function ValidRegistry: Boolean;
  public
    constructor Create;
    destructor Destroy; override;

    function InstalledPragrams: TClientDataSet;
  end;

const
  cDisplayName = 'DisplayName';
  cDisplayVersion = 'DisplayVersion';
  cPublisher = 'Publisher';

implementation

const
  cUninstallPath = 'SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall';

{ TRegistry }

constructor TRegistry.Create;
begin
  Self.FRegistry := System.Win.Registry.TRegistry.Create;
  Self.CreateProgramList;
end;

destructor TRegistry.Destroy;
begin
  Self.FProgramList.Free;
  Self.FRegistry.Free;
  inherited;
end;

procedure TRegistry.CreateProgramList;
begin
  Self.FProgramList := TClientDataSet.Create(nil);
  Self.FProgramList.FieldDefs.Add(cDisplayName, ftString, 500);
  Self.FProgramList.FieldDefs.Add(cDisplayVersion, ftString, 500);
  Self.FProgramList.FieldDefs.Add(cPublisher, ftString, 500);
  Self.FProgramList.CreateDataSet;
  Self.FProgramList.IndexFieldNames := cDisplayName;
end;

procedure TRegistry.DeleteProgramList;
begin
  while (Self.FProgramList.RecordCount > 0) do
    Self.FProgramList.Delete;
end;

function TRegistry.getListKeys: TStringList;
begin
  Result := TStringList.Create;

  if (Self.FRegistry.OpenKeyReadOnly(cUninstallPath)) then
  begin
    try
      Self.FRegistry.GetKeyNames(Result);
    finally
      Self.FRegistry.CloseKey;
    end;
  end;
end;

function TRegistry.InstalledPragrams: TClientDataSet;
var
  oListKey: TStringList;
  cKey: string;
begin
  Self.FRegistry.RootKey := HKEY_LOCAL_MACHINE;
  Self.DeleteProgramList;

  oListKey := Self.getListKeys;
  try
    for cKey in oListKey do
    begin
      if (not Self.FRegistry.OpenKeyReadOnly(cUninstallPath+'\'+cKey)) then
        Continue;

      if (Self.ValidRegistry) then
      begin
        Self.FProgramList.Insert;
        Self.FProgramList.FieldByName(cDisplayName).AsString :=
          Self.FRegistry.ReadString(cDisplayName).Trim;
        Self.FProgramList.FieldByName(cDisplayVersion).AsString :=
          Self.FRegistry.ReadString(cDisplayVersion).Trim;
        Self.FProgramList.FieldByName(cPublisher).AsString :=
          Self.FRegistry.ReadString(cPublisher).Trim;
        Self.FProgramList.Post;
      end;

      Self.FRegistry.CloseKey;
    end;
  finally
    oListKey.Free;
  end;

  Result := Self.FProgramList;
end;

function TRegistry.ValidRegistry: Boolean;
begin
  Result := Self.FRegistry.ReadString(cDisplayName).Trim <> EmptyStr;
end;

end.
