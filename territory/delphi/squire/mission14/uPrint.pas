unit uPrint;

interface

type
  IScanner = interface
    ['{DCECBBBE-EA18-499E-92D7-D1837C868C3F}']
  end;

  IFax = interface
    ['{4CC4CAB9-9476-4EA6-9B48-CBBBD9F55A0D}']
  end;

  ICopying = interface
    ['{42D4D244-D881-4863-9488-1EC1197EFEBB}']
  end;

  IPrinter = interface
    ['{10D305C7-5E9C-43B2-A327-FC6BE5F16E57}']
  end;

  TMultiFunctional = class(TInterfacedObject, IScanner, IFax, ICopying, IPrinter)
  end;

  TDevice = class
  private
    FSerialNumber: string;
    FDeviceType: string;
    FCadastreDate: TDateTime;
    FMark: string;
    FPurchaseDate: TDate;
    FModel: string;
    FColor: string;
    FActive: Boolean;
  public
    property Mark: string read FMark write FMark;
    property Model: string read FModel write FModel;
    property Color: string read FColor write FColor;
    property SerialNumber: string read FSerialNumber write FSerialNumber;
    property PurchaseDate: TDate read FPurchaseDate write FPurchaseDate;
    property CadastreDate: TDateTime read FCadastreDate write FCadastreDate;
    property Active: Boolean read FActive write FActive;
    property DeviceType: string read FDeviceType write FDeviceType;
  end;

  TPrinter = class(TDevice)
  private
    FMultiFunctional: TMultiFunctional;
  public
    Constructor Create;

    property MultiFunctional: TMultiFunctional read FMultiFunctional write FMultiFunctional;
  end;

implementation

{ TPrinter }

constructor TPrinter.Create;
begin
  Self.FMultiFunctional := TMultiFunctional.Create;
end;

end.
