unit uCacheObjects;

interface

uses
  System.SysUtils, System.Generics.Collections;

type
  TCacheObjects = class
  private
    FList: TObjectDictionary<string,TObject>;
    function GetClassType<T: class>: string;
  public
    constructor Create;
    destructor Destroy; Override;

    function getInstance<T: class, constructor>: T; overload;
  end;

implementation

uses
  Rtti, TypInfo;

{ TCacheObjects }

constructor TCacheObjects.Create;
begin
  Self.FList := TObjectDictionary<string,TObject>.Create;
end;

destructor TCacheObjects.Destroy;
var
  vObject: TObject;
begin
  for vObject in Self.FList.Values do
    vObject.Free;

  Self.FList.Free;
  inherited;
end;

function TCacheObjects.GetClassType<T>: string;
begin
  Result := GetTypeData(PTypeInfo(TypeInfo(T)))^.ClassType.ClassName;
end;

function TCacheObjects.getInstance<T>: T;
begin
  if (Self.FList.ContainsKey(Self.GetClassType<T>)) then
    Exit(Self.FList.Items[Self.GetClassType<T>] as T);

  Result := T.Create;
  Self.FList.Add(Self.GetClassType<T>, TObject(Result));
end;

end.

