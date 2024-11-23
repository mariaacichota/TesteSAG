program Project1;

uses
  Vcl.Forms,
  Cliente.View in 'Cliente.View.pas' {ClienteView},
  Cliente.Model in 'Cliente.Model.pas',
  Cliente.ViewModel in 'Cliente.ViewModel.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TClienteView, ClienteView);
  Application.Run;
end.
