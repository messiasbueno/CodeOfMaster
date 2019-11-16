unit uSeller;

interface

type
  ISeller = interface
  ['{AF18617F-7EED-4EDF-AB7A-FE1B6E479540}']
    procedure SetName(const pValue: string);
    procedure SetSalary(const pValue: Currency);
    procedure SetTotalSale(const pValue: Currency);

    function GetName: string;
    function GetSalary: Currency;
    function GetTotalSale: Currency;
    function GetTotalSalary: Currency;

    property Name: string read GetName write SetName;
    property Salary: Currency read GetSalary write SetSalary;
    property TotalSale: Currency read GetTotalSale write SetTotalSale;
    property TotalSalary: Currency read GetTotalSalary;
  end;

  TSeller = Class(TInterfacedObject, ISeller)
  private
    FSalary: Currency;
    FTotalSale: Currency;
    FName: string;

    procedure SetName(const pValue: string);
    procedure SetSalary(const pValue: Currency);
    procedure SetTotalSale(const pValue: Currency);

    function GetName: string;
    function GetSalary: Currency;
    function GetTotalSale: Currency;
    function GetTotalSalary: Currency;
  public
    property Name: string read GetName write FName;
    property Salary: Currency read FSalary write FSalary;
    property TotalSale: Currency read FTotalSale write FTotalSale;
    property TotalSalary: Currency read GetTotalSalary;
  End;
implementation

{ TSeller }

function TSeller.GetName: string;
begin
  Result := Self.FName;
end;

function TSeller.GetSalary: Currency;
begin
  Result := Self.FSalary;
end;

function TSeller.GetTotalSalary: Currency;
begin
  Result := Salary + (TotalSale * 0.15);
end;

function TSeller.GetTotalSale: Currency;
begin
  Result := Self.FTotalSale;
end;

procedure TSeller.SetName(const pValue: string);
begin
  Self.FName := pValue;
end;

procedure TSeller.SetSalary(const pValue: Currency);
begin
  Self.FSalary := pValue;
end;

procedure TSeller.SetTotalSale(const pValue: Currency);
begin
  Self.FTotalSale := pValue;
end;

end.
