program ChngRefNo;

uses
  Forms,
  DV_chngRefNo in 'DV_chngRefNo.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
