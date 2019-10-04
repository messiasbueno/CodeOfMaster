unit uEmployee;

interface

type
  TEmployee = class
  private
    FName: string;
    FEmail: string;
    FPhone: string;
  public
    property Name: string read FName write FName;
    property Email: string read FEmail write FEmail;
    property Phone: string read FPhone write FPhone;
  end;


implementation

end.
