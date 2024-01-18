program ChngGSCSmp;

uses
  Forms,
  DV_chngGSC in 'DV_chngGSC.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
