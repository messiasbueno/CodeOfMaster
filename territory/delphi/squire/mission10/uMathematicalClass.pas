unit uMathematicalClass;

interface
uses
 System.SysUtils;

type
  TMathematicalClass = class
  private
    FRight: Double;
    FLeft: Double;
    FMathematicalOperation: TFunc<Double>;
  public
    property Left: Double read FLeft write FLeft;
    property Right: Double read FRight write FRight;
    property MathematicalOperation: TFunc<Double> read FMathematicalOperation write FMathematicalOperation;
  end;

implementation

end.
