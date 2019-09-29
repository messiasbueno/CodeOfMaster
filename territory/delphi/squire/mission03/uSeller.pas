unit uSeller;

interface

type
  TSeller = Class
  private
    FSalary: Currency;
    FTotalSale: Currency;
    FName: string;
    function GetTotalSalary: Currency;
  public
    property Name: string read FName write FName;
    property Salary: Currency read FSalary write FSalary;
    property TotalSale: Currency read FTotalSale write FTotalSale;
    property TotalSalary: Currency read GetTotalSalary;
  End;
implementation

{ TSeller }

function TSeller.GetTotalSalary: Currency;
begin
  Result := Salary + (TotalSale * 0.15);
end;

end.
