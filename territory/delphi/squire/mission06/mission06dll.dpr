library mission06dll;

uses
  System.SysUtils,
  System.Classes;

{$R *.res}

function calculateTriangleArea(const pBase, pHeight: Extended): Extended;
begin
  Result := (pBase * pHeight) / 2;
end;

function calculateSquareArea(const pSideA, pSideB: Extended): Extended;
begin
  Result := pSideA * pSideB;
end;

function calculateCircleArea(const pRadius: Extended): Extended;
begin
  Result := System.Pi * (pRadius * pRadius);
end;

exports
  calculateTriangleArea,
  calculateSquareArea,
  calculateCircleArea;

begin
end.
