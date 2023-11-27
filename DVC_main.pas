unit DVC_main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Menus, ExtCtrls, DBCtrls, Grids, DBGrids, StdCtrls,
  DBXCommon,
  WideStrings, FMTBcd, DB, DBClient, Provider,
  IniFiles, midaslib,
  SqlExpr, VCLTee.TeeGDIPlus, VCLTee.TeEngine, VCLTee.TeeProcs, VCLTee.Chart,
  Vcl.Buttons;

type
  TDVCmain = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Exit1: TMenuItem;
    Edit1: TMenuItem;
    Check1: TMenuItem;
    Referencerecordsexist1: TMenuItem;
    Validityrecordsexist1: TMenuItem;
    Deleteunlinkedsamples1: TMenuItem;
    Countrieshaverecords1: TMenuItem;
    About1: TMenuItem;
    StatusBar1: TStatusBar;
    dbgRecordIDs: TDBGrid;
    Panel1: TPanel;
    dbnRecordIDs: TDBNavigator;
    Splitter1: TSplitter;
    Panel2: TPanel;
    Panel3: TPanel;
    dbn2: TDBNavigator;
    dbg2: TDBGrid;
    Splitter2: TSplitter;
    Panel4: TPanel;
    CountNumberofrecordsindatabase1: TMenuItem;
    Whoforrecordsexist1: TMenuItem;
    Panel5: TPanel;
    Splitter3: TSplitter;
    Panel6: TPanel;
    Panel7: TPanel;
    Splitter4: TSplitter;
    Panel8: TPanel;
    Memo1: TMemo;
    Memo2: TMemo;
    dbn3: TDBNavigator;
    dbg3: TDBGrid;
    AreaIDsareconsistent1: TMenuItem;
    Link1: TMenuItem;
    RecordstoStratDB1: TMenuItem;
    RecordstoStratDBparents1: TMenuItem;
    Countrecordspercontributor1: TMenuItem;
    StratDBunitstoDateView1: TMenuItem;
    StratDBparentstoDateView1: TMenuItem;
    About2: TMenuItem;
    Deleteunlinkedunits1: TMenuItem;
    Checkrecordsforunits1: TMenuItem;
    Countisotoperecordsperdeposit1: TMenuItem;
    CopyisotopecountstoStratDB1: TMenuItem;
    RecalculateDM: TMenuItem;
    RecalculateEpsilonNd1: TMenuItem;
    RecalculateMu1: TMenuItem;
    RecalculateEpsilonHf1: TMenuItem;
    Deleteuserswherelastused1yr1: TMenuItem;
    RecalculateUPbageminusHfTDMage1: TMenuItem;
    InsertT2DMfromEpsilonrecords1: TMenuItem;
    Laboratoryrecordsexist1: TMenuItem;
    UpdateUndefinedSampleLithologies1: TMenuItem;
    UpdateUndefinedRecordLithologies1: TMenuItem;
    Updatedepositlocationsfromsamplelocations1: TMenuItem;
    Updatesamplelocationsfromdepositlocations1: TMenuItem;
    Duplicateagerecords1: TMenuItem;
    procedure Referencerecordsexist1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure Validityrecordsexist1Click(Sender: TObject);
    procedure CountNumberofrecordsindatabase1Click(Sender: TObject);
    procedure Whoforrecordsexist1Click(Sender: TObject);
    procedure Countrieshaverecords1Click(Sender: TObject);
    procedure AreaIDsareconsistent1Click(Sender: TObject);
    procedure RecordstoStratDB1Click(Sender: TObject);
    procedure RecordstoStratDBparents1Click(Sender: TObject);
    procedure RecordstoStratDBdomains1Click(Sender: TObject);
    procedure RecordstoStratDBProvinces;
    procedure RecordstoStratDBTerranes;
    procedure Countrecordspercontributor1Click(Sender: TObject);
    procedure LinkStratDB2DV;
    procedure LinkStratDBParents2DV;
    procedure StratDBunitstoDateView1Click(Sender: TObject);
    procedure StratDBparentstoDateView1Click(Sender: TObject);
    procedure About2Click(Sender: TObject);
    procedure Deleteunlinkedunits1Click(Sender: TObject);
    procedure Checkrecordsforunits1Click(Sender: TObject);
    procedure Countisotoperecordsperdeposit1Click(Sender: TObject);
    procedure CopyisotopecountstoStratDB1Click(Sender: TObject);
    procedure RecalculateDMClick(Sender: TObject);
    procedure RecalculateEpsilonHf1Click(Sender: TObject);
    procedure Deleteuserswherelastused1yr1Click(Sender: TObject);
    procedure RecalculateEpsilonNd1Click(Sender: TObject);
    procedure RecalculateUPbageminusHfTDMage1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure InsertT2DMfromEpsilonrecords1Click(Sender: TObject);
    procedure Laboratoryrecordsexist1Click(Sender: TObject);
    procedure UpdateUndefinedLithologies1Click(Sender: TObject);
    procedure Updatedepositlocationsfromsamplelocations1Click(Sender: TObject);
    procedure Duplicateagerecords1Click(Sender: TObject);
  private
    { Private declarations }
    procedure GetIniFile;
  public
    { Public declarations }
  end;

var
  DVCmain: TDVCmain;

implementation

uses
  System.IOUtils,
  DVC_dm, DVC_reclim, DVC_About, DVC_dmStrat, DVC_constants;

{$R *.dfm}

procedure TDVCmain.RecalculateEpsilonHf1Click(Sender: TObject);
var
  iChecked, iCorrected, iFailed : integer;
  tmpRecordID : integer;
begin
  StatusBar1.Panels[3].Text := ' ';
  StatusBar1.Panels[4].Text := 'Recalculating Hf Epsilon';
  StatusBar1.Refresh;
  DVCreclim.ShowModal;
  dbnRecordIDs.DataSource := dmDVC.dsRecordIDRecalc;
  dbgRecordIDs.DataSource := dmDVC.dsRecordIDRecalc;
  dmDVC.qRecordIDRecalc.Close;
  dmDVC.qRecordIDRecalc.ParamByName('StartRecord').AsInteger := dmDVC.StartRecord;
  dmDVC.qRecordIDRecalc.ParamByName('EndRecord').AsInteger := dmDVC.EndRecord;
  dmDVC.qRecordIDRecalc.ParamByName('tIsotopeSystem').AsString := 'SmNd';
  dmDVC.qRecordIDRecalc.ParamByName('tApproachAbr').AsString := 'DM';
  dmDVC.cdsRecordIDRecalc.Close;
  dmDVC.cdsRecordIDRecalc.Open;
  if (dmDVC.cdsRecordIDRecalc.RecordCount > 0) then
  begin
    iChecked := 0;
    iCorrected := 0;
    iFailed := 0;
    StatusBar1.Panels[4].Text := 'Recalculating Hf Epsilon';
    dbn2.DataSource := dmDVC.dsQdmSmp;
    dbg2.DataSource := dmDVC.dsQdmSmp;
    repeat
      iChecked := iChecked + 1;
      if (dmDVC.cdsQdmSmp.RecordCount=0) then
      begin
        try
          //dmDVC.cdsQdmSmp.Insert;
          //dmDVC.cdsQdmSmpRECORDID.AsInteger := dmDVC.cdsRecordIDRecalcTDMRECORDID.AsInteger;
          //dmDVC.cdsQdmSmpWHOFORID.AsString := DefaultWhoForID;
          //dmDVC.cdsQdmSmp.Post;
          //dmDVC.cdsQdmSmp.ApplyUpdates(0);
          iCorrected := iCorrected + 1;
        except
          iFailed := iFailed + 1;
        end;
      end;
      if (dmDVC.cdsQdmSmp.RecordCount>0) then
      begin
        try
          //RecalculateTDM(tmpRecordID);
          //dmDVC.cdsQdmSmp.Insert;
          //dmDVC.cdsQdmSmpRECORDID.AsInteger := dmDVC.cdsRecordIDRecalcTDMRECORDID.AsInteger;
          //dmDVC.cdsQdmSmpWHOFORID.AsString := DefaultWhoForID;
          //dmDVC.cdsQdmSmp.Post;
          //dmDVC.cdsQdmSmp.ApplyUpdates(0);
          iCorrected := iCorrected + 1;
        except
          iFailed := iFailed + 1;
        end;
      end;
      StatusBar1.Panels[0].Text := IntToStr(iChecked);
      StatusBar1.Panels[1].Text := IntToStr(iCorrected);
      StatusBar1.Panels[2].Text := IntToStr(iFailed);
      StatusBar1.Refresh;
      dmDVC.cdsRecordIDRecalc.Next;
    until dmDVC.cdsRecordIDRecalc.Eof;
    dmDVC.cdsRecordIDRecalc.First;
    StatusBar1.Panels[4].Text := 'Completed recalculating Hf Epsilon';
    StatusBar1.Refresh;
  end;
end;

procedure TDVCmain.RecalculateEpsilonNd1Click(Sender: TObject);
begin
  //
end;

procedure TDVCmain.RecalculateDMClick(Sender: TObject);
var
  iChecked, iCorrected, iFailed : integer;
  tmpRecordID : integer;
begin
  StatusBar1.Panels[3].Text := ' ';
  StatusBar1.Panels[4].Text := 'Recalculating T(2DM) values';
  StatusBar1.Refresh;
  DVCreclim.ShowModal;
  dbnRecordIDs.DataSource := dmDVC.dsRecordIDRecalc;
  dbgRecordIDs.DataSource := dmDVC.dsRecordIDRecalc;
  dmDVC.qRecordIDRecalc.Close;
  dmDVC.qRecordIDRecalc.ParamByName('StartRecord').AsInteger := dmDVC.StartRecord;
  dmDVC.qRecordIDRecalc.ParamByName('EndRecord').AsInteger := dmDVC.EndRecord;
  dmDVC.qRecordIDRecalc.ParamByName('tIsotopeSystem').AsString := 'SmNd';
  dmDVC.qRecordIDRecalc.ParamByName('tApproachAbr').AsString := 'DM';
  dmDVC.qRecordIDRecalc.ParamByName('tLithClassID').AsString := 'I';
  dmDVC.cdsRecordIDRecalc.Close;
  dmDVC.cdsRecordIDRecalc.Open;
  if (dmDVC.cdsRecordIDRecalc.RecordCount > 0) then
  begin
    iChecked := 0;
    iCorrected := 0;
    iFailed := 0;
    StatusBar1.Panels[4].Text := 'Recalculating T(2DM)';
    dbn2.DataSource := dmDVC.dsQdmSmp;
    dbg2.DataSource := dmDVC.dsQdmSmp;
    repeat
      iChecked := iChecked + 1;
      if (dmDVC.cdsQdmSmp.RecordCount=0) then
      begin
        try
          //dmDVC.cdsQdmSmp.Insert;
          //dmDVC.cdsQdmSmpRECORDID.AsInteger := dmDVC.cdsRecordIDRecalcTDMRECORDID.AsInteger;
          //dmDVC.cdsQdmSmpWHOFORID.AsString := DefaultWhoForID;
          //dmDVC.cdsQdmSmp.Post;
          //dmDVC.cdsQdmSmp.ApplyUpdates(0);
          iCorrected := iCorrected + 1;
        except
          iFailed := iFailed + 1;
        end;
      end;
      if (dmDVC.cdsQdmSmp.RecordCount>0) then
      begin
        try
          dmDVC.RecalcTDM(tmpRecordID);
          //dmDVC.cdsQdmSmp.Insert;
          //dmDVC.cdsQdmSmpRECORDID.AsInteger := dmDVC.cdsRecordIDRecalcTDMRECORDID.AsInteger;
          //dmDVC.cdsQdmSmpWHOFORID.AsString := DefaultWhoForID;
          //dmDVC.cdsQdmSmp.Post;
          //dmDVC.cdsQdmSmp.ApplyUpdates(0);
          iCorrected := iCorrected + 1;
        except
          iFailed := iFailed + 1;
        end;
      end;
      StatusBar1.Panels[0].Text := IntToStr(iChecked);
      StatusBar1.Panels[1].Text := IntToStr(iCorrected);
      StatusBar1.Panels[2].Text := IntToStr(iFailed);
      StatusBar1.Refresh;
      dmDVC.cdsRecordIDRecalc.Next;
    until dmDVC.cdsRecordIDRecalc.Eof;
    dmDVC.cdsRecordIDRecalc.First;
    StatusBar1.Panels[4].Text := 'Completed recalculating T(2DM) values';
    StatusBar1.Refresh;
  end;
end;

procedure TDVCmain.RecalculateUPbageminusHfTDMage1Click(Sender: TObject);
var
  iChecked, iCorrected, iFailed : integer;
  tmpRecordID : integer;
begin
  StatusBar1.Panels[3].Text := ' ';
  StatusBar1.Panels[4].Text := 'Recalculating U-Pb age minus Hf T(DM) age';
  StatusBar1.Refresh;
  DVCreclim.ShowModal;
  dbnRecordIDs.DataSource := dmDVC.dsRecordIDRecalc;
  dbgRecordIDs.DataSource := dmDVC.dsRecordIDRecalc;
  dmDVC.qRecordIDRecalc.Close;
  dmDVC.qRecordIDRecalc.ParamByName('StartRecord').AsInteger := dmDVC.StartRecord;
  dmDVC.qRecordIDRecalc.ParamByName('EndRecord').AsInteger := dmDVC.EndRecord;
  dmDVC.qRecordIDRecalc.ParamByName('tIsotopeSystem').AsString := 'LuHf';
  dmDVC.qRecordIDRecalc.ParamByName('tApproachAbr').AsString := 'DM';
  dmDVC.cdsRecordIDRecalc.Close;
  dmDVC.cdsRecordIDRecalc.Open;
  if (dmDVC.cdsRecordIDRecalc.RecordCount > 0) then
  begin
    iChecked := 0;
    iCorrected := 0;
    iFailed := 0;
    StatusBar1.Panels[4].Text := 'Recalculating U-Pb age minus Hf T(DM) age';
    dbn2.DataSource := dmDVC.dsQdmSmp;
    dbg2.DataSource := dmDVC.dsQdmSmp;
    repeat
      iChecked := iChecked + 1;
      if (dmDVC.cdsQdmSmp.RecordCount=0) then
      begin
        try
          //dmDVC.cdsQdmSmp.Insert;
          //dmDVC.cdsQdmSmpRECORDID.AsInteger := dmDVC.cdsRecordIDRecalcTDMRECORDID.AsInteger;
          //dmDVC.cdsQdmSmpWHOFORID.AsString := DefaultWhoForID;
          //dmDVC.cdsQdmSmp.Post;
          //dmDVC.cdsQdmSmp.ApplyUpdates(0);
          iCorrected := iCorrected + 1;
        except
          iFailed := iFailed + 1;
        end;
      end;
      if (dmDVC.cdsQdmSmp.RecordCount>0) then
      begin
        try
          //RecalculateTDM(tmpRecordID);
          //dmDVC.cdsQdmSmp.Insert;
          //dmDVC.cdsQdmSmpRECORDID.AsInteger := dmDVC.cdsRecordIDRecalcTDMRECORDID.AsInteger;
          //dmDVC.cdsQdmSmpWHOFORID.AsString := DefaultWhoForID;
          //dmDVC.cdsQdmSmp.Post;
          //dmDVC.cdsQdmSmp.ApplyUpdates(0);
          iCorrected := iCorrected + 1;
        except
          iFailed := iFailed + 1;
        end;
      end;
      StatusBar1.Panels[0].Text := IntToStr(iChecked);
      StatusBar1.Panels[1].Text := IntToStr(iCorrected);
      StatusBar1.Panels[2].Text := IntToStr(iFailed);
      StatusBar1.Refresh;
      dmDVC.cdsRecordIDRecalc.Next;
    until dmDVC.cdsRecordIDRecalc.Eof;
    dmDVC.cdsRecordIDRecalc.First;
    StatusBar1.Panels[4].Text := 'Completed recalculating U-Pb age minus Hf T(DM) age';
    StatusBar1.Refresh;
  end;
end;

procedure TDVCmain.RecordstoStratDB1Click(Sender: TObject);
var
  iChecked, iCorrected, iFailed, iApplyFailed : integer;
  iCountries : integer;
  TD: TDBXTransaction;
