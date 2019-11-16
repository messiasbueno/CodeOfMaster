unit uUtils;

interface

uses
  System.SysUtils;

type
  TcalculateTriangleAreaDLL = function(pBase, pHeight: Extended): Extended;
  TcalculateSquareAreaDLL = function(pSideA, pSideB: Extended): Extended;
  TcalculateCircleAreaDLL = function(pRadius: Extended): Extended;

  TUtils = class
  public
    class procedure calculateTriangleArea;
    class procedure calculateSquareArea;
    class procedure calculateCircleArea;
  end;

implementation

uses
  Winapi.Windows;

const
  cNameDLL = 'mission06dll.dll';
  cDllNotFound = 'Dll not found.';

{ TUtils }

class procedure TUtils.calculateTriangleArea;
var
  sValue: string;
  nBase: Extended;
  nHeight: Extended;
  oHandle: THandle;
  oCalculateTriangleAreaDLL: TcalculateTriangleAreaDLL;
  nArea: Extended;
begin
  repeat
    Write('Enter the base: ');
    Readln(sValue);

    if (StrToFloatDef(sValue,0) <= 0) then
    begin
      writeln('Value is invalid.');
      writeln(EmptyStr);
      continue;
    end;
    break;
  until false;
  nBase := StrToFloat(sValue);

  repeat
    Write('Enter the height: ');
    Readln(sValue);

    if (StrToFloatDef(sValue,0) <= 0) then
    begin
      writeln('Value is invalid.');
      writeln(EmptyStr);
      continue;
    end;
    break;
  until false;
  nHeight := StrToFloat(sValue);

  oHandle := LoadLibrary(cNameDLL);
  try
    if (oHandle <> 0) then
    begin
      oCalculateTriangleAreaDLL := GetProcAddress(oHandle, pWideChar('calculateTriangleArea'));

      nArea := oCalculateTriangleAreaDLL(nBase, nHeight);

      Writeln(Format('The area of the triangle is %0.2f',[nArea]));
    end
    else
      Writeln(cDllNotFound);

    Readln;
  finally
    FreeLibrary(oHandle);
  end;
end;

class procedure TUtils.calculateSquareArea;
var
  sValue: string;
  nSideA: Extended;
  nSideB: Extended;
  oHandle: THandle;
  oCalculateSquareAreaDLL: TcalculateSquareAreaDLL;
  nArea: Extended;
begin
  repeat
    Write('Enter the side A: ');
    Readln(sValue);

    if (StrToFloatDef(sValue,0) <= 0) then
    begin
      writeln('Value is invalid.');
      writeln(EmptyStr);
      continue;
    end;
    break;
  until false;
  nSideA := StrToFloat(sValue);

  repeat
    Write('Enter the side B: ');
    Readln(sValue);

    if (StrToFloatDef(sValue,0) <= 0) then
    begin
      writeln('Value is invalid.');
      writeln(EmptyStr);
      continue;
    end;
    break;
  until false;
  nSideB := StrToFloat(sValue);

  oHandle := LoadLibrary(cNameDLL);
  try
    if (oHandle <> 0) then
    begin
      oCalculateSquareAreaDLL := GetProcAddress(oHandle, pWideChar('calculateSquareArea'));

      nArea := oCalculateSquareAreaDLL(nSideA, nSideB);

      Writeln(Format('The area of the Square is %0.2f',[nArea]));
    end
    else
      Writeln(cDllNotFound);

    Readln;
  finally
    FreeLibrary(oHandle);
  end;
end;

class procedure TUtils.calculateCircleArea;
var
  sValue: string;
  nRadius: Extended;
  oHandle: THandle;
  oCalculateCircleAreaDLL: TcalculateCircleAreaDLL;
  nArea: Extended;
begin
  repeat
    Write('Enter the radius: ');
    Readln(sValue);

    if (StrToFloatDef(sValue,0) <= 0) then
    begin
      writeln('Value is invalid.');
      writeln(EmptyStr);
      continue;
    end;
    break;
  until false;
  nRadius := StrToFloat(sValue);

  oHandle := LoadLibrary(cNameDLL);
  try
    if (oHandle <> 0) then
    begin
      oCalculateCircleAreaDLL := GetProcAddress(oHandle, pWideChar('calculateCircleArea'));

      nArea := oCalculateCircleAreaDLL(nRadius);

      Writeln(Format('The area of the circle is %0.2f',[nArea]));
    end
    else
      Writeln(cDllNotFound);

    Readln;
  finally
    FreeLibrary(oHandle);
  end;
end;

end.
