unit uStack;

interface

uses
  System.SysUtils, System.Generics.Collections;

type
  TStack<T> = class(TObject)
  private
    FList: TList<T>;
  public
    constructor create;
    destructor Destroy; override;

    procedure Push(Const pItem: T);
    function Pop: T;
    function Peek: T;
    function Size: Integer;
    function IsEmpty: Boolean;
  end;
implementation

uses
  System.Math;

{ TStack<T> }

constructor TStack<T>.create;
begin
  Self.FList := TList<T>.Create;
end;

destructor TStack<T>.Destroy;
begin
  Self.FList.Free;
  inherited;
end;

function TStack<T>.IsEmpty: Boolean;
begin
  Result := Self.FList.Count = ZeroValue;
end;

function TStack<T>.Peek: T;
begin
  Result := Self.FList[ZeroValue];
end;

function TStack<T>.Pop: T;
begin
  Result := Self.Peek;
  Self.FList.Delete(ZeroValue);
end;

procedure TStack<T>.Push(Const pItem: T);
begin
  Self.FList.Insert(ZeroValue,pItem);
end;

function TStack<T>.Size: Integer;
begin
  Result := Self.FList.Count;
end;

end.
