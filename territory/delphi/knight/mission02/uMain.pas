unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, uRegistry;

type
  TMain = class(TForm)
    dbgProgram: TDBGrid;
    dsProgram: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FRegistry: TRegistry;
  end;

var
  Main: TMain;

implementation

{$R *.dfm}

procedure TMain.FormCreate(Sender: TObject);
begin
  Self.FRegistry := TRegistry.Create;
end;

procedure TMain.FormDestroy(Sender: TObject);
begin
  Self.FRegistry.Free;
end;

procedure TMain.FormShow(Sender: TObject);
begin
  dsProgram.DataSet := Self.FRegistry.InstalledPragrams;
end;

end.
