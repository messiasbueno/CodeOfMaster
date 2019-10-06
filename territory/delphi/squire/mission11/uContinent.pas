unit uContinent;

interface

type
  TContinent = (
    ctAfrica,
    ctAsia,
    ctEurope,
    ctNorthAmerica,
    ctSouthAmerica,
    cdAntarctica,
    ctAustralia
  );

  TContinentHelper = record helper for TContinent
    function AsLabel: string;
    function AsString: string;
    function AsByte: SmallInt;
    function Parse(pContinent: SmallInt): TContinent;
  end;

Const
  TContinents: TArray<TContinent> =[
    ctAfrica,
    ctAsia,
    ctEurope,
    ctNorthAmerica,
    ctSouthAmerica,
    cdAntarctica,
    ctAustralia
  ];

implementation

{ TContinentHelper }

function TContinentHelper.AsByte: SmallInt;
begin
  Result := SmallInt(Self);
end;

function TContinentHelper.AsLabel: string;
begin
  case self of
    ctAfrica: Result := 'Africa';
    ctAsia: Result := 'Asia';
    ctEurope: Result := 'Europe';
    ctNorthAmerica: Result := 'North America';
    ctSouthAmerica: Result := 'South America';
    cdAntarctica: Result := 'Antarctica';
    ctAustralia: Result := 'Australia';
  end;
end;

function TContinentHelper.AsString: string;
begin
  case self of
    ctAfrica: Result := 'ctAfrica';
    ctAsia: Result := 'ctAsia';
    ctEurope: Result := 'ctEurope';
    ctNorthAmerica: Result := 'ctNorthAmerica';
    ctSouthAmerica: Result := 'ctSouthAmerica';
    cdAntarctica: Result := 'cdAntarctica';
    ctAustralia: Result := 'ctAustralia';
  end;
end;

function TContinentHelper.Parse(pContinent: SmallInt): TContinent;
begin
  Result := TContinent(pContinent);
end;

end.
