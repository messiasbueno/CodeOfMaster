//////////////////////////////////////////////////////////////
//  Author: Messias Bueno                                   //
//    Date: 10/10/2019                                      //
// Mission: Utilizando classes nativas do Delphi            //
//          (System.JSON), crie um conteúdo JSON que        //
//          contenha campos do tipo texto, numérico,        //
//          condicional e lista. O resultado do JSON deve   //
//          ser igual ao abaixo:                            //
//    {                                                     //
//        "player": "Mystery",                              //
//        "active": true,                                   //
//        "territories": [                                  //
//            {                                             //
//                "territory": "Delphi",                    //
//                "level": "Squire",                        //
//                "experience": 17,                         //
//                "dateLastMission": "2019-08-20"           //
//            },                                            //
//            {                                             //
//                "territory": "SQL",                       //
//                "level": null,                            //
//                "experience": 0,                          //
//                "dateLastMission": null                   //
//            },                                            //
//            {                                             //
//                "territory": "Software Architecture",     //
//                "level": "Knight",                        //
//                "experience": 34,                         //
//                "dateLastMission": "2019-07-01"           //
//            }                                             //
//        ]                                                 //
//    }                                                     //
//////////////////////////////////////////////////////////////
program mission18;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  System.JSON;

function addTerritorie(Const pTerritory: TJSONValue; Const pLevel: TJSONValue;
  Const pExperience: TJSONValue; Const pDateLastMission: TJSONValue): TJSONObject;
begin
  Result := TJSONObject.Create;
  Result.AddPair('territory',pTerritory);
  Result.AddPair('level',pLevel);
  Result.AddPair('experience',pExperience);
  Result.AddPair('dateLastMission',pDateLastMission);
end;

procedure main;
var
  oJSONPlayer: TJSONObject;
  oJSONTerritories: TJSONArray;
begin
  oJSONPlayer := TJSONObject.Create;
  try
    oJSONPlayer.AddPair('player',TJSONString.Create('Mystery'));
    oJSONPlayer.AddPair('active',TJSONTrue.Create);

    oJSONTerritories := TJSONArray.Create;
    oJSONTerritories.AddElement(
      addTerritorie(
        TJSONString.Create('Delphi'),
        TJSONString.Create('Squire'),
        TJSONNumber.Create(17),
        TJSONString.Create('2019-08-20')
      )
    );
    oJSONTerritories.AddElement(
      addTerritorie(
        TJSONString.Create('SQL'),
        TJSONNull.Create,
        TJSONNumber.Create(0),
        TJSONNull.Create
      )
    );
    oJSONTerritories.AddElement(
      addTerritorie(
        TJSONString.Create('Software Architecture'),
        TJSONString.Create('Knight'),
        TJSONNumber.Create(34),
        TJSONString.Create('2019-07-01')
      )
    );
    oJSONPlayer.AddPair('territories',oJSONTerritories);

    Writeln(oJSONPlayer.ToJSON);
    Readln;
  finally
    oJSONPlayer.Free;
  end;
end;

begin
  ReportMemoryLeaksOnShutdown := True;
  main;
end.
