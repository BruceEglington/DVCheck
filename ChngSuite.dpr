program ChngSuite;

uses
  Forms,
  DV_chngSuite in 'DV_chngSuite.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
