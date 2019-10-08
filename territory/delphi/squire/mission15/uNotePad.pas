unit uNotePad;

interface

type
  TNotePad = class
  public
    procedure Execute;
  end;

implementation

uses
  Winapi.ShellApi,
  Winapi.Windows;

{ TNotepad }

procedure TNotepad.Execute;
begin
  ShellExecute(0, 'open', 'Notepad.exe', '', nil, SW_SHOWNORMAL);
end;

initialization
  TNotepad.ClassName;

end.
