unit uContinent;

interface

type
  TContinent = (
    ctAfrica,
    ctAsia,
    ctEurope,
    ctAmerica,
    cdAntarctica,
    ctOceania
  );

  TContinentHelper = record helper for TContinent
    function AsLabel: string;
    function AsString: string;
    function AsByte: SmallInt;
    function Parse(const pContinent: SmallInt): TContinent;
  end;

Const
  TContinents: TArray<TContinent> =[
    ctAfrica,
    ctAsia,
    ctEurope,
    ctAmerica,
    cdAntarctica,
    ctOceania
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
    ctAmerica: Result := 'America';
    cdAntarctica: Result := 'Antarctica';
    ctOceania: Result := 'Oceania';
  end;
end;

function TContinentHelper.AsString: string;
begin
  case self of
    ctAfrica: Result := 'ctAfrica';
    ctAsia: Result := 'ctAsia';
    ctEurope: Result := 'ctEurope';
    ctAmerica: Result := 'ctAmerica';
    cdAntarctica: Result := 'cdAntarctica';
    ctOceania: Result := 'ctOceania';
  end;
end;

function TContinentHelper.Parse(const pContinent: SmallInt): TContinent;
begin
  Result := TContinent(pContinent);
end;

end.