begin

  StatusBar1.Refresh;
  DVCreclim.ShowModal;
  dmStrat.cdsCountryHasRecords.Open;
  iCountries := dmStrat.cdsCountryHasRecords.RecordCount;
  dmDVC.qUnitRecords.Close;
  dmDVC.qUnitRecords.SQL.Clear;
  dmDVC.qUnitRecords.SQL.Add('select DISTINCT SUITE.GISID, ISORGR30.RECORDID');
  dmDVC.qUnitRecords.SQL.Add('from SUITE, ISORGR30, SUITECOUNTRY');
  dmDVC.qUnitRecords.SQL.Add('where SUITECOUNTRY.UNITHASRECORDS='+''''+'Y'+'''');
  dmDVC.qUnitRecords.SQL.Add('and SUITE.GISID > 0');
  if (iCountries < 1) then
  begin
    dmDVC.qUnitRecords.SQL.Add('and SUITECOUNTRY.COUNTRYABR='+''''+'ZAF'+'''');
  end else
  begin
    dmStrat.cdsCountryHasRecords.First;
    dmDVC.qUnitRecords.SQL.Add('and (');
    dmDVC.qUnitRecords.SQL.Add('SUITECOUNTRY.COUNTRYABR='+''''+dmStrat.cdsCountryHasRecordsCOUNTRYID.AsString+'''');
    dmStrat.cdsCountryHasRecords.Next;
    if (iCountries > 1) then
    begin
      repeat
        dmDVC.qUnitRecords.SQL.Add('or SUITECOUNTRY.COUNTRYABR='+''''+dmStrat.cdsCountryHasRecordsCOUNTRYID.AsString+'''');
        dmStrat.cdsCountryHasRecords.Next;
      until dmStrat.cdsCountryHasRecords.Eof;
      dmDVC.qUnitRecords.SQL.Add(')');
    end;
  end;
  dmDVC.qUnitRecords.SQL.Add('and SUITECOUNTRY.UNITNAME=ISORGR30.UNITNAME');
  dmDVC.qUnitRecords.SQL.Add('and SUITECOUNTRY.UNITNAME=SUITE.UNITNAME');
  dmDVC.qUnitRecords.SQL.Add('and (');
  dmDVC.qUnitRecords.SQL.Add('ISORGR30.INTERPABR = '+''''+'CrysI'+'''');
  dmDVC.qUnitRecords.SQL.Add('or ISORGR30.INTERPABR = '+''''+'CrysV'+'''');
  dmDVC.qUnitRecords.SQL.Add('or ISORGR30.INTERPABR = '+''''+'Detri'+'''');
  dmDVC.qUnitRecords.SQL.Add('or ISORGR30.INTERPABR = '+''''+'Depos'+'''');
  dmDVC.qUnitRecords.SQL.Add('or ISORGR30.INTERPABR = '+''''+'Diag'+'''');
  dmDVC.qUnitRecords.SQL.Add('or ISORGR30.INTERPABR = '+''''+'Inher'+'''');
  dmDVC.qUnitRecords.SQL.Add(')');
  dmDVC.qUnitRecords.SQL.Add('and ISORGR30.RECORDID >= :StartRecord');
  dmDVC.qUnitRecords.SQL.Add('and ISORGR30.RECORDID <= :EndRecord');
  dmDVC.qUnitRecords.SQL.Add('order by ISORGR30.RECORDID');
  dmDVC.qUnitRecords.ParamByName('StartRecord').AsInteger := dmDVC.StartRecord;
  dmDVC.qUnitRecords.ParamByName('EndRecord').AsInteger := dmDVC.EndRecord;
  dmDVC.cdsUnitRecords.Close;
  dmDVC.cdsUnitRecords.Open;
  dmStrat.qUnitRecords.Close;
  dmStrat.qUnitRecords.ParamByName('StartRecord').AsInteger := dmDVC.StartRecord;
  dmStrat.qUnitRecords.ParamByName('EndRecord').AsInteger := dmDVC.EndRecord;
  dmStrat.cdsUnitRecords.Close;
  dmStrat.cdsUnitRecords.Open;
  dbnRecordIDs.DataSource := dmDVC.dsUnitRecords;
  dbgRecordIDs.DataSource := dmDVC.dsUnitRecords;
  dbn2.DataSource := dmStrat.dsUnitRecords;
  dbg2.DataSource := dmStrat.dsUnitRecords;
  if (dmDVC.cdsUnitRecords.RecordCount > 0) then
  begin
    iChecked := 0;
    iCorrected := 0;
    iFailed := 0;
    iApplyFailed := 0;
    StatusBar1.Panels[4].Text := 'Creating DateView links in StratDB';
    repeat
      iChecked := iChecked + 1;
      try
        dmStrat.cdsUnitRecords.Insert;
        dmStrat.cdsUnitRecordsUNITID.AsInteger := dmDVC.cdsUnitRecordsGISID.AsInteger;
        dmStrat.cdsUnitRecordsRECORDID.AsInteger := dmDVC.cdsUnitRecordsRECORDID.AsInteger;
        dmStrat.cdsUnitRecords.Post;
      except
        iFailed := iFailed + 1;
      end;
      {
      try
        dmStrat.cdsUnitRecords.ApplyUpdates(0);
      except
        iApplyFailed := iApplyFailed + 1;
      end;
      }
      try
        dmStrat.qNew.SQL.Clear;
        dmStrat.qNew.SQL.Add('INSERT INTO UNITRECORDS');
        dmStrat.qNew.SQL.Add('(UNITID, RECORDID)');
        dmStrat.qNew.SQL.Add('VALUES ('+IntToStr(dmDVC.cdsUnitRecordsGISID.AsInteger)+', '+IntToStr(dmDVC.cdsUnitRecordsRECORDID.AsInteger)+')');
        TD := dmStrat.sqlcStratDB.BeginTransaction(TDBXIsolations.ReadCommitted);
        try
          dmStrat.qNew.ExecSQL(false);
          dmStrat.sqlcStratDB.CommitFreeAndNil(TD); //on success, commit the changes
          iCorrected := iCorrected + 1;
        except
          dmStrat.sqlcStratDB.RollbackFreeAndNil(TD); //on failure, undo the changes
          iApplyFailed := iApplyFailed + 1;
        end;
      except
      end;
      StatusBar1.Panels[0].Text := 'Ch'+IntToStr(iChecked);
      StatusBar1.Panels[1].Text := 'Co'+IntToStr(iCorrected);
      StatusBar1.Panels[2].Text := 'F'+IntToStr(iFailed);
      StatusBar1.Panels[3].Text := 'AF'+IntToStr(iApplyFailed);
      StatusBar1.Refresh;
      dmDVC.cdsUnitRecords.Next;
    until dmDVC.cdsUnitRecords.Eof;
    dmDVC.cdsUnitRecords.First;
    try
      dmStrat.cdsUnitRecords.ApplyUpdates(-1);
    except
      iApplyFailed := iApplyFailed + 1;
    end;
    dmStrat.cdsUnitRecords.First;
    StatusBar1.Panels[4].Text := 'Completed crating StratDB links to DateView';
  end;
end;

procedure TDVCmain.RecordstoStratDBdomains1Click(Sender: TObject);
begin
  RecordstoStratDBProvinces;
  RecordstoStratDBTerranes;
end;

procedure TDVCmain.RecordstoStratDBProvinces;
var
  iChecked, iCorrected, iFailed, iApplyFailed : integer;
  TD: TDBXTransaction;
begin
  DVCreclim.ShowModal;
  dmDVC.qUnitRecords.Close;
  dmDVC.qDomainRecords.SQL.Clear;
  dmDVC.qDomainRecords.SQL.Add('select DISTINCT PROVINCELIST.DOMAINID, ISORGR30.RECORDID');
  dmDVC.qDomainRecords.SQL.Add('from PROVINCELIST, ISORGR30, PROVINCE');
  dmDVC.qDomainRecords.SQL.Add('where PROVINCE.PROVINCE=PROVINCELIST.PROVINCE');
  dmDVC.qDomainRecords.SQL.Add('and PROVINCELIST.DOMAINID > 0');
  dmDVC.qDomainRecords.SQL.Add('and PROVINCE.RECORDID=ISORGR30.RECORDID');
  dmDVC.qDomainRecords.SQL.Add('and (');
  dmDVC.qDomainRecords.SQL.Add('ISORGR30.INTERPABR = '+''''+'MetpR'+'''');
  dmDVC.qDomainRecords.SQL.Add('or ISORGR30.INTERPABR = '+''''+'MetpC'+'''');
  //dmDVC.qDomainRecords.SQL.Add('or ISORGR30.INTERPABR = '+''''+'Detri'+'''');
  //dmDVC.qDomainRecords.SQL.Add('or ISORGR30.INTERPABR = '+''''+'Depos'+'''');
  //dmDVC.qDomainRecords.SQL.Add('or ISORGR30.INTERPABR = '+''''+'Diag'+'''');
  //dmDVC.qDomainRecords.SQL.Add('or ISORGR30.INTERPABR = '+''''+'Inher'+'''');
  dmDVC.qDomainRecords.SQL.Add(')');
  dmDVC.qDomainRecords.SQL.Add('and ISORGR30.RECORDID >= :StartRecord');
  dmDVC.qDomainRecords.SQL.Add('and ISORGR30.RECORDID <= :EndRecord');
  dmDVC.qDomainRecords.SQL.Add('order by ISORGR30.RECORDID');
  dmDVC.qDomainRecords.ParamByName('StartRecord').AsInteger := dmDVC.StartRecord;
  dmDVC.qDomainRecords.ParamByName('EndRecord').AsInteger := dmDVC.EndRecord;
  dmDVC.cdsDomainRecords.Close;
  dmDVC.cdsDomainRecords.Open;
  dmStrat.qDomainRecords.Close;
  dmStrat.qDomainRecords.ParamByName('StartRecord').AsInteger := dmDVC.StartRecord;
  dmStrat.qDomainRecords.ParamByName('EndRecord').AsInteger := dmDVC.EndRecord;
  dmStrat.cdsDomainRecords.Close;
  dmStrat.cdsDomainRecords.Open;
  dbnRecordIDs.DataSource := dmDVC.dsDomainRecords;
  dbgRecordIDs.DataSource := dmDVC.dsDomainRecords;
  dbn2.DataSource := dmStrat.dsDomainRecords;
  dbg2.DataSource := dmStrat.dsDomainRecords;
  if (dmDVC.cdsDomainRecords.RecordCount > 0) then
  begin
    iChecked := 0;
    iCorrected := 0;
    iFailed := 0;
    iApplyFailed := 0;
    StatusBar1.Panels[4].Text := 'Creating DateView links in StratDB';
    repeat
      iChecked := iChecked + 1;
      try
        dmStrat.cdsDomainRecords.Insert;
        dmStrat.cdsDomainRecordsDOMAINID.AsInteger := dmDVC.cdsDomainRecordsDOMAINID.AsInteger;
        dmStrat.cdsDomainRecordsRECORDID.AsInteger := dmDVC.cdsDomainRecordsRECORDID.AsInteger;
        dmStrat.cdsDomainRecords.Post;
      except
        iFailed := iFailed + 1;
      end;
      {
      try
        dmStrat.cdsDomainRecords.ApplyUpdates(0);
      except
        iApplyFailed := iApplyFailed + 1;
      end;
      }
      try
        dmStrat.qNew.SQL.Clear;
        dmStrat.qNew.SQL.Add('INSERT INTO DOMAINRECORDS');
        dmStrat.qNew.SQL.Add('(DOMAINID, RECORDID)');
        dmStrat.qNew.SQL.Add('VALUES ('+IntToStr(dmDVC.cdsDomainRecordsDOMAINID.AsInteger)+', '+IntToStr(dmDVC.cdsDomainRecordsRECORDID.AsInteger)+')');
        TD := dmStrat.sqlcStratDB.BeginTransaction(TDBXIsolations.ReadCommitted);
        try
          dmStrat.qNew.ExecSQL(false);
          dmStrat.sqlcStratDB.CommitFreeAndNil(TD); //on success, commit the changes
          iCorrected := iCorrected + 1;
        except
          dmStrat.sqlcStratDB.RollbackFreeAndNil(TD); //on failure, undo the changes
          iApplyFailed := iApplyFailed + 1;
        end;
      except
      end;
      StatusBar1.Panels[0].Text := 'Ch'+IntToStr(iChecked);
      StatusBar1.Panels[1].Text := 'Co'+IntToStr(iCorrected);
      StatusBar1.Panels[2].Text := 'F'+IntToStr(iFailed);
      StatusBar1.Panels[3].Text := 'AF'+IntToStr(iApplyFailed);
      StatusBar1.Refresh;
      dmDVC.cdsDomainRecords.Next;
    until dmDVC.cdsDomainRecords.Eof;
    dmDVC.cdsDomainRecords.First;
    try
      dmStrat.cdsDomainRecords.ApplyUpdates(-1);
    except
      iApplyFailed := iApplyFailed + 1;
    end;
    dmStrat.cdsDomainRecords.First;
    StatusBar1.Panels[4].Text := 'Completed creating StratDB links to DateView';
  end;
end;

procedure TDVCmain.RecordstoStratDBTerranes;
var
  iChecked, iCorrected, iFailed, iApplyFailed : integer;
  TD: TDBXTransaction;
begin
  DVCreclim.ShowModal;
  dmDVC.qUnitRecords.Close;
  dmDVC.qDomainRecords.SQL.Clear;
  dmDVC.qDomainRecords.SQL.Add('select DISTINCT TERRANELIST.DOMAINID, ISORGR30.RECORDID');
  dmDVC.qDomainRecords.SQL.Add('from TERRANELIST, ISORGR30, TERRANE');
  dmDVC.qDomainRecords.SQL.Add('where TERRANE.TERRANE=TERRANELIST.TERRANE');
  dmDVC.qDomainRecords.SQL.Add('and TERRANELIST.DOMAINID > 0');
  dmDVC.qDomainRecords.SQL.Add('and TERRANE.RECORDID=ISORGR30.RECORDID');
  dmDVC.qDomainRecords.SQL.Add('and (');
  dmDVC.qDomainRecords.SQL.Add('ISORGR30.INTERPABR = '+''''+'MetpR'+'''');
  dmDVC.qDomainRecords.SQL.Add('or ISORGR30.INTERPABR = '+''''+'MetpC'+'''');
  //dmDVC.qDomainRecords.SQL.Add('or ISORGR30.INTERPABR = '+''''+'Detri'+'''');
  //dmDVC.qDomainRecords.SQL.Add('or ISORGR30.INTERPABR = '+''''+'Depos'+'''');
  //dmDVC.qDomainRecords.SQL.Add('or ISORGR30.INTERPABR = '+''''+'Diag'+'''');
  //dmDVC.qDomainRecords.SQL.Add('or ISORGR30.INTERPABR = '+''''+'Inher'+'''');
  dmDVC.qDomainRecords.SQL.Add(')');
  dmDVC.qDomainRecords.SQL.Add('and ISORGR30.RECORDID >= :StartRecord');
  dmDVC.qDomainRecords.SQL.Add('and ISORGR30.RECORDID <= :EndRecord');
  dmDVC.qDomainRecords.SQL.Add('order by ISORGR30.RECORDID');
  dmDVC.qDomainRecords.ParamByName('StartRecord').AsInteger := dmDVC.StartRecord;
  dmDVC.qDomainRecords.ParamByName('EndRecord').AsInteger := dmDVC.EndRecord;
  dmDVC.cdsDomainRecords.Close;
  dmDVC.cdsDomainRecords.Open;
  dmStrat.qDomainRecords.Close;
  dmStrat.qDomainRecords.ParamByName('StartRecord').AsInteger := dmDVC.StartRecord;
  dmStrat.qDomainRecords.ParamByName('EndRecord').AsInteger := dmDVC.EndRecord;
  dmStrat.cdsDomainRecords.Close;
  dmStrat.cdsDomainRecords.Open;
  dbnRecordIDs.DataSource := dmDVC.dsDomainRecords;
  dbgRecordIDs.DataSource := dmDVC.dsDomainRecords;
  dbn2.DataSource := dmStrat.dsDomainRecords;
  dbg2.DataSource := dmStrat.dsDomainRecords;
  if (dmDVC.cdsDomainRecords.RecordCount > 0) then
  begin
    iChecked := 0;
    iCorrected := 0;
    iFailed := 0;
    iApplyFailed := 0;
    StatusBar1.Panels[4].Text := 'Creating DateView links in StratDB';
    repeat
      iChecked := iChecked + 1;
      try
        dmStrat.cdsDomainRecords.Insert;
        dmStrat.cdsDomainRecordsDOMAINID.AsInteger := dmDVC.cdsDomainRecordsDOMAINID.AsInteger;
        dmStrat.cdsDomainRecordsRECORDID.AsInteger := dmDVC.cdsDomainRecordsRECORDID.AsInteger;
        dmStrat.cdsDomainRecords.Post;
      except
        iFailed := iFailed + 1;
      end;
      {
      try
        dmStrat.cdsDomainRecords.ApplyUpdates(0);
      except
        iApplyFailed := iApplyFailed + 1;
      end;
      }
      try
        dmStrat.qNew.SQL.Clear;
        dmStrat.qNew.SQL.Add('INSERT INTO DOMAINRECORDS');
        dmStrat.qNew.SQL.Add('(DOMAINID, RECORDID)');
        dmStrat.qNew.SQL.Add('VALUES ('+IntToStr(dmDVC.cdsDomainRecordsDOMAINID.AsInteger)+', '+IntToStr(dmDVC.cdsDomainRecordsRECORDID.AsInteger)+')');
        TD := dmStrat.sqlcStratDB.BeginTransaction(TDBXIsolations.ReadCommitted);
        try
          dmStrat.qNew.ExecSQL(false);
          dmStrat.sqlcStratDB.CommitFreeAndNil(TD); //on success, commit the changes
          iCorrected := iCorrected + 1;
        except
          dmStrat.sqlcStratDB.RollbackFreeAndNil(TD); //on failure, undo the changes
          iApplyFailed := iApplyFailed + 1;
        end;
      except
      end;
      StatusBar1.Panels[0].Text := 'Ch'+IntToStr(iChecked);
      StatusBar1.Panels[1].Text := 'Co'+IntToStr(iCorrected);
      StatusBar1.Panels[2].Text := 'F'+IntToStr(iFailed);
      StatusBar1.Panels[3].Text := 'AF'+IntToStr(iApplyFailed);
      StatusBar1.Refresh;
      dmDVC.cdsDomainRecords.Next;
    until dmDVC.cdsDomainRecords.Eof;
    dmDVC.cdsDomainRecords.First;
    try
      dmStrat.cdsDomainRecords.ApplyUpdates(-1);
    except
      iApplyFailed := iApplyFailed + 1;
    end;
    dmStrat.cdsDomainRecords.First;
    StatusBar1.Panels[4].Text := 'Completed creating StratDB links to DateView';
  end;
end;

procedure TDVCmain.RecordstoStratDBparents1Click(Sender: TObject);
var
  iChecked, iCorrected, iFailed, iApplyFailed : integer;
  iCountries : integer;
  TD: TDBXTransaction;
begin
  DVCreclim.ShowModal;
  dmStrat.cdsCountryHasRecords.Open;
  iCountries := dmStrat.cdsCountryHasRecords.RecordCount;
  dmStrat.qParentRecords.Close;

  dmStrat.qUnitRecords.Close;
  dmStrat.qUnitRecords.ParamByName('StartRecord').AsInteger := dmDVC.StartRecord;
  dmStrat.qUnitRecords.ParamByName('EndRecord').AsInteger := dmDVC.EndRecord;
  dmStrat.cdsUnitRecords.Close;
  dmStrat.cdsUnitRecords.Open;

  dmStrat.qParentRecords.Close;
  dmStrat.qParentRecords.ParamByName('StartRecord').AsInteger := dmDVC.StartRecord;
  dmStrat.qParentRecords.ParamByName('EndRecord').AsInteger := dmDVC.EndRecord;
  dmStrat.cdsParentRecords.Close;
  dmStrat.cdsParentRecords.Open;
  dbnRecordIDs.DataSource := dmStrat.dsParentRecords;
  dbgRecordIDs.DataSource := dmStrat.dsParentRecords;
  dbn2.DataSource := dmStrat.dsUnitRecords;
  dbg2.DataSource := dmStrat.dsUnitRecords;
  if (dmStrat.cdsParentRecords.RecordCount > 0) then
  begin
    iChecked := 0;
    iCorrected := 0;
    iFailed := 0;
    iApplyFailed := 0;
    StatusBar1.Panels[4].Text := 'Creating DateView links in StratDB for parents';
    repeat
      iChecked := iChecked + 1;
      try
        dmStrat.cdsUnitRecords.Insert;
        dmStrat.cdsUnitRecordsUNITID.AsInteger := dmStrat.cdsParentRecordsPARENTID.AsInteger;
        dmStrat.cdsUnitRecordsRECORDID.AsInteger := dmStrat.cdsParentRecordsRECORDID.AsInteger;
        dmStrat.cdsUnitRecords.Post;
      except
        iFailed := iFailed + 1;
      end;
      try
        dmStrat.qNew.SQL.Clear;
        dmStrat.qNew.SQL.Add('INSERT INTO UNITRECORDS');
        dmStrat.qNew.SQL.Add('(UNITID, RECORDID)');
        dmStrat.qNew.SQL.Add('VALUES ('+IntToStr(dmStrat.cdsParentRecordsPARENTID.AsInteger)+', '+IntToStr(dmStrat.cdsParentRecordsRECORDID.AsInteger)+')');
        TD := dmStrat.sqlcStratDB.BeginTransaction(TDBXIsolations.ReadCommitted);
        try
          dmStrat.qNew.ExecSQL(false);
          dmStrat.sqlcStratDB.CommitFreeAndNil(TD); //on success, commit the changes
          iCorrected := iCorrected + 1;
        except
          dmStrat.sqlcStratDB.RollbackFreeAndNil(TD); //on failure, undo the changes
          iApplyFailed := iApplyFailed + 1;
        end;
      except
      end;
      StatusBar1.Panels[0].Text := 'Ch'+IntToStr(iChecked);
      StatusBar1.Panels[1].Text := 'Co'+IntToStr(iCorrected);
      StatusBar1.Panels[2].Text := 'F'+IntToStr(iFailed);
      StatusBar1.Panels[3].Text := 'AF'+IntToStr(iApplyFailed);
      StatusBar1.Refresh;
      dmStrat.cdsParentRecords.Next;
    until dmStrat.cdsParentRecords.Eof;
    dmStrat.cdsParentRecords.First;
    try
      dmStrat.cdsUnitRecords.ApplyUpdates(-1);
    except
      iApplyFailed := iApplyFailed + 1;
    end;
    dmStrat.cdsUnitRecords.First;
    StatusBar1.Panels[4].Text := 'Completed crating StratDB links to DateView';
  end;
end;

procedure TDVCmain.Referencerecordsexist1Click(Sender: TObject);
const
  DefaultPrimarySourceID = 'A';
  DefaultPrimarySourceNum = 0;
var
  iChecked, iCorrected, iFailed : integer;
begin
  StatusBar1.Panels[3].Text := ' ';
  StatusBar1.Panels[4].Text := 'Checking links to references';
  StatusBar1.Refresh;
  DVCreclim.ShowModal;
  dbnRecordIDs.DataSource := dmDVC.dscdsRecordIDsSourceA;
  dbgRecordIDs.DataSource := dmDVC.dscdsRecordIDsSourceA;
  dbn2.DataSource := dmDVC.dsSourceA;
  dbg2.DataSource := dmDVC.dsSourceA;
  dmDVC.qRecordIDsSourceA.Close;
  dmDVC.qRecordIDsSourceA.ParamByName('StartRecord').AsInteger := dmDVC.StartRecord;
  dmDVC.qRecordIDsSourceA.ParamByName('EndRecord').AsInteger := dmDVC.EndRecord;
  dmDVC.cdsRecordIDsSourceA.Close;
  dmDVC.cdsRecordIDsSourceA.Open;
  if (dmDVC.cdsRecordIDsSourceA.RecordCount > 0) then
  begin
    iChecked := 0;
    iCorrected := 0;
    iFailed := 0;
    repeat
      iChecked := iChecked + 1;
      dmDVC.cdsSourceA.Open;
      if (dmDVC.cdsSourceA.RecordCount<1) then
      begin
        try
          dmDVC.cdsSourceA.Insert;
          dmDVC.cdsSourceARECORDID.AsInteger := dmDVC.cdsRecordIDsSourceARECORDID.AsInteger;
          dmDVC.cdsSourceASOURCETYPEID.AsString := DefaultPrimarySourceID;
          dmDVC.cdsSourceAREFNUM.AsInteger := DefaultPrimarySourceNum;
          dmDVC.cdsSourceA.Post;
          dmDVC.cdsSourceA.ApplyUpdates(0);
          iCorrected := iCorrected + 1;
        except
          iFailed := iFailed + 1;
        end;
      end;
      StatusBar1.Panels[0].Text := 'chk  - '+IntToStr(iChecked);
      StatusBar1.Panels[1].Text := 'cor  - '+IntToStr(iCorrected);
      StatusBar1.Panels[2].Text := 'fail - '+IntToStr(iFailed);
      StatusBar1.Refresh;
      dmDVC.cdsRecordIDsSourceA.Next;
    until dmDVC.cdsRecordIDsSourceA.Eof;
    dmDVC.cdsRecordIDsSourceA.First;
    StatusBar1.Panels[4].Text := 'Completed checking links to references';
  end;
end;

procedure TDVCmain.StratDBparentstoDateView1Click(Sender: TObject);
begin
  LinkStratDBParents2DV;
end;

procedure TDVCmain.StratDBunitstoDateView1Click(Sender: TObject);
begin
  LinkStratDB2DV;
end;

procedure TDVCmain.Updatedepositlocationsfromsamplelocations1Click(
  Sender: TObject);
var
  iChecked, iCorrected, iFailed : integer;
  DepositLat, DepositLon, SampleLat, SampleLon : double;
  TD: TDBXTransaction;
begin
  StatusBar1.Panels[3].Text := ' ';
  if (Sender = Updatedepositlocationsfromsamplelocations1) then
  begin
    StatusBar1.Panels[4].Text := 'Updating undefined deposit locations from sample locations';
    dmDVC.qDepositSamplesMissingLocations.SQL.Clear;
    dmDVC.qDepositSamplesMissingLocations.SQL.Add('select deposits.sdbdepositid, deposits.deplatitude,deposits.deplongitude,');
    dmDVC.qDepositSamplesMissingLocations.SQL.Add('  smploc.sampleno, smploc.latitude,smploc.longitude');
    dmDVC.qDepositSamplesMissingLocations.SQL.Add('from deposits, depositsamples, smploc');
    dmDVC.qDepositSamplesMissingLocations.SQL.Add('where deposits.sdbdepositid=depositsamples.depositid');
    dmDVC.qDepositSamplesMissingLocations.SQL.Add('and deposits.countryid=smploc.countryabr');
    dmDVC.qDepositSamplesMissingLocations.SQL.Add('and depositsamples.sampleno=smploc.sampleno');
    dmDVC.qDepositSamplesMissingLocations.SQL.Add('and deposits.deplatitude > 89.9');
    dmDVC.qDepositSamplesMissingLocations.SQL.Add('and smploc.latitude < 90.0');
    dmDVC.qDepositSamplesMissingLocations.SQL.Add('and deposits.sdbdepositid >= :StartRecord');
    dmDVC.qDepositSamplesMissingLocations.SQL.Add('and deposits.sdbdepositid <= :EndRecord');
    dmDVC.qDepositSamplesMissingLocations.SQL.Add('order by deposits.sdbdepositid, depositsamples.sampleno');
  end;
  if (Sender = Updatesamplelocationsfromdepositlocations1) then
  begin
    StatusBar1.Panels[4].Text := 'Updating undefined sample locations from deposit locations';
    dmDVC.qDepositSamplesMissingLocations.SQL.Clear;
    dmDVC.qDepositSamplesMissingLocations.SQL.Add('select deposits.sdbdepositid, deposits.deplatitude,deposits.deplongitude,');
    dmDVC.qDepositSamplesMissingLocations.SQL.Add('  smploc.sampleno, smploc.latitude,smploc.longitude');
    dmDVC.qDepositSamplesMissingLocations.SQL.Add('from deposits, depositsamples, smploc');
    dmDVC.qDepositSamplesMissingLocations.SQL.Add('where deposits.sdbdepositid=depositsamples.depositid');
    dmDVC.qDepositSamplesMissingLocations.SQL.Add('and deposits.countryid=smploc.countryabr');
    dmDVC.qDepositSamplesMissingLocations.SQL.Add('and depositsamples.sampleno=smploc.sampleno');
    dmDVC.qDepositSamplesMissingLocations.SQL.Add('and deposits.deplatitude < 90.0');
    dmDVC.qDepositSamplesMissingLocations.SQL.Add('and smploc.latitude > 89.9');
    dmDVC.qDepositSamplesMissingLocations.SQL.Add('and deposits.sdbdepositid >= :StartRecord');
    dmDVC.qDepositSamplesMissingLocations.SQL.Add('and deposits.sdbdepositid <= :EndRecord');
    dmDVC.qDepositSamplesMissingLocations.SQL.Add('order by deposits.sdbdepositid, depositsamples.sampleno');
  end;
  StatusBar1.Refresh;
  DVCreclim.ShowModal;
  iChecked := 0;
  iCorrected := 0;
  iFailed := 0;
  StatusBar1.Panels[0].Text := 'chk  - '+IntToStr(iChecked);
  StatusBar1.Panels[1].Text := 'cor  - '+IntToStr(iCorrected);
  StatusBar1.Panels[2].Text := 'fail - '+IntToStr(iFailed);
  StatusBar1.Refresh;
  if (Sender = Updatedepositlocationsfromsamplelocations1) then
  begin
    dbnRecordIDs.DataSource := dmDVC.dscdsDepositSamplesMissingLocations;
    dbgRecordIDs.DataSource := dmDVC.dscdsDepositSamplesMissingLocations;
    //dbn2.DataSource := dmDVC.dsSmpLithol;
    //dbg2.DataSource := dmDVC.dsSmpLithol;
  end;
  if (Sender = Updatesamplelocationsfromdepositlocations1) then
  begin
    dbnRecordIDs.DataSource := dmDVC.dscdsDepositSamplesMissingLocations;
    dbgRecordIDs.DataSource := dmDVC.dscdsDepositSamplesMissingLocations;
    //dbn2.DataSource := dmDVC.dsSmpLithol;
    //dbg2.DataSource := dmDVC.dsSmpLithol;
  end;
  dmDVC.qDepositSamplesMissingLocations.Close;
  dmDVC.qDepositSamplesMissingLocations.ParamByName('StartRecord').AsInteger := dmDVC.StartRecord;
  dmDVC.qDepositSamplesMissingLocations.ParamByName('EndRecord').AsInteger := dmDVC.EndRecord;
  dmDVC.cdsDepositSamplesMissingLocations.Close;
  dmDVC.cdsDepositSamplesMissingLocations.Open;
  //dmDVC.cdsRecordIDsLithol.Open;
  if (dmDVC.cdsDepositSamplesMissingLocations.RecordCount > 0) then
  begin
    repeat
      iChecked := iChecked + 1;
      //dmDVC.cdsSmpLithol.Open;
      try
        if (Sender = Updatesamplelocationsfromdepositlocations1) then
        begin
          dmDVC.qNew.SQL.Clear;
          dmDVC.qNew.SQL.Add('UPDATE SMPLOC');
          dmDVC.qNew.SQL.Add('SET SMPLOC.LONGITUDE = :ShouldBe');
          dmDVC.qNew.SQL.Add('WHERE SMPLOC.LONGITUDE = 0.0');
          dmDVC.qNew.SQL.Add('AND SMPLOC.SAMPLENO = :ThisSample');
          dmDVC.qNew.ParamByName('ShouldBe').AsFloat := dmDVC.cdsDepositSamplesMissingLocationsDEPLONGITUDE.AsFloat;
          dmDVC.qNew.ParamByName('ThisSample').AsString := dmDVC.cdsDepositSamplesMissingLocationsSAMPLENO.AsString;
          TD := dmDVC.sqlcDateView.BeginTransaction(TDBXIsolations.ReadCommitted);
          try
            dmDVC.qNew.ExecSQL(false);
            dmDVC.sqlcDateView.CommitFreeAndNil(TD); //on success, commit the changes
            iCorrected := iCorrected + 1;
          except
            dmDVC.sqlcDateView.RollbackFreeAndNil(TD); //on failure, undo the changes
            iFailed := iFailed + 1;
          end;
          dmDVC.qNew.SQL.Clear;
          dmDVC.qNew.SQL.Add('UPDATE SMPLOC');
          dmDVC.qNew.SQL.Add('SET SMPLOC.LATITUDE = :ShouldBe');
          dmDVC.qNew.SQL.Add('WHERE SMPLOC.LATITUDE > 89.99');
          dmDVC.qNew.SQL.Add('AND SMPLOC.SAMPLENO = :ThisSample');
          dmDVC.qNew.ParamByName('ShouldBe').AsFloat := dmDVC.cdsDepositSamplesMissingLocationsDEPLATITUDE.AsFloat;
          dmDVC.qNew.ParamByName('ThisSample').AsString := dmDVC.cdsDepositSamplesMissingLocationsSAMPLENO.AsString;
          TD := dmDVC.sqlcDateView.BeginTransaction(TDBXIsolations.ReadCommitted);
          try
            dmDVC.qNew.ExecSQL(false);
            dmDVC.sqlcDateView.CommitFreeAndNil(TD); //on success, commit the changes
            iCorrected := iCorrected + 1;
          except
            dmDVC.sqlcDateView.RollbackFreeAndNil(TD); //on failure, undo the changes
            iFailed := iFailed + 1;
          end;
        end;
        if (Sender = Updatedepositlocationsfromsamplelocations1) then
        begin
          dmStrat.qNew.SQL.Clear;
          dmStrat.qNew.SQL.Add('UPDATE DEPOSITS');
          dmStrat.qNew.SQL.Add('SET DEPOSITS.DEPLONGITUDE = :ShouldBe');
          dmStrat.qNew.SQL.Add('WHERE DEPOSITS.SDBDEPOSITID = :DepositID');
          dmStrat.qNew.SQL.Add('AND DEPOSITS.DEPLONGITUDE = 0.0');
          dmStrat.qNew.ParamByName('ShouldBe').AsFloat := dmDVC.cdsDepositSamplesMissingLocationsLONGITUDE.AsFloat;
          dmStrat.qNew.ParamByName('DepositID').AsInteger := dmDVC.cdsDepositSamplesMissingLocationsSDBDEPOSITID.AsInteger;
          TD := dmStrat.sqlcStratDB.BeginTransaction(TDBXIsolations.ReadCommitted);
          try
            dmStrat.qNew.ExecSQL(false);
            dmStrat.sqlcStratDB.CommitFreeAndNil(TD); //on success, commit the changes
            iCorrected := iCorrected + 1;
          except
            dmStrat.sqlcStratDB.RollbackFreeAndNil(TD); //on failure, undo the changes
            iFailed := iFailed + 1;
          end;
          dmStrat.qNew.SQL.Clear;
          dmStrat.qNew.SQL.Add('UPDATE DEPOSITS');
          dmStrat.qNew.SQL.Add('SET DEPOSITS.DEPLATITUDE = :ShouldBe');
          dmStrat.qNew.SQL.Add('WHERE DEPOSITS.SDBDEPOSITID = :DepositID');
          dmStrat.qNew.SQL.Add('AND DEPOSITS.DEPLATITUDE > 89.99');
          dmStrat.qNew.ParamByName('ShouldBe').AsFloat := dmDVC.cdsDepositSamplesMissingLocationsLATITUDE.AsFloat;
          dmStrat.qNew.ParamByName('DepositID').AsInteger := dmDVC.cdsDepositSamplesMissingLocationsSDBDEPOSITID.AsInteger;
          TD := dmStrat.sqlcStratDB.BeginTransaction(TDBXIsolations.ReadCommitted);
          try
            dmStrat.qNew.ExecSQL(false);
            dmStrat.sqlcStratDB.CommitFreeAndNil(TD); //on success, commit the changes
            iCorrected := iCorrected + 1;
          except
            dmStrat.sqlcStratDB.RollbackFreeAndNil(TD); //on failure, undo the changes
            iFailed := iFailed + 1;
          end;
        end;
      except
      end;
      if ((iChecked mod 1000) = 0) then Application.ProcessMessages;
      //dmDVC.cdsSmpLithol.Close;
      StatusBar1.Panels[0].Text := 'chk  - '+IntToStr(iChecked);
      StatusBar1.Panels[1].Text := 'cor  - '+IntToStr(iCorrected);
      StatusBar1.Panels[2].Text := 'fail - '+IntToStr(iFailed);
      StatusBar1.Refresh;
      dmDVC.cdsDepositSamplesMissingLocations.Next;
    until dmDVC.cdsDepositSamplesMissingLocations.Eof;
    Application.ProcessMessages;
    dmDVC.cdsDepositSamplesMissingLocations.First;
    //dmDVC.cdsSmpLithol.Open;
    if (Sender = Updatesamplelocationsfromdepositlocations1) then
      StatusBar1.Panels[4].Text := 'Completed updating undefined sample locations';
    if (Sender = Updatedepositlocationsfromsamplelocations1) then
      StatusBar1.Panels[4].Text := 'Completed updating undefined deposit locations';
  end;
end;

procedure TDVCmain.UpdateUndefinedLithologies1Click(Sender: TObject);
const
  DefaultLithology = 'Not defined';
var
  iChecked, iCorrected, iFailed : integer;
  RecordLithology, SampleLithology : string;
  TD: TDBXTransaction;
begin
  StatusBar1.Panels[3].Text := ' ';
  if (Sender = UpdateUndefinedSampleLithologies1) then
    StatusBar1.Panels[4].Text := 'Updating undefined sample lithologies from record lithologies';
  if (Sender = UpdateUndefinedRecordLithologies1) then
    StatusBar1.Panels[4].Text := 'Updating undefined record lithologies from sample lithologies';
  StatusBar1.Refresh;
  DVCreclim.ShowModal;
  iChecked := 0;
  iCorrected := 0;
  iFailed := 0;
  StatusBar1.Panels[0].Text := 'chk  - '+IntToStr(iChecked);
  StatusBar1.Panels[1].Text := 'cor  - '+IntToStr(iCorrected);
  StatusBar1.Panels[2].Text := 'fail - '+IntToStr(iFailed);
  StatusBar1.Refresh;
  if (Sender = UpdateUndefinedSampleLithologies1) then
  begin
    dbnRecordIDs.DataSource := dmDVC.dscdsRecordIDsLithol;
    dbgRecordIDs.DataSource := dmDVC.dscdsRecordIDsLithol;
    dbn2.DataSource := dmDVC.dsSmpLithol;
    dbg2.DataSource := dmDVC.dsSmpLithol;
  end;
  if (Sender = UpdateUndefinedRecordLithologies1) then
  begin
    dbnRecordIDs.DataSource := dmDVC.dscdsRecordIDsLithol;
    dbgRecordIDs.DataSource := dmDVC.dscdsRecordIDsLithol;
    dbn2.DataSource := dmDVC.dsSmpLithol;
    dbg2.DataSource := dmDVC.dsSmpLithol;
  end;
  dmDVC.qRecordIDsLithol.Close;
  dmDVC.qRecordIDsLithol.ParamByName('StartRecord').AsInteger := dmDVC.StartRecord;
  dmDVC.qRecordIDsLithol.ParamByName('EndRecord').AsInteger := dmDVC.EndRecord;
  dmDVC.cdsRecordIDsLithol.Close;
  dmDVC.cdsRecordIDsLithol.Open;
  if (dmDVC.cdsRecordIDsLithol.RecordCount > 0) then
  begin
    repeat
      iChecked := iChecked + 1;
      dmDVC.cdsSmpLithol.Open;
      try
        if (Sender = UpdateUndefinedSampleLithologies1) then
        begin
          dmDVC.qNew.SQL.Clear;
          dmDVC.qNew.SQL.Add('UPDATE SMPLOC');
          dmDVC.qNew.SQL.Add('SET SMPLOC.LITHOLOGY = :ShouldBe');
          dmDVC.qNew.SQL.Add('WHERE SMPLOC.LITHOLOGY = '+''''+'Not defined'+'''');
          dmDVC.qNew.SQL.Add('AND SMPLOC.SAMPLENO = :ThisSample');
          dmDVC.qNew.ParamByName('ShouldBe').AsString := dmDVC.cdsRecordIDsLitholLITHOLOGY.AsString;
          dmDVC.qNew.ParamByName('ThisSample').AsString := dmDVC.cdsRecordIDsLitholSAMPLENO.AsString;
        end;
        if (Sender = UpdateUndefinedRecordLithologies1) then
        begin
          dmDVC.qNew.SQL.Clear;
          dmDVC.qNew.SQL.Add('UPDATE SMPLOC');
          dmDVC.qNew.SQL.Add('SET SMPLOC.LITHOLOGY = :ShouldBe');
          dmDVC.qNew.SQL.Add('WHERE SMPLOC.LITHOLOGY = '+''''+'Not defined'+'''');
          dmDVC.qNew.SQL.Add('AND SMPLOC.SAMPLENO = :ThisSample');
          dmDVC.qNew.ParamByName('ShouldBe').AsString := dmDVC.cdsRecordIDsLitholLITHOLOGY.AsString;
          dmDVC.qNew.ParamByName('ThisSample').AsString := dmDVC.cdsRecordIDsLitholSAMPLENO.AsString;
        end;
        //if not dmStrat.sqlcStratDB.InTransaction then
        //begin
          TD := dmDVC.sqlcDateView.BeginTransaction(TDBXIsolations.ReadCommitted);
          try
            dmDVC.qNew.ExecSQL(false);
            dmDVC.sqlcDateView.CommitFreeAndNil(TD); //on success, commit the changes
            iCorrected := iCorrected + 1;
          except
            dmDVC.sqlcDateView.RollbackFreeAndNil(TD); //on failure, undo the changes
            iFailed := iFailed + 1;
          end;
        //end;
      except
      end;
      {
      try
        dmDVC.cdsSmpLithol.Edit;
        dmDVC.cdsSmpLitholLITHOLOGY.AsString := dmDVC.cdsRecordIDsLitholLITHOLOGY.AsString;
        dmDVC.cdsSmpLithol.Post;
        dmDVC.cdsSmpLithol.ApplyUpdates(-1);
        //ShowMessage(dmDVC.cdsSmpLitholSAMPLENO.AsString+'***'+dmDVC.cdsSmpLitholLITHOLOGY.AsString);
        iCorrected := iCorrected + 1;
      except
        iFailed := iFailed + 1;
      end;
      }
      if ((iChecked mod 1000) = 0) then Application.ProcessMessages;
      dmDVC.cdsSmpLithol.Close;
      StatusBar1.Panels[0].Text := 'chk  - '+IntToStr(iChecked);
      StatusBar1.Panels[1].Text := 'cor  - '+IntToStr(iCorrected);
      StatusBar1.Panels[2].Text := 'fail - '+IntToStr(iFailed);
      StatusBar1.Refresh;
      dmDVC.cdsRecordIDsLithol.Next;
    until dmDVC.cdsRecordIDsLithol.Eof;
    Application.ProcessMessages;
    dmDVC.cdsRecordIDsLithol.First;
    dmDVC.cdsSmpLithol.Open;
    if (Sender = UpdateUndefinedSampleLithologies1) then
      StatusBar1.Panels[4].Text := 'Completed updating undefined sample lithologies';
    if (Sender = UpdateUndefinedRecordLithologies1) then
      StatusBar1.Panels[4].Text := 'Completed updating undefined record lithologies';
  end;
end;

procedure TDVCmain.Exit1Click(Sender: TObject);
begin
  dmDVC.sqlcDateView.Connected := false;
  Close;
end;

procedure TDVCmain.FormShow(Sender: TObject);
begin
  GetIniFile;
  with dmDVC do
  begin
    try
      sqlcDateView.Connected := false;
    except
    end;
    try
      sqlcDateView.Connected := true;
    except
    end;
  end;
  with dmDVC do
  begin
    //
  end;
  with dmStrat do
  begin
    try
      sqlcStratDB.Connected := false;
    except
    end;
    try
      sqlcStratDB.Connected := true;
    except
    end;
  end;
  with dmStrat do
  begin
    //
  end;
end;

procedure TDVCmain.GetIniFile;
var
  tmpStr   : string;
  iCode    : integer;
  PublicPath : string;
  AppIni   : TIniFile;
  DebugButtons,
  DebugDelayConnections,
  URLBase,
  DBMonitor,
  DriverName,
  IniFileName,
  IniFilePath,
  CommonFilePath,
  UserControlPath,
  StratDBPath,
  DateViewPath, DBVendorLib,
  DBUserName, DBPassword,DBSpecific,DBSQLDialectStr,DBCharSet,
  DataPath   : string;
begin
  DBMonitor := 'Inactive';
  UserControlPath := 'localhost:c:/Data/Firebird/UserControl.fdb';
  StratDBPath := 'localhost:c:/Data/Firebird/StratDB.fdb';
  DateViewPath := 'localhost:c:/Data/Firebird/DateView.fdb';
  DriverName := 'DevartInterBase';
  DBUserName := 'SYSDBA';
  DBPassword := 'masterkey';
  DBSQLDialectStr := '3';
  DBCharSet := 'ASCII';
  //PublicPath := TPath.GetHomePath;
  PublicPath := TPath.GetPublicPath;   // stay with PublicPath for compatibility with other database web software
  CommonFilePath := IncludeTrailingPathDelimiter(PublicPath) + 'EggSoft/';
  IniFilePath := CommonFilePath;
  IniFilename := IniFilePath + 'DVCheck.ini';
  AppIni := TIniFile.Create(IniFilename);
  try
    UserControlPath := AppIni.ReadString('Paths','UserControl path','S:/Data/Firebird/UserControl2015v25.fdb');
    StratDBPath := AppIni.ReadString('Paths','StratDB path','S:/Data/Firebird/StratDB2015v25.fdb');
    DateViewPath := AppIni.ReadString('Paths','DateView path','S:/Data/Firebird/DateView2015v25.fdb');
    DriverName := AppIni.ReadString('Parameters','DriverName','DevartInterBase');
    DBUserName := AppIni.ReadString('Parameters','User_Name','SYSDBA');
    DBPassword := AppIni.ReadString('Parameters','Password','masterkey');
    DBSQLDialectStr := AppIni.ReadString('Parameters','SQLDialect','3');
    DBCharSet := AppIni.ReadString('Parameters','Charset','ASCII');
    DBVendorLib := AppIni.ReadString('Parameters','VendorLib','c:\exe64\fbclient.dll');
    DBMonitor := AppIni.ReadString('Monitor','DBMonitor','Inactive');
    //define connection parameters for StratDB connection
    dmStrat.sqlcStratDB.Connected := false;
    dmStrat.sqlcStratDB.Params.Clear;
    dmStrat.sqlcStratDB.Params.Append('DriverName='+DriverName);
    dmStrat.sqlcStratDB.Params.Append('Database='+StratDBPath);
    dmStrat.sqlcStratDB.Params.Append('User_Name='+DBUserName);
    dmStrat.sqlcStratDB.Params.Append('Password='+DBPassword);
    dmStrat.sqlcStratDB.Params.Append('SQLDialect='+DBSQLDialectStr);
    dmStrat.sqlcStratDB.Params.Append('Charset='+DBCharSet);
    dmStrat.sqlcStratDB.Params.Append('VendorLib='+DBVendorLib);
    dmStrat.sqlcStratDB.Params.Append('LocaleCode=0000');
    dmStrat.sqlcStratDB.Params.Append('DevartInterBase TransIsolation=ReadCommitted');
    dmStrat.sqlcStratDB.Params.Append('WaitOnLocks=True');
    dmStrat.sqlcStratDB.Params.Append('CharLength=1');
    dmStrat.sqlcStratDB.Params.Append('EnableBCD=false');
    dmStrat.sqlcStratDB.Params.Append('OptimizedNumerics=false');
    dmStrat.sqlcStratDB.Params.Append('LongStrings=True');
    dmStrat.sqlcStratDB.Params.Append('UseQuoteChar=False');
    dmStrat.sqlcStratDB.Params.Append('FetchAll=False');
    dmStrat.sqlcStratDB.Params.Append('UseUnicode=False');
    //define connection parameters for DateView connection
    dmDVC.sqlcDateView.Connected := false;
    dmDVC.sqlcDateView.Params.Clear;
    dmDVC.sqlcDateView.Params.Append('DriverName='+DriverName);
    dmDVC.sqlcDateView.Params.Append('Database='+DateViewPath);
    dmDVC.sqlcDateView.Params.Append('User_Name='+DBUserName);
    dmDVC.sqlcDateView.Params.Append('Password='+DBPassword);
    dmDVC.sqlcDateView.Params.Append('SQLDialect='+DBSQLDialectStr);
    dmDVC.sqlcDateView.Params.Append('Charset='+DBCharSet);
    dmDVC.sqlcDateView.Params.Append('VendorLib='+DBVendorLib);
    dmDVC.sqlcDateView.Params.Append('LocaleCode=0000');
    dmDVC.sqlcDateView.Params.Append('DevartInterBase TransIsolation=ReadCommitted');
    dmDVC.sqlcDateView.Params.Append('WaitOnLocks=True');
    dmDVC.sqlcDateView.Params.Append('CharLength=1');
    dmDVC.sqlcDateView.Params.Append('EnableBCD=false');
    dmDVC.sqlcDateView.Params.Append('OptimizedNumerics=false');
    dmDVC.sqlcDateView.Params.Append('LongStrings=True');
    dmDVC.sqlcDateView.Params.Append('UseQuoteChar=False');
    dmDVC.sqlcDateView.Params.Append('FetchAll=False');
    dmDVC.sqlcDateView.Params.Append('UseUnicode=False');
    if (DBMonitor = 'Active') then
    begin
      dmStrat.SQLMonitor1.Active := true;
      dmDVC.SQLMonitor1.Active := true;
    end else
    begin
      dmStrat.SQLMonitor1.Active := false;
      dmDVC.SQLMonitor1.Active := false;
    end;
  finally
    AppIni.Free;
  end;
end;

procedure TDVCmain.InsertT2DMfromEpsilonrecords1Click(Sender: TObject);
var
  iChecked, iCorrected, iFailed : integer;
  tmpRecordID : integer;
  tApproachAbr, tTechAbr, tInterpAbr, tIsoSystem,
  tCountryAbr, tContinentID, tMaterialAbr,
  tAgeUnits, tAgeRelID, tLithology, tMethodAbr : string;
  tUnitID, tPrefLevel, tIAge, tIAgePError, tIAgeMError : integer;
  tDecayConst1, tDecayConst2, tSigmaPercentDC1, tSigmaPercentDC2,
  tRage, tRAgePError, tRAgeMError : double;
begin
  StatusBar1.Panels[3].Text := ' ';
  StatusBar1.Panels[4].Text := 'New T(2DM) from Epsilon';
  StatusBar1.Refresh;
  DVCreclim.ShowModal;
  dbnRecordIDs.DataSource := dmDVC.dsRecordIDRecalc;
  dbgRecordIDs.DataSource := dmDVC.dsRecordIDRecalc;
  dmDVC.qRecordIDRecalc.Close;
  dmDVC.qRecordIDRecalc.ParamByName('StartRecord').AsInteger := dmDVC.StartRecord;
  dmDVC.qRecordIDRecalc.ParamByName('EndRecord').AsInteger := dmDVC.EndRecord;
  dmDVC.qRecordIDRecalc.ParamByName('tIsotopeSystem').AsString := 'SmNd';
  dmDVC.qRecordIDRecalc.ParamByName('tApproachAbr').AsString := 'MdlRa';
  dmDVC.cdsRecordIDRecalc.Close;
  dmDVC.cdsRecordIDRecalc.Open;
  if (dmDVC.cdsRecordIDRecalc.RecordCount > 0) then
  begin
    iChecked := 0;
    iCorrected := 0;
    iFailed := 0;
    StatusBar1.Panels[4].Text := 'New T(2DM) from Epsilon';
    tmpRecordID := dmDVC.cdsRecordIDRecalcRECORDID.AsInteger;
    dmDVC.cdsQdmSmp.Close;
    dmDVC.QdmSmp.Close;
    dbn2.DataSource := dmDVC.dsQdmSmp;
    dbg2.DataSource := dmDVC.dsQdmSmp;
    repeat
      iChecked := iChecked + 1;
      dmDVC.QdmSmp.ParamByName('RecordID').AsInteger := tmpRecordID;
      dmDVC.cdsQdmSmp.Open;
      if (dmDVC.cdsQdmSmp.RecordCount=0) then
      begin
        try
          //dmDVC.cdsQdmSmp.Insert;
          //dmDVC.cdsQdmSmpRECORDID.AsInteger := dmDVC.cdsRecordIDRecalcTDMRECORDID.AsInteger;
          //dmDVC.cdsQdmSmpWHOFORID.AsString := DefaultWhoForID;
          //dmDVC.cdsQdmSmp.Post;
          //dmDVC.cdsQdmSmp.ApplyUpdates(0);
          iCorrected := iCorrected + 1;
        except
          iFailed := iFailed + 1;
        end;
      end;
      if (dmDVC.cdsQdmSmp.RecordCount>0) then
      begin
        try
          {
  tApproachAbr, tTechAbr, tInterpAbr, tIsoSystem,
  tCountryAbr, tContinentID, tMaterialAbr,
  tAgeUnits, tAgeRelID, tLithology, tMethodAbr : string;
  tUnitID, tPrefLevel, tIAge, tIAgePError, tIAgeMError : integer;
  tDecayConst1, tDecayConst2, tSigmaPercentDC1, tSigmaPercentDC2,
  tRage, tRAgePError, tRAgeMError : double;
          }
          tApproachAbr := dmDVC.cdsQdmSmpISOSYSTEM.AsString;
          tTechAbr := dmDVC.cdsQdmSmpISOSYSTEM.AsString;
          tInterpAbr := dmDVC.cdsQdmSmpISOSYSTEM.AsString;
          tIsoSystem := dmDVC.cdsQdmSmpISOSYSTEM.AsString;
          tCountryAbr := dmDVC.cdsQdmSmpISOSYSTEM.AsString;
          tMaterialAbr := dmDVC.cdsQdmSmpISOSYSTEM.AsString;
          tAgeUnits := dmDVC.cdsQdmSmpISOSYSTEM.AsString;
          tAgeRelID := dmDVC.cdsQdmSmpISOSYSTEM.AsString;
          tLithology := dmDVC.cdsQdmSmpISOSYSTEM.AsString;
          tMethodAbr := dmDVC.cdsQdmSmpISOSYSTEM.AsString;
          //tUnitID := dmDVC.cdsQdmSmpISOSYSTEM.AsString;
          //RecalculateTDM(tmpRecordID);
          //dmDVC.cdsQdmSmp.Edit;
          //dmDVC.cdsQdmSmpRECORDID.AsInteger := dmDVC.cdsRecordIDRecalcTDMRECORDID.AsInteger;
          //dmDVC.cdsQdmSmpWHOFORID.AsString := DefaultWhoForID;
          //dmDVC.cdsQdmSmp.Post;
          //dmDVC.cdsQdmSmp.ApplyUpdates(0);
          iCorrected := iCorrected + 1;
        except
          iFailed := iFailed + 1;
        end;
      end;
      StatusBar1.Panels[0].Text := IntToStr(iChecked);
      StatusBar1.Panels[1].Text := IntToStr(iCorrected);
      StatusBar1.Panels[2].Text := IntToStr(iFailed);
      StatusBar1.Refresh;
      dmDVC.cdsRecordIDRecalc.Next;
    until dmDVC.cdsRecordIDRecalc.Eof;
    dmDVC.cdsRecordIDRecalc.First;
    StatusBar1.Panels[4].Text := 'Completed recalculating T(2DM) values';
    StatusBar1.Refresh;
  end;
end;

procedure TDVCmain.Validityrecordsexist1Click(Sender: TObject);
const
  DefaultStatusIDCapt = 'Capt';
  DefaultStatusIDNotYt = 'NotYt';
  DefaultDoneBy = 'Nobody';
var
  iChecked, iCorrected, iFailed : integer;
begin
  StatusBar1.Panels[3].Text := ' ';
  DVCreclim.ShowModal;
  iChecked := 0;
  iCorrected := 0;
  iFailed := 0;
  StatusBar1.Panels[0].Text := IntToStr(iChecked);
  StatusBar1.Panels[1].Text := IntToStr(iCorrected);
  StatusBar1.Panels[2].Text := IntToStr(iFailed);
  StatusBar1.Refresh;
  dbnRecordIDs.DataSource := dmDVC.dsRecordIDsValid;
  dbgRecordIDs.DataSource := dmDVC.dsRecordIDsValid;
  dmDVC.qRecordIDsValid.Close;
  dmDVC.qRecordIDsValid.ParamByName('StartRecord').AsInteger := dmDVC.StartRecord;
  dmDVC.qRecordIDsValid.ParamByName('EndRecord').AsInteger := dmDVC.EndRecord;
  dmDVC.cdsRecordIDsValid.Close;
  dmDVC.cdsRecordIDsValid.Open;
  if (dmDVC.cdsRecordIDsValid.RecordCount > 0) then
  begin
    StatusBar1.Panels[4].Text := 'Checking validity links for Capture';
    dbn2.DataSource := dmDVC.dsIsoValidCaptured;
    dbg2.DataSource := dmDVC.dsIsoValidCaptured;
    repeat
      iChecked := iChecked + 1;
      if (dmDVC.cdsIsoValidCaptured.RecordCount=0) then
      begin
        try
          dmDVC.cdsIsoValidCaptured.Insert;
          dmDVC.cdsIsoValidCapturedRECORDID.AsInteger := dmDVC.cdsRecordIDsValidRECORDID.AsInteger;
          dmDVC.cdsIsoValidCapturedVALIDSTATUSID.AsString := DefaultStatusIDCapt;
          dmDVC.cdsIsoValidCapturedDATEDONE.AsDateTime := dmDVC.GetUTCDateTime;
          dmDVC.cdsIsoValidCapturedDONEBY.AsString := DefaultDoneBy;
          dmDVC.cdsIsoValidCaptured.Post;
          dmDVC.cdsIsoValidCaptured.ApplyUpdates(0);
          iCorrected := iCorrected + 1;
        except
          iFailed := iFailed + 1;
        end;
      end;
      StatusBar1.Panels[0].Text := IntToStr(iChecked);
      StatusBar1.Panels[1].Text := IntToStr(iCorrected);
      StatusBar1.Panels[2].Text := IntToStr(iFailed);
      StatusBar1.Refresh;
      dmDVC.cdsRecordIDsValid.Next;
    until dmDVC.cdsRecordIDsValid.Eof;
    dmDVC.cdsRecordIDsValid.First;
    StatusBar1.Panels[4].Text := 'Completed checking validity links for Capture';
    StatusBar1.Refresh;
    StatusBar1.Panels[4].Text := 'Checking validity links for Validation';
    StatusBar1.Refresh;
    dbn2.DataSource := dmDVC.dsIsoValidValidated;
    dbg2.DataSource := dmDVC.dsIsoValidValidated;
    repeat
      iChecked := iChecked + 1;
      if (dmDVC.cdsIsoValidValidated.RecordCount=0) then
      begin
        try
          dmDVC.cdsIsoValidValidated.Insert;
          dmDVC.cdsIsoValidValidatedRECORDID.AsInteger := dmDVC.cdsRecordIDsValidRECORDID.AsInteger;
          dmDVC.cdsIsoValidValidatedVALIDSTATUSID.AsString := DefaultStatusIDnotYt;
          dmDVC.cdsIsoValidValidatedDATEDONE.AsDateTime := dmDVC.GetUTCDateTime;
          dmDVC.cdsIsoValidValidatedDONEBY.AsString := DefaultDoneBy;
          dmDVC.cdsIsoValidValidated.Post;
          dmDVC.cdsIsoValidValidated.ApplyUpdates(0);
          iCorrected := iCorrected + 1;
        except
          iFailed := iFailed + 1;
        end;
      end;
      StatusBar1.Panels[0].Text := IntToStr(iChecked);
      StatusBar1.Panels[1].Text := IntToStr(iCorrected);
      StatusBar1.Panels[2].Text := IntToStr(iFailed);
      StatusBar1.Refresh;
      dmDVC.cdsRecordIDsValid.Next;
    until dmDVC.cdsRecordIDsValid.Eof;
    dmDVC.cdsRecordIDsValid.First;
    StatusBar1.Panels[4].Text := 'Completed checking validity links for Validation';
  end;
end;

procedure TDVCmain.About2Click(Sender: TObject);
begin
  AboutBox.ShowModal;
end;

procedure TDVCmain.AreaIDsareconsistent1Click(Sender: TObject);
begin
  dbg2.DataSource := dmDVC.dsSmpLocC;
  dbn2.DataSource := dmDVC.dsSmpLocC;
  dmDVC.cdsSmpLocC.Open;
  repeat
    try
      dmDVC.cdsSmpLocC.Edit;
      dmDVC.cdsSmpLocCCOUNTRYABR.AsString := dmDVC.cdsSmpLocCC.AsString;
      dmDVC.cdsSmpLocCCONTINENTID.AsString := dmDVC.cdsSmpLocCD.AsString;
      dmDVC.cdsSmpLocC.Post;
    except
    end;
    dmDVC.cdsSmpLocC.Next;
  until (dmDVC.cdsSmpLocC.Eof);
  try
    dmDVC.cdsSmpLocC.ApplyUpdates(-1);
  except
    end;
  //dmDVC.cdsSmpLocC.Close;
end;

procedure TDVCmain.Checkrecordsforunits1Click(Sender: TObject);
var
  iChecked, iCorrected, iFailed : integer;
begin
end;

procedure TDVCmain.CopyisotopecountstoStratDB1Click(Sender: TObject);
var
  NumPbRecords, NumSrRecords,
  NumNdRecords,NumOsRecords,
  NumSRecords, NumSO4Records,
  NumORecords,
  NumTotalRecords, NumPublicRecords : integer;
  i : integer;
  tmpStr : string;
begin
  dbn2.DataSource := nil;
  dbg2.DataSource := nil;
  dmDVC.qDepIsotopeCount.Close;
  dmDVC.qDepIsotopeCount.SQL.Clear;
  dmDVC.qDepIsotopeCount.SQL.Add('SELECT * FROM DEPISOTOPECOUNT');
  dmDVC.cdsDepIsotopeCount.Close;
  dmDVC.cdsDepIsotopeCount.Open;
  dmStrat.InsertDepIsotopeCount.Close;
  dmStrat.InsertDepIsotopeCount.SQL.Clear;
  dmStrat.InsertDepIsotopeCount.SQL.Add('INSERT INTO DEPISOTOPECOUNT');
  dmStrat.InsertDepIsotopeCount.SQL.Add('(SDBDEPOSITID, COUNTPB, COUNTSR, COUNTND, COUNTOS, COUNTS, COUNTSO4, COUNTO)');
  dmStrat.InsertDepIsotopeCount.SQL.Add('VALUES (:DepositID, :CountPb, :CountSr, :CountNd, :CountOs, :CountS, :CountSO4, :CountO)');
  Memo1.Text := dmStrat.InsertDepIsotopeCount.SQL.Text;
  Memo1.Refresh;
  dbn2.DataSource := dmStrat.dsDepIsotopeCount;
  dbg2.DataSource := dmStrat.dsDepIsotopeCount;
  StatusBar1.Panels[4].Text := 'Transfering to StratDB';
  StatusBar1.Refresh;
  i := 0;
  dmDVC.cdsDepIsotopeCount.First;
  repeat
    i := i + 1;
    tmpStr := dmDVC.cdsDepIsotopeCountDEPOSITID.AsString;
    StatusBar1.Panels[0].Text := tmpStr;
    StatusBar1.Refresh;
    NumPbRecords := dmDVC.cdsDepIsotopeCountCOUNTPB.AsInteger;
    NumSrRecords := dmDVC.cdsDepIsotopeCountCOUNTSR.AsInteger;
    NumNdRecords := dmDVC.cdsDepIsotopeCountCOUNTND.AsInteger;
    NumOsRecords := dmDVC.cdsDepIsotopeCountCOUNTOS.AsInteger;
    NumSRecords := dmDVC.cdsDepIsotopeCountCOUNTS.AsInteger;
    NumSO4Records := dmDVC.cdsDepIsotopeCountCOUNTSO4.AsInteger;
    NumORecords := dmDVC.cdsDepIsotopeCountCOUNTO.AsInteger;
    //if (i < 5) then MessageDlg('Deposit is '+tmpStr+' '+IntToStr(NumPbRecords),mtWarning,[mbOK],0);
    dmStrat.InsertDepositIsotopeCount(dmDVC.cdsDepIsotopeCountDEPOSITID.AsInteger,NumPbRecords,NumSrRecords,NumNdRecords,NumOsRecords,NumSRecords,NumSO4Records,NumORecords);
    dmDVC.cdsDepIsotopeCount.Next;
    if ((i mod 100) = 0) then Application.ProcessMessages;
  until dmDVC.cdsDepIsotopeCount.Eof;
  dmDVC.cdsDepIsotopeCount.First;
  StatusBar1.Panels[0].Text := ' ';
  StatusBar1.Panels[1].Text := ' ';
  StatusBar1.Panels[2].Text := ' ';
  StatusBar1.Panels[3].Text := ' ';
  StatusBar1.Panels[4].Text := 'Completed transfer of isotope count to StratDB';
  StatusBar1.Refresh;
end;

procedure TDVCmain.Countisotoperecordsperdeposit1Click(Sender: TObject);
const
  DefaultWhoForID = 'PUBL';
var
  NumPbRecords, NumSrRecords,
  NumNdRecords, NumHfRecords,
  NumOsRecords,
  NumSRecords, NumSO4Records,
  NumORecords,
  NumTotalRecords, NumPublicRecords : integer;
  i : integer;
  tmpStr : string;
begin
  dbn2.DataSource := nil;
  dbg2.DataSource := nil;
  StatusBar1.Panels[4].Text := 'Clearing ';
  StatusBar1.Refresh;
  try
    dmDVC.DeleteDepositIsotopeCount;
  except
  end;
  StatusBar1.Panels[4].Text := '   ';
  StatusBar1.Refresh;
  dmDVC.qDepIsotopeCount.Close;
  dmDVC.qDepIsotopeCount.SQL.Clear;
  dmDVC.qDepIsotopeCount.SQL.Add('SELECT * FROM DEPISOTOPECOUNT');
  dmDVC.cdsDepIsotopeCount.Open;
  dmDVC.qRecordIDs.Close;
  dmDVC.qRecordIDs.SQL.Clear;
  dmDVC.qRecordIDs.SQL.Add('SELECT DEPOSITSAMPLES.DEPOSITID,COUNT(SMPDATA.DATAVALUE)');
  dmDVC.qRecordIDs.SQL.Add('FROM DEPOSITSAMPLES,SMPDATA,DEPOSITS');
  dmDVC.qRecordIDs.SQL.Add('WHERE DEPOSITSAMPLES.DEPOSITID = :DepositID');
  dmDVC.qRecordIDs.SQL.Add('AND DEPOSITSAMPLES.SAMPLENO=SMPDATA.SAMPLENO');
  dmDVC.qRecordIDs.SQL.Add('AND DEPOSITSAMPLES.FRAC=SMPDATA.FRAC');
  dmDVC.qRecordIDs.SQL.Add('AND SMPDATA.VARIABLEID = :VariableID');
  dmDVC.qRecordIDs.SQL.Add('AND DEPOSITSAMPLES.DEPOSITID = DEPOSITS.SDBDEPOSITID');
  dmDVC.qRecordIDs.SQL.Add('AND DEPOSITS.DEPOSITCLANID < 90000');
  dmDVC.qRecordIDs.SQL.Add('GROUP BY DEPOSITSAMPLES.DEPOSITID');
  Memo1.Text := dmDVC.qRecordIDs.SQL.Text;
  Memo1.Refresh;
  dmDVC.cdsRecordIDs.Close;
  dmDVC.qDeposits.SQL.Clear;
  dmDVC.qDeposits.SQL.Add('SELECT DISTINCT DEPOSITS.SDBDEPOSITID');
  dmDVC.qDeposits.SQL.Add('FROM DEPOSITS, DEPOSITSAMPLES');
  dmDVC.qDeposits.SQL.Add('WHERE DEPOSITS.SDBDEPOSITID=DEPOSITSAMPLES.DEPOSITID');
  //next 1 line only for testing so as to reduce number of deposits processed
  //dmDVC.qDeposits.SQL.Add('AND DEPOSITS.SDBDEPOSITID > 154000000');
  dmDVC.qDeposits.SQL.Add('ORDER BY DEPOSITS.SDBDEPOSITID');
  //next 2 lines only for testing so as to reduce number of deposits processed
  //dmDVC.qDeposits.SQL.Add('AND DEPOSITS.DATABASEID=7');
  //dmDVC.qDeposits.SQL.Add('AND DEPOSITS.COUNTRYID='+''''+'AUS'+'''');
  dmDVC.cdsDeposits.Open;
  dmDVC.qRecordIDs.ParamByName('DepositID').AsInteger := dmDVC.cdsDepositsSDBDepositID.AsInteger;
  dmDVC.qRecordIDs.ParamByName('VariableID').AsString := '206Pb204Pb';
  dmDVC.cdsRecordIDs.Open;
  dmDVC.InsertDepIsotopeCount.Close;
  dmDVC.InsertDepIsotopeCount.SQL.Clear;
  dmDVC.InsertDepIsotopeCount.SQL.Add('INSERT INTO DEPISOTOPECOUNT');
  dmDVC.InsertDepIsotopeCount.SQL.Add('(DEPOSITID, COUNTPB, COUNTSR, COUNTND, COUNTHF, COUNTOS, COUNTS, COUNTSO4, COUNTO)');
  dmDVC.InsertDepIsotopeCount.SQL.Add('VALUES (:DepositID, :CountPb, :CountSr, :CountNd, :CountHf, :CountOs, :CountS, :CountSO4, :CountO)');
  i := 0;
  repeat
    Application.ProcessMessages;
    NumPbRecords := 0;
    NumSrRecords := 0;
    NumNdRecords := 0;
    NumHfRecords := 0;
    NumOsRecords := 0;
    NumSRecords := 0;
    NumSO4Records := 0;
    NumORecords := 0;
    tmpStr := dmDVC.cdsDepositsSDBDepositID.AsString;
    StatusBar1.Panels[0].Text := tmpStr;
    dmDVC.qRecordIDs.Close;
    dmDVC.qRecordIDs.ParamByName('DepositID').AsInteger := dmDVC.cdsDepositsSDBDepositID.AsInteger;
    dmDVC.qRecordIDs.ParamByName('VariableID').AsString := '206Pb204Pb';
    dmDVC.cdsRecordIDs.Close;
    StatusBar1.Panels[1].Text := 'Pb';
    StatusBar1.Refresh;
    dmDVC.cdsRecordIDs.Open;
    NumPbRecords := dmDVC.cdsRecordIDsCOUNT.AsInteger;
    StatusBar1.Panels[2].Text := IntToStr(NumPbRecords);
    StatusBar1.Refresh;
    dmDVC.qRecordIDs.ParamByName('VariableID').AsString := '87Sr86Sr';
    dmDVC.cdsRecordIDs.Close;
    StatusBar1.Panels[1].Text := 'Sr';
    StatusBar1.Refresh;
    dmDVC.cdsRecordIDs.Open;
    NumSrRecords := dmDVC.cdsRecordIDsCOUNT.AsInteger;
    StatusBar1.Panels[2].Text := IntToStr(NumSrRecords);
    StatusBar1.Refresh;
    //dmDVC.qRecordIDs.ParamByName('VariableID').AsString := '143Nd144Nd';
    //NumNdRecords := dmDVC.cdsRecordIDsCOUNT.AsInteger;
    //dmDVC.qRecordIDs.ParamByName('VariableID').AsString := '187Os188Os';
    //NumOsRecords := dmDVC.cdsRecordIDsCOUNT.AsInteger;
    dmDVC.qRecordIDs.ParamByName('VariableID').AsString := '143Nd144Nd';
    dmDVC.cdsRecordIDs.Close;
    StatusBar1.Panels[1].Text := 'Nd';
    StatusBar1.Refresh;
    dmDVC.cdsRecordIDs.Open;
    NumNdRecords := dmDVC.cdsRecordIDsCOUNT.AsInteger;
    StatusBar1.Panels[2].Text := IntToStr(NumNdRecords);
    StatusBar1.Refresh;
    dmDVC.qRecordIDs.ParamByName('VariableID').AsString := '176Hf177Hf';
    dmDVC.cdsRecordIDs.Close;
    StatusBar1.Panels[1].Text := 'Hf';
    StatusBar1.Refresh;
    dmDVC.cdsRecordIDs.Open;
    NumHfRecords := dmDVC.cdsRecordIDsCOUNT.AsInteger;
    StatusBar1.Panels[2].Text := IntToStr(NumHfRecords);
    StatusBar1.Refresh;
    dmDVC.qRecordIDs.ParamByName('VariableID').AsString := '187Os188Os';
    dmDVC.cdsRecordIDs.Close;
    StatusBar1.Panels[1].Text := 'Os';
    StatusBar1.Refresh;
    dmDVC.cdsRecordIDs.Open;
    NumOsRecords := dmDVC.cdsRecordIDsCOUNT.AsInteger;
    StatusBar1.Panels[2].Text := IntToStr(NumOsRecords);
    StatusBar1.Refresh;
    dmDVC.qRecordIDs.ParamByName('VariableID').AsString := '34Ssulphide';
    dmDVC.cdsRecordIDs.Close;
    StatusBar1.Panels[1].Text := 'S';
    StatusBar1.Refresh;
    dmDVC.cdsRecordIDs.Open;
    NumSRecords := dmDVC.cdsRecordIDsCOUNT.AsInteger;
    StatusBar1.Panels[2].Text := IntToStr(NumSRecords);
    StatusBar1.Refresh;
    dmDVC.qRecordIDs.ParamByName('VariableID').AsString := '34Ssulphate';
    dmDVC.cdsRecordIDs.Close;
    StatusBar1.Panels[1].Text := 'SO4';
    StatusBar1.Refresh;
    dmDVC.cdsRecordIDs.Open;
    NumSO4Records := dmDVC.cdsRecordIDsCOUNT.AsInteger;
    StatusBar1.Panels[2].Text := IntToStr(NumSO4Records);
    StatusBar1.Refresh;
    dmDVC.qRecordIDs.ParamByName('VariableID').AsString := 'Delta18O';
    dmDVC.cdsRecordIDs.Close;
    StatusBar1.Panels[1].Text := 'O';
    StatusBar1.Refresh;
    dmDVC.cdsRecordIDs.Open;
    NumORecords := dmDVC.cdsRecordIDsCOUNT.AsInteger;
    StatusBar1.Panels[2].Text := IntToStr(NumORecords);
    StatusBar1.Refresh;
    StatusBar1.Refresh;
    if ((NumPbRecords>0) or (NumSrRecords>0) or (NumNdRecords>0) or (NumOsRecords>0)
        or (NumSRecords>0) or (NumSO4Records>0) or (NumORecords>0)) then
    begin
      //ShowMessage(IntToStr(dmDVC.cdsDepositsSDBDEPOSITID.AsInteger)+' '+IntToStr(NumPbRecords)+' '+IntToStr(NumSRecords));
      dmDVC.InsertDepositIsotopeCount(dmDVC.cdsDepositsSDBDEPOSITID.AsInteger,NumPbRecords,NumSrRecords,NumNdRecords,NumHfRecords,NumOsRecords,NumSRecords,NumSO4Records,NumORecords);
      {
      dmDVC.cdsDepIsotopeCount.Append;
      dmDVC.cdsDepIsotopeCountDEPOSITID.AsInteger := dmDVC.cdsDepositsSDBDEPOSITID.AsInteger;
      dmDVC.cdsDepIsotopeCountCountPb.AsInteger := NumPbRecords;
      dmDVC.cdsDepIsotopeCountCountSr.AsInteger := NumSrRecords;
      dmDVC.cdsDepIsotopeCountCountNd.AsInteger := NumNdRecords;
      dmDVC.cdsDepIsotopeCountCountOs.AsInteger := NumOsRecords;
      dmDVC.cdsDepIsotopeCountCOUNTS.AsInteger := NumSRecords;
      dmDVC.cdsDepIsotopeCountCOUNTSO4.AsInteger := NumSO4Records;
      dmDVC.cdsDepIsotopeCountCOUNTO.AsInteger := NumORecords;
      dmDVC.cdsDepIsotopeCount.Post;
      try
        dmDVC.cdsDepIsotopeCount.ApplyUpdates(0);
      except
      end;
      }
    end;
    i := i + 1;
    if ((i mod 100) = 0) then Application.ProcessMessages;
    dmDVC.cdsDeposits.Next;
  until dmDVC.cdsDeposits.EOF;
  StatusBar1.Panels[4].Text := 'Completed counting isotope records in database';
  StatusBar1.Refresh;
  dbn2.DataSource := dmDVC.dsDepIsotopeCount;
  dbg2.DataSource := dmDVC.dsDepIsotopeCount;
  StatusBar1.Panels[4].Text := 'Transfering to StratDB';
  StatusBar1.Refresh;
  try
    dmStrat.DeleteDepositIsotopeCount;
  except
  end;
  dmDVC.qDepIsotopeCount.Close;
  dmDVC.qDepIsotopeCount.SQL.Clear;
  dmDVC.qDepIsotopeCount.SQL.Add('SELECT * FROM DEPISOTOPECOUNT');
  //next 1 line only for testing so as to reduce number of deposits processed
  //dmDVC.qDepIsotopeCount.SQL.Add('WHERE DEPISOTOPECOUNT.DEPOSITID > 154000000');
  dmDVC.qDepIsotopeCount.SQL.Add('ORDER BY DEPISOTOPECOUNT.DEPOSITID');
  dmDVC.cdsDepIsotopeCount.Close;
  dmDVC.cdsDepIsotopeCount.Open;
  dmStrat.InsertDepIsotopeCount.Close;
  dmStrat.InsertDepIsotopeCount.SQL.Clear;
  dmStrat.InsertDepIsotopeCount.SQL.Add('INSERT INTO DEPISOTOPECOUNT');
  dmStrat.InsertDepIsotopeCount.SQL.Add('(SDBDEPOSITID, COUNTPB, COUNTSR, COUNTND, COUNTOS, COUNTS, COUNTSO4, COUNTO)');
  dmStrat.InsertDepIsotopeCount.SQL.Add('VALUES (:DepositID, :CountPb, :CountSr, :CountNd, :CountOs, :CountS, :CountSO4, :CountO)');
  Memo1.Text := dmStrat.InsertDepIsotopeCount.SQL.Text;
  Memo1.Refresh;
  i := 0;
  repeat
    Application.ProcessMessages;
    tmpStr := IntToStr(dmDVC.cdsDepIsotopeCountDEPOSITID.AsInteger);
    StatusBar1.Panels[0].Text := tmpStr;
    StatusBar1.Refresh;
    NumPbRecords := dmDVC.cdsDepIsotopeCountCOUNTPB.AsInteger;
    NumSrRecords := dmDVC.cdsDepIsotopeCountCOUNTSR.AsInteger;
    NumNdRecords := dmDVC.cdsDepIsotopeCountCOUNTND.AsInteger;
    NumHfRecords := dmDVC.cdsDepIsotopeCountCOUNTHF.AsInteger;
    NumOsRecords := dmDVC.cdsDepIsotopeCountCOUNTOS.AsInteger;
    NumSRecords := dmDVC.cdsDepIsotopeCountCOUNTS.AsInteger;
    NumSO4Records := dmDVC.cdsDepIsotopeCountCOUNTSO4.AsInteger;
    NumORecords := dmDVC.cdsDepIsotopeCountCOUNTO.AsInteger;
    dmStrat.InsertDepositIsotopeCount(dmDVC.cdsDepIsotopeCountDEPOSITID.AsInteger,NumPbRecords,NumSrRecords,NumNdRecords,NumOsRecords,NumSRecords,NumSO4Records,NumORecords);
    i := i + 1;
    if ((i mod 100) = 0) then Application.ProcessMessages;
    dmDVC.cdsDepIsotopeCount.Next;
  until dmDVC.cdsDepIsotopeCount.Eof;
  dmDVC.cdsDepIsotopeCount.First;
  StatusBar1.Panels[0].Text := ' ';
  StatusBar1.Panels[1].Text := ' ';
  StatusBar1.Panels[2].Text := ' ';
  StatusBar1.Panels[3].Text := ' ';
  StatusBar1.Panels[4].Text := 'Completed transfer of isotope count to StratDB';
  StatusBar1.Refresh;
end;

procedure TDVCmain.CountNumberofrecordsindatabase1Click(Sender: TObject);
const
  DefaultWhoForID = 'PUBL';
var
  NumTotalRecords, NumPublicRecords : integer;
begin
  StatusBar1.Panels[3].Text := ' ';
  dmDVC.qRecordIDs.Close;
  dmDVC.qRecordIDs.SQL.Clear;
  dmDVC.qRecordIDs.SQL.Add('select Count(ISORGR30.RECORDID) from ISORGR30');
  Memo1.Text := dmDVC.qRecordIDs.SQL.Text;
  Memo1.Refresh;
  dmDVC.cdsRecordIDs.Close;
  dmDVC.cdsRecordIDs.Open;
  NumTotalRecords := dmDVC.cdsRecordIDsCOUNT.AsInteger;
  dmDVC.qRecordIDs.SQL.Clear;
  dmDVC.qRecordIDs.Close;
  dmDVC.qRecordIDs.SQL.Add('select Count(ISORGR30.RECORDID) from ISORGR30, ISOFOR');
  dmDVC.qRecordIDs.SQL.Add('where ISORGR30.RECORDID = ISOFOR.RECORDID');
  dmDVC.qRecordIDs.SQL.Add('and ISOFOR.WHOFORID='+''''+DefaultWhoForID+'''');
  Memo1.Text := dmDVC.qRecordIDs.SQL.Text;
  Memo1.Refresh;
  dmDVC.cdsRecordIDs.Close;
  dmDVC.cdsRecordIDs.Open;
  NumPublicRecords := dmDVC.cdsRecordIDsCOUNT.AsInteger;
  try
    dmDVC.cdsNumRecords.Open;
    dmDVC.cdsNumRecords.Insert;
    dmDVC.cdsNumRecordsDATECOUNTED.AsDateTime := dmDVC.GetUTCDateTime;
    dmDVC.cdsNumRecordsNUMTOTALRECORDS.AsInteger := NumTotalRecords;
    dmDVC.cdsNumRecordsNUMPUBLRECORDS.AsInteger := NumPublicRecords;
    dmDVC.cdsNumRecords.Post;
    dmDVC.cdsNumRecords.ApplyUpdates(0);
    StatusBar1.Panels[0].Text := IntToStr(NumTotalRecords);
    StatusBar1.Panels[1].Text := IntToStr(NumPublicRecords);
    StatusBar1.Panels[4].Text := 'Completed counting records in database';
    StatusBar1.Refresh;
  except
    MessageDlg('Not able to update table NUMRECORDS',mtWarning,[mbOK],0);
  end;
end;

procedure TDVCmain.Whoforrecordsexist1Click(Sender: TObject);
const
  DefaultWhoForID = 'PUBL';
var
  iChecked, iCorrected, iFailed : integer;
  tRecordID : integer;
begin
  StatusBar1.Panels[3].Text := ' ';
  StatusBar1.Panels[4].Text := 'Checking record links for ISOFOR';
  StatusBar1.Refresh;
  DVCreclim.ShowModal;
  dbnRecordIDs.DataSource := dmDVC.dsRecordIDsIsoFor;
  dbgRecordIDs.DataSource := dmDVC.dsRecordIDsIsoFor;
  dmDVC.qRecordIDsIsoFor.Close;
  dmDVC.qRecordIDsIsoFor.ParamByName('StartRecord').AsInteger := dmDVC.StartRecord;
  dmDVC.qRecordIDsIsoFor.ParamByName('EndRecord').AsInteger := dmDVC.EndRecord;
  dmDVC.cdsRecordIDsIsoFor.Close;
  dmDVC.cdsRecordIDsIsoFor.Open;
  if (dmDVC.cdsRecordIDsIsoFor.RecordCount > 0) then
  begin
    iChecked := 0;
    iCorrected := 0;
    iFailed := 0;
    StatusBar1.Panels[4].Text := 'Checking record links for ISOFOR';
    dbn2.DataSource := dmDVC.dsIsoFor;
    dbg2.DataSource := dmDVC.dsIsoFor;
    repeat
      iChecked := iChecked + 1;
      if (dmDVC.cdsIsoFor.RecordCount=0) then
      begin
        try
          tRecordID := dmDVC.cdsRecordIDsIsoForRECORDID.AsInteger;
          dmDVC.InsertIsoForRecord(tRecordID,DefaultWhoForID);
          //dmDVC.cdsIsoFor.Insert;
          //dmDVC.cdsIsoForRECORDID.AsInteger := dmDVC.cdsRecordIDsIsoForRECORDID.AsInteger;
          //dmDVC.cdsIsoForWHOFORID.AsString := DefaultWhoForID;
          //dmDVC.cdsIsoFor.Post;
          //dmDVC.cdsIsoFor.ApplyUpdates(0);
          iCorrected := iCorrected + 1;
        except
          iFailed := iFailed + 1;
        end;
      end;
      StatusBar1.Panels[0].Text := IntToStr(iChecked);
      StatusBar1.Panels[1].Text := IntToStr(iCorrected);
      StatusBar1.Panels[2].Text := IntToStr(iFailed);
      StatusBar1.Refresh;
      dmDVC.cdsRecordIDsIsoFor.Next;
    until dmDVC.cdsRecordIDsIsoFor.Eof;
    dmDVC.cdsRecordIDsIsoFor.First;
    StatusBar1.Panels[4].Text := 'Completed checking record links for ISOFOR';
    StatusBar1.Refresh;
  end;
end;

procedure TDVCmain.Countrecordspercontributor1Click(Sender: TObject);
var
  NumContributions : integer;
  tmpUserID : string;
begin
  dmDVC.cdsNumContributions.Open;
  dmDVC.cdsUsers.Open;
  repeat
    tmpUserID := dmDVC.cdsNumContributionsDONEBY.AsString;
    NumContributions := dmDVC.cdsNumContributionsCOUNT.AsInteger;
    dmDVC.cdsUsers.Locate('USERID',tmpUserID,[]);
    dmDVC.cdsUsers.Edit;
    dmDVC.cdsUsersNUMCONTRIBUTED.AsInteger := NumContributions;
    dmDVC.cdsUsers.Post;
    dmDVC.cdsNumContributions.Next;
  until dmDVC.cdsNumContributions.Eof;
    try
      dmDVC.cdsUsers.ApplyUpdates(-1);
    except
    end;
  dmDVC.cdsNumContributions.Close;
  dmDVC.cdsUsers.Close;
  MessageDlg('Done',mtInformation,[mbOK],0);
end;

procedure TDVCmain.Countrieshaverecords1Click(Sender: TObject);
var
  iChecked, iCorrected, iFailed : integer;
begin
  StatusBar1.Panels[3].Text := ' ';
  StatusBar1.Refresh;
  dmDVC.qCountryRecords.Close;
  dmDVC.cdsCountryRecords.Close;
  dmDVC.cdsCountryRecords.Open;
  if (dmDVC.cdsCountryRecords.RecordCount > 0) then
  begin
    iChecked := 0;
    iCorrected := 0;
    iFailed := 0;
    StatusBar1.Panels[4].Text := 'Checking which countries have records';
    dbn2.DataSource := dmDVC.dsCountryRecords;
    dbg2.DataSource := dmDVC.dsCountryRecords;
    repeat
      dmDVC.cdsCountryCount.Close;
      dmDVC.cdsCountryCount.Open;
      iChecked := iChecked + 1;
      if (dmDVC.cdsCountryCountCOUNT.AsInteger>0) then
      begin
        if (dmDVC.cdsCountryRecordsCOUNTRYHASRECORDS.AsString='Y') then
        begin
          try
            dmDVC.cdsCountryRecords.Edit;
            dmDVC.cdsCountryRecordsCOUNTRYHASRECORDS.AsString := 'Y';
            dmDVC.cdsCountryRecordsNUMRECORDS.AsInteger := dmDVC.cdsCountryCountCOUNT.AsInteger;
            dmDVC.cdsCountryRecords.Post;
            dmDVC.cdsCountryRecords.ApplyUpdates(0);
            iCorrected := iCorrected + 1;
          except
            iFailed := iFailed + 1;
          end;
        end;
        if (dmDVC.cdsCountryRecordsCOUNTRYHASRECORDS.AsString='N') then
        begin
          try
            dmDVC.cdsCountryRecords.Edit;
            dmDVC.cdsCountryRecordsCOUNTRYHASRECORDS.AsString := 'Y';
            dmDVC.cdsCountryRecordsNUMRECORDS.AsInteger := dmDVC.cdsCountryCountCOUNT.AsInteger;
            dmDVC.cdsCountryRecords.Post;
            dmDVC.cdsCountryRecords.ApplyUpdates(0);
            iCorrected := iCorrected + 1;
          except
            iFailed := iFailed + 1;
          end;
        end;
      end else
      begin
        try
          dmDVC.cdsCountryRecords.Edit;
          dmDVC.cdsCountryRecordsCOUNTRYHASRECORDS.AsString := 'N';
          dmDVC.cdsCountryRecordsNUMRECORDS.AsInteger := 0;
          dmDVC.cdsCountryRecords.Post;
          dmDVC.cdsCountryRecords.ApplyUpdates(0);
          iCorrected := iCorrected + 1;
        except
          iFailed := iFailed + 1;
        end;
      end;
      StatusBar1.Panels[0].Text := IntToStr(iChecked);
      StatusBar1.Panels[1].Text := IntToStr(iCorrected);
      StatusBar1.Panels[2].Text := IntToStr(iFailed);
      StatusBar1.Refresh;
      dmDVC.cdsCountryRecords.Next;
    until dmDVC.cdsCountryRecords.Eof;
    dmDVC.cdsCountryRecords.First;
    StatusBar1.Panels[4].Text := 'Completed checking which countries have records';
    StatusBar1.Refresh;
  end;
end;

procedure TDVCmain.Deleteunlinkedunits1Click(Sender: TObject);
var
  iChecked, iCorrected, iFailed : integer;
begin
  StatusBar1.Panels[3].Text := ' ';
  StatusBar1.Refresh;
  dbnRecordIDs.DataSource := dmDVC.dsUnitHasRecords;
  dbgRecordIDs.DataSource := dmDVC.dsUnitHasRecords;
  dmDVC.qUnitHasRecords.Close;
  dmDVC.cdsUnitHasRecords.Close;
  dmDVC.cdsUnitHasRecords.Open;
  dmDVC.cdsUnitRecordsYN.Close;
  dmDVC.cdsUnitRecordsYN.Open;
  dmDVC.cdsUnitCount.Close;
  dmDVC.cdsUnitCount.Open;
  iChecked := 0;
  iCorrected := 0;
  iFailed := 0;
  StatusBar1.Panels[4].Text := 'Checking records for units';
  dbn2.DataSource := dmDVC.dsUnitRecordsYN;
  dbg2.DataSource := dmDVC.dsUnitRecordsYN;
  dbn3.DataSource := dmDVC.dsUnitCount;
  dbg3.DataSource := dmDVC.dsUnitCount;
  repeat
    dmDVC.cdsUnitRecordsYN.Close;
    dmDVC.cdsUnitRecordsYN.Open;
    dmDVC.cdsUnitCount.Close;
    dmDVC.cdsUnitCount.Open;
    if (dmDVC.cdsUnitCount.RecordCount > 0) then
    begin
      repeat
        iChecked := iChecked + 1;
        if (dmDVC.cdsUnitCount.RecordCount<1) then
        begin
          try
            dmDVC.cdsUnitRecordsYN.Edit;
            dmDVC.cdsUnitRecordsYNUNITHASRECORDS.AsString := 'N';
            dmDVC.cdsUnitRecordsYN.Post;
            dmDVC.cdsUnitRecordsYN.ApplyUpdates(0);
            iCorrected := iCorrected + 1;
            if (iCorrected < 10) then ShowMessage('Unit has no age records - '+dmDVC.cdsUnitRecordsYNUNITNAME.AsString);
          except
            iFailed := iFailed + 1;
          end;
        end;
        StatusBar1.Panels[0].Text := IntToStr(iChecked);
        StatusBar1.Panels[1].Text := IntToStr(iCorrected);
        StatusBar1.Panels[2].Text := IntToStr(iFailed);
        StatusBar1.Refresh;
        dmDVC.cdsUnitRecordsYN.Next;
      until dmDVC.cdsUnitRecordsYN.Eof;
      dmDVC.cdsUnitRecordsYN.First;
      StatusBar1.Panels[4].Text := 'Completed checking unit record counts';
      StatusBar1.Refresh;
    end;
    dmDVC.cdsUnitHasRecords.Next;
  until dmDVC.cdsUnitHasRecords.Eof;
end;

procedure TDVCmain.Deleteuserswherelastused1yr1Click(Sender: TObject);
begin
  //First check UserControl database for all users who last used any database more than 1 year ago
  //if YES, set CanDeleteUser to TRUE
  //Now check whether this user is registered in each database and has associated records in the database
  //For DateView, need to check Users
  //                            Owner in ForList
  //                            USERID in GroupingList
  //                            DoneBy in IsoValid
  //                            UserID in UserCountries
  //                            UserID in UserDeposits
  //                            UserID in UserDepSampleValues
  //                            UserID in UserDomains
  //                            UserID in UserInputSpecifiers
  //                            USERID in UserOptDates
  //                            USERID in UserOptGraph
  //                            USERID in UserOptGrouping
  //                            USERID in UserOptInitial
  //                            USERID in UserOptInterp
  //                            USERID in UserOpts
  //                            UserID in UserPlates
  //                            UserID in UsersImportSpec
  //                            UserID in SmpDataSelect1
  //                            UserID in SmpDataSelect2
  //                            UserID in SmpDataSelect3
  //                            UserID in UsersPDF
  //                            UserID in UsersWhoFor
  //                            USERID in UserSysMatch2
  //                            UserID in UserVar




  //If YES, then set CanDeleteUser to FALSE
  //If registered but no associated records, then keep CanDeleteUser = TRUE
  //Delete user from each apprpriate dataabse user list
  //If CanDeleteUser = TRUE, then delete from UserControl database
  //Move on to next user in list
end;

procedure TDVCmain.Duplicateagerecords1Click(Sender: TObject);
const
  DefaultPrefLevelToCheck = -1;
  AgeDif = 0.001;
var
  TD: TDBXTransaction;
  iChecked, iCorrected, iFailed : integer;
  tSampleNo, tFrac, tMaterialAbr1, tMaterialAbr2 : string;
  tAge1, tAgeError1, tAge2, tAgeError2 : double;
  tRecordID1, tRecordID2, tPrefLevel1, tPrefLevel2 : integer;
  strStart, strFinish : string;
  iStart, iFinish : integer;
  iInner, iBigStep, iStartInner, iFinishInner : integer;
  IsEOF : boolean;
begin
  StatusBar1.Panels[3].Text := ' ';
  StatusBar1.Panels[4].Text := 'Checking for duplicate age records';
  StatusBar1.Refresh;
  DVCreclim.ShowModal;
  iStart := dmDVC.StartRecord;
  iFinish := dmDVC.EndRecord;
  iBigStep := Round(Abs(iFinish - iStart)/10.0);
  if (iBigStep > 5000) then iBigStep := 5000;
  dbnRecordIDs.DataSource := dmDVC.dscdsRecordIDsDup;
  dbgRecordIDs.DataSource := dmDVC.dscdsRecordIDsDup;
  dbn2.DataSource := dmDVC.dsDup;
  dbg2.DataSource := dmDVC.dsDup;
  iStartInner := iStart;
  iFinishInner := iStart + iBigStep;
  iInner := iStart;
  Application.ProcessMessages;
  IsEOF := false;
  iChecked := 0;
  iCorrected := 0;
  iFailed := 0;
  repeat
    dmDVC.qRecordIDsDup.Close;
    dmDVC.qRecordIDsDup.ParamByName('StartRecord').AsInteger := iStartInner;
    dmDVC.qRecordIDsDup.ParamByName('EndRecord').AsInteger := iFinishInner;
    dmDVC.cdsRecordIDsDup.Close;
    dmDVC.cdsRecordIDsDup.Open;
    if (dmDVC.cdsRecordIDsDup.RecordCount > 0) then
    begin
      repeat
        iChecked := iChecked + 1;
        dmDVC.cdsDup.Open;
        if (dmDVC.cdsDup.RecordCount > 1) then
        begin
          tRecordID2 := dmDVC.cdsRecordIDsDupRECORDID.AsInteger;
          tSampleNo := dmDVC.cdsRecordIDsDupSAMPLENO.AsString;
          tMaterialAbr1 := dmDVC.cdsRecordIDsDupMATERIALABR.AsString;
          tPrefLevel1 := dmDVC.cdsRecordIDsDupPREFLEVEL.AsInteger;
          tAge1 := dmDVC.cdsRecordIDsDupRAGE.AsFloat;
          tAgeError1 := dmDVC.cdsRecordIDsDupRAGEPERROR.AsFloat;
          dmDVC.cdsDup.Last;
          repeat
            tRecordID1 := dmDVC.cdsDupRECORDID.AsInteger;
            if (tRecordID1 = tRecordID2) then
            begin
              dmDVC.cdsDup.Prior;
              tRecordID1 := dmDVC.cdsDupRECORDID.AsInteger;
            end;
            if (tRecordID1 <> tRecordID2) then
            begin
              tMaterialAbr2 := dmDVC.cdsDupMATERIALABR.AsString;
              tPrefLevel2 := dmDVC.cdsDupPREFLEVEL.AsInteger;
              tAge2 := dmDVC.cdsDupRAGE.AsFloat;
              tAgeError2 := dmDVC.cdsDupRAGEPERROR.AsFloat;
              if ((Abs(tAge1-tAge2) < AgeDif) and (Abs(tAgeError1-tAgeError2) < AgeDif) and (tMaterialAbr1 = tMaterialAbr2)) then
              begin
                try
                  dmDVC.qNew.Close;
                  dmDVC.qNew.SQL.Clear;
                  dmDVC.qNew.SQL.Add('UPDATE ISORGR30');
                  dmDVC.qNew.SQL.Add('SET ISORGR30.PREFLEVEL = -1');
                  dmDVC.qNew.SQL.Add('WHERE ISORGR30.RECORDID = :ThisRecordID');
                  dmDVC.qNew.ParamByName('ThisRecordID').AsInteger := tRecordID1;
                  TD := dmDVC.sqlcDateView.BeginTransaction(TDBXIsolations.ReadCommitted);
                  try
                    dmDVC.qNew.ExecSQL(false);
                    dmDVC.sqlcDateView.CommitFreeAndNil(TD); //on success, commit the changes
                    iCorrected := iCorrected + 1;
                  except
                    dmDVC.sqlcDateView.RollbackFreeAndNil(TD); //on failure, undo the changes
                    iFailed := iFailed + 1;
                  end;
                except
                end;
              end;
            end;
            dmDVC.cdsDup.Prior;
          until dmDVC.cdsDup.Bof;
        end;
        StatusBar1.Panels[0].Text := 'chk  - '+IntToStr(iChecked);
        StatusBar1.Panels[1].Text := 'cor  - '+IntToStr(iCorrected);
        StatusBar1.Panels[2].Text := 'fail - '+IntToStr(iFailed);
        StatusBar1.Refresh;
        dmDVC.cdsRecordIDsDup.Next;
        iInner := iInner + 1;
        if (dmDVC.cdsRecordIDsDup.EOF) then IsEOF := true;
      //until dmDVC.cdsRecordIDsDup.Eof;
      until ((iInner >= iFinishInner) or (IsEOF));
    end;
    iStartInner := iFinishInner;
    iFinishInner := iStartInner + iBigStep;
    Application.ProcessMessages;
  until ((iInner > iFinish) or (iStartInner > iFinish));
  dmDVC.cdsRecordIDsDup.First;
  StatusBar1.Panels[4].Text := 'Completed checking for duplicate records';
end;

procedure TDVCmain.Laboratoryrecordsexist1Click(Sender: TObject);
const
  DefaultLabID = 'nd';
var
  iChecked, iCorrected, iFailed : integer;
begin
  StatusBar1.Panels[3].Text := ' ';
  StatusBar1.Panels[4].Text := 'Checking links to laboratories';
  StatusBar1.Refresh;
  DVCreclim.ShowModal;
  dbnRecordIDs.DataSource := dmDVC.dscdsRecordIDsLab;
  dbgRecordIDs.DataSource := dmDVC.dscdsRecordIDsLab;
  dbn2.DataSource := dmDVC.dsIsoLab;
  dbg2.DataSource := dmDVC.dsIsoLab;
  dmDVC.qRecordIDsLab.Close;
  dmDVC.qRecordIDsLab.ParamByName('StartRecord').AsInteger := dmDVC.StartRecord;
  dmDVC.qRecordIDsLab.ParamByName('EndRecord').AsInteger := dmDVC.EndRecord;
  dmDVC.cdsRecordIDsLab.Close;
  dmDVC.cdsRecordIDsLab.Open;
  if (dmDVC.cdsRecordIDsLab.RecordCount > 0) then
  begin
    iChecked := 0;
    iCorrected := 0;
    iFailed := 0;
    repeat
      iChecked := iChecked + 1;
      dmDVC.cdsIsoLab.Open;
      if (dmDVC.cdsIsoLab.RecordCount<1) then
      begin
        try
          dmDVC.cdsIsoLab.Insert;
          dmDVC.cdsIsoLabRECORDID.AsInteger := dmDVC.cdsRecordIDsLabRECORDID.AsInteger;
          dmDVC.cdsIsoLabLABORATORYABR.AsString := DefaultLabID;
          dmDVC.cdsIsoLab.Post;
          dmDVC.cdsIsoLab.ApplyUpdates(0);
          iCorrected := iCorrected + 1;
        except
          iFailed := iFailed + 1;
        end;
      end;
      StatusBar1.Panels[0].Text := 'chk  - '+IntToStr(iChecked);
      StatusBar1.Panels[1].Text := 'cor  - '+IntToStr(iCorrected);
      StatusBar1.Panels[2].Text := 'fail - '+IntToStr(iFailed);
      StatusBar1.Refresh;
      dmDVC.cdsRecordIDsLab.Next;
    until dmDVC.cdsRecordIDsLab.Eof;
    dmDVC.cdsRecordIDsLab.First;
    StatusBar1.Panels[4].Text := 'Completed checking links to laboratories';
  end;
end;

procedure TDVCmain.LinkStratDB2DV;
var
  iChecked, iCorrected, iFailed, iApplyFailed : integer;
  iCountries : integer;
  iUnitID, iParentID : integer;
  tUnitDV, tUnitStratDB, tCountryID : string;
begin
  dmStrat.cdsCountryHasRecords.Open;
  iCountries := dmStrat.cdsCountryHasRecords.RecordCount;
  dmDVC.qUnitsDV.Close;
  dmDVC.qUnitsDV.SQL.Clear;
  dmDVC.qUnitsDV.SQL.Add('select DISTINCT SUITECOUNTRY.COUNTRYABR, SUITE.UNITNAME, SUITE.GISID');
  dmDVC.qUnitsDV.SQL.Add('from SUITE, SUITECOUNTRY');
  dmDVC.qUnitsDV.SQL.Add('where SUITECOUNTRY.UNITHASRECORDS='+''''+'Y'+'''');
  dmDVC.qUnitsDV.SQL.Add('and SUITE.GISID <= 0');
  if (iCountries < 1) then
  begin
    dmDVC.qUnitsDV.SQL.Add('and SUITECOUNTRY.COUNTRYABR='+''''+'ZAF'+'''');
  end else
  begin
    dmStrat.cdsCountryHasRecords.First;
    dmDVC.qUnitsDV.SQL.Add('and (');
    dmDVC.qUnitsDV.SQL.Add('SUITECOUNTRY.COUNTRYABR='+''''+dmStrat.cdsCountryHasRecordsCOUNTRYID.AsString+'''');
    dmStrat.cdsCountryHasRecords.Next;
    if (iCountries > 1) then
    begin
      repeat
        dmDVC.qUnitsDV.SQL.Add('or SUITECOUNTRY.COUNTRYABR='+''''+dmStrat.cdsCountryHasRecordsCOUNTRYID.AsString+'''');
        dmStrat.cdsCountryHasRecords.Next;
      until dmStrat.cdsCountryHasRecords.Eof;
      dmDVC.qUnitsDV.SQL.Add(')');
    end;
  end;
  dmDVC.qUnitsDV.SQL.Add('and SUITECOUNTRY.UNITNAME=SUITE.UNITNAME');
  dmDVC.qUnitsDV.SQL.Add('order by SUITECOUNTRY.COUNTRYABR, SUITE.UNITNAME');
  dmDVC.cdsUnitsDV.Close;
  dmDVC.cdsUnitsDV.Open;
  dbn2.DataSource := dmDVC.dsUnitsDV;
  dbg2.DataSource := dmDVC.dsUnitsDV;
  if (dmDVC.cdsUnitsDV.RecordCount > 0) then
  begin
    iChecked := 0;
    iCorrected := 0;
    iFailed := 0;
    iApplyFailed := 0;
    StatusBar1.Panels[4].Text := 'Creating DateView links for StratDB';
    repeat
      iChecked := iChecked + 1;
      iUnitID := -1;
      tUnitDV := dmDVC.cdsUnitsDVUNITNAME.AsString;
      tCountryID := dmDVC.cdsUnitsDVCOUNTRYABR.AsString;
      dmStrat.qUnitsStratDB.Close;
      dmStrat.cdsUnitsStratDB.Close;
      dmStrat.qUnitsStratDB.ParamByName('COUNTRYID').AsString := tCountryID;
      dmStrat.cdsUnitsStratDB.Open;
      dmStrat.cdsUnitsStratDB.Locate('UNITNAME',tUnitDV,[]);
      tUnitStratDB := dmStrat.cdsUnitsStratDBUNITNAME.AsString;
      if (tUnitDV = tUnitStratDB) then
      begin
        iUnitID := dmStrat.cdsUnitsStratDBUNITID.AsInteger;
        {
        if (iChecked < 5) then
        begin
          ShowMessage('before iChecked = '+IntToStr(iChecked)+'-dv-'+tUnitDV+'-s-'+tUnitStratDB+'**'+IntToStr(iUnitID)+'**');
        end;
        }
        try
          dmDVC.cdsUnitsDV.Edit;
          dmDVC.cdsUnitsDVGISID.AsInteger := iUnitID;
          dmDVC.cdsUnitsDV.Post;
        except
          iFailed := iFailed + 1;
        end;
      end;
      {
      if (iChecked < 5) then
      begin
        ShowMessage('after iChecked = '+IntToStr(iChecked)+'-dv-'+tUnitDV+'-s-'+tUnitStratDB+'**'+IntToStr(iUnitID)+'**');
      end;
      }
      StatusBar1.Panels[0].Text := 'Ch'+IntToStr(iChecked);
      StatusBar1.Panels[1].Text := 'Co'+IntToStr(iCorrected);
      StatusBar1.Panels[2].Text := 'F'+IntToStr(iFailed);
      StatusBar1.Panels[3].Text := 'AF'+IntToStr(iApplyFailed);
      StatusBar1.Refresh;
      dmDVC.cdsUnitsDV.Next;
    until dmDVC.cdsUnitsDV.Eof;
    dmDVC.cdsUnitsDV.First;
    try
      dmDVC.cdsUnitsDV.ApplyUpdates(-1);
    except
      iApplyFailed := iApplyFailed + 1;
    end;
    dmDVC.cdsUnitsDV.First;
    StatusBar1.Panels[4].Text := 'Completed linking StratDB units to DateView';
  end;
end;

procedure TDVCmain.LinkStratDBParents2DV;
var
  iChecked, iCorrected, iFailed, iApplyFailed : integer;
  iUnitID, iStratDBUnitID, iParentID : integer;
  tUnitDV, tUnitStratDB : string;
begin
  dmDVC.qParentUnitsDV.Close;
  dmDVC.qParentUnitsDV.SQL.Clear;
  dmDVC.qParentUnitsDV.SQL.Add('select SUITE.UNITNAME, SUITE.GISID, SUITE.PARENTID');
  dmDVC.qParentUnitsDV.SQL.Add('from SUITE');
  //dmDVC.qParentUnitsDV.SQL.Add('and SUITE.UNITNAME >='+''''+'Weeli'+'''');
  dmDVC.qParentUnitsDV.SQL.Add('where SUITE.GISID > 0');
  dmDVC.qParentUnitsDV.SQL.Add('order by SUITE.UNITNAME');
  dmDVC.cdsParentUnitsDV.Close;
  dmDVC.cdsParentUnitsDV.Open;
  dbn2.DataSource := dmDVC.dsParentUnitsDV;
  dbg2.DataSource := dmDVC.dsParentUnitsDV;
  if (dmDVC.cdsParentUnitsDV.RecordCount > 0) then
  begin
    iChecked := 0;
    iCorrected := 0;
    iFailed := 0;
    iApplyFailed := 0;
    StatusBar1.Panels[4].Text := 'Creating DateView parent links for StratDB';
    repeat
      iChecked := iChecked + 1;
      iUnitID := -1;
      iParentID := -1;
      iUnitID := dmDVC.cdsParentUnitsDVGISID.AsInteger;
      tUnitDV := dmDVC.cdsParentUnitsDVUNITNAME.AsString;
      dmStrat.qParentsStratDB.Close;
      dmStrat.cdsParentsStratDB.Close;
      dmStrat.cdsParentsStratDB.Open;
      dmStrat.cdsParentsStratDB.Locate('UNITID',iUnitID,[]);
      iStratDBUnitID := dmStrat.cdsParentsStratDBUNITID.AsInteger;
      if (iUnitID = iStratDBUnitID) then
      begin
        iParentID := dmStrat.cdsParentsStratDBPARENTID.AsInteger;
        {
        if (iChecked < 5) then
        begin
          ShowMessage('before iChecked = '+IntToStr(iChecked)+'-dv-'+IntToStr(iUnitID)+'-s-'+IntToStr(iStratDBUnitID)+'**'+IntToStr(iParentID)+'**');
        end;
        }
        try
          dmDVC.cdsParentUnitsDV.Edit;
          dmDVC.cdsParentUnitsDVPARENTID.AsInteger := iParentID;
          dmDVC.cdsParentUnitsDV.Post;
        except
          iFailed := iFailed + 1;
        end;
      end;
      {
      if (iChecked < 5) then
      begin
        ShowMessage('after iChecked = '+IntToStr(iChecked)+'-dv-'+IntToStr(iUnitID)+'-s-'+IntToStr(iStratDBUnitID)+'**'+IntToStr(iParentID)+'**');
      end;
      }
      StatusBar1.Panels[0].Text := 'Ch'+IntToStr(iChecked);
      StatusBar1.Panels[1].Text := 'Co'+IntToStr(iCorrected);
      StatusBar1.Panels[2].Text := 'F'+IntToStr(iFailed);
      StatusBar1.Panels[3].Text := 'AF'+IntToStr(iApplyFailed);
      StatusBar1.Refresh;
      dmDVC.cdsParentUnitsDV.Next;
    until dmDVC.cdsParentUnitsDV.Eof;
    dmDVC.cdsParentUnitsDV.First;
    try
      dmDVC.cdsParentUnitsDV.ApplyUpdates(-1);
    except
      iApplyFailed := iApplyFailed + 1;
    end;
    dmDVC.cdsParentUnitsDV.First;
    StatusBar1.Panels[4].Text := 'Completed linking StratDB parent units to DateView';
  end;
end;


end.
