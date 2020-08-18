unit uStateList;

interface
uses
  System.SysUtils,
  System.JSON;

function Itens: TJSONArray;

implementation

Const
  cDataState =
    '[{"id":1,"name":"Acre","Abbreviation":"AC"},{"id":2,"name":"Alagoas","Abbreviation":"AL"},'+
    '{"id":3,"name":"Amapá","Abbreviation":"AP"},{"id":4,"name":"Amazonas","Abbreviation":"AM"},'+
    '{"id":5,"name":"Bahia","Abbreviation":"BA"},{"id":6,"name":"Ceará","Abbreviation":"CE"},'+
    '{"id":7,"name":"Distrito Federal","Abbreviation":"DF"},{"id":8,"name":"Espírito Santo","Abbreviation":"ES"},'+
    '{"id":9,"name":"Goiás","Abbreviation":"GO"},{"id":10,"name":"Maranhão","Abbreviation":"MA"},'+
    '{"id":11,"name":"Mato Grosso","Abbreviation":"MT"},{"id":12,"name":"Mato Grosso do Sul","Abbreviation":"MS"},'+
    '{"id":13,"name":"Minas Gerais","Abbreviation":"MG"},{"id":14,"name":"Pará","Abbreviation":"PA"},'+
    '{"id":15,"name":"Paraíba","Abbreviation":"PB"},{"id":16,"name":"Paraná","Abbreviation":"PR"},'+
    '{"id":17,"name":"Pernambuco","Abbreviation":"PE"},{"id":18,"name":"Piauí","Abbreviation":"PI"},'+
    '{"id":19,"name":"Rio de Janeiro","Abbreviation":"RJ"},{"id":20,"name":"Rio Grande do Norte","Abbreviation":"RN"},'+
    '{"id":21,"name":"Rio Grande do Sul","Abbreviation":"RS"},{"id":22,"name":"Rondônia","Abbreviation":"RO"},'+
    '{"id":23,"name":"Roraima","Abbreviation":"RR"},{"id":24,"name":"Santa Catarina","Abbreviation":"SC"},'+
    '{"id":25,"name":"São Paulo","Abbreviation":"SP"},{"id":26,"name":"Sergipe","Abbreviation":"SE"},'+
    '{"id":27,"name":"Tocantins","Abbreviation":"TO"}]';

function Itens: TJSONArray;
begin
  Result := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(cDataState),0) as TJSONArray;
end;

end.
