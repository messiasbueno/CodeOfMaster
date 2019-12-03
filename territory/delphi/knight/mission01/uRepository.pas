unit uRepository;

interface

uses
  uCloudRepository,
  uFileRepository;

type
  TRepository = class(TInterfacedObject, ICloudRepository, IFileRepository)
  private
    procedure ICloudRepository.SaveData = CloudSaveData;
    procedure IFileRepository.SaveData = FileSaveData;
  public
    procedure CloudSaveData;
    procedure FileSaveData;
  end;


implementation

{ TRepository }

procedure TRepository.CloudSaveData;
begin
  Writeln('Interface ICloudRepository.');
  Writeln('Method SaveData');
  Writeln('Local method CloudSaveData');
end;

procedure TRepository.FileSaveData;
begin
  Writeln('Interface IFileRepository.');
  Writeln('Method SaveData');
  Writeln('Local method FileSaveData');
end;

end.
