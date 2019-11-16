unit uMagicCreator;

interface

type
  TMagicCreator = class
  public
    class procedure OpenNotepad;
  end;


implementation

uses
  System.RTTI;

{ TMagicCreator }

class procedure TMagicCreator.OpenNotepad;
var
  rContexto: TRttiContext;
  oRttiInstanceType: TRttiInstanceType;

  oRttiMethod: TRttiMethod;
  rInstance: TValue;
begin
  rContexto := TRttiContext.Create;
  oRttiInstanceType := rContexto.FindType('uNotePad.TNotePad').AsInstance;

  oRttiMethod := oRttiInstanceType.GetMethod('Create');
  rInstance := oRttiMethod.Invoke(oRttiInstanceType.MetaclassType,[]);

  oRttiMethod := oRttiInstanceType.GetMethod('Execute');
  oRttiMethod.Invoke(rInstance, []);
end;

end.
