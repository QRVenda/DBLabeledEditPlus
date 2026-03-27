program Teste;

uses
  Vcl.Forms,
  FTeste in 'FTeste.pas' {s};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Ts, s);
  Application.Run;
end.
