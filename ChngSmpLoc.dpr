program ChngSmpLoc;

uses
  Forms,
  DV_chngSmpLoc in 'DV_chngSmpLoc.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
