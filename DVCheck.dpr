program DVCheck;

uses
  Forms,
  DVC_main in 'DVC_main.pas' {DVCmain},
  DVC_dm in 'DVC_dm.pas' {dmDVC: TDataModule},
  DVC_reclim in 'DVC_reclim.pas' {DVCreclim},
  DVC_dmStrat in 'DVC_dmStrat.pas' {dmStrat: TDataModule},
  DVC_About in 'DVC_About.pas' {AboutBox},
  Vcl.Themes,
  Vcl.Styles,
  DVC_constants in 'DVC_constants.pas',
  Mathproc in '..\Eglington Delphi common code items\Mathproc.pas',
  DVC_gduValues in 'DVC_gduValues.pas' {fmGDU_values},
  NumRecipes_varb in '..\Eglington Delphi common code items\NumRecipes_varb.pas',
  NumRecipes in '..\Eglington Delphi common code items\NumRecipes.pas',
  DVC_user in 'DVC_user.pas' {dmUser: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  TStyleManager.TrySetStyle('Windows10');
  Application.Title := 'DVCheck';
  Application.CreateForm(TDVCmain, DVCmain);
  Application.CreateForm(TdmDVC, dmDVC);
  Application.CreateForm(TDVCreclim, DVCreclim);
  Application.CreateForm(TdmStrat, dmStrat);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.CreateForm(TfmGDU_values, fmGDU_values);
  Application.CreateForm(TdmUser, dmUser);
  Application.Run;
end.
