program StratDBCheck;

uses
  Forms,
  DVC_main in 'DVC_main.pas' {DVCmain},
  DVC_dm in 'DVC_dm.pas' {dmDVC: TDataModule},
  DVC_reclim in 'DVC_reclim.pas' {DVCreclim},
  DVC_About in 'DVC_About.pas' {AboutBox},
  DVC_dmStrat in 'DVC_dmStrat.pas' {dmStrat: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'DVCheck';
  Application.CreateForm(TDVCmain, DVCmain);
  Application.CreateForm(TdmDVC, dmDVC);
  Application.CreateForm(TDVCreclim, DVCreclim);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.CreateForm(TdmStrat, dmStrat);
  Application.Run;
end.
