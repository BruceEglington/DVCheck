unit DVC_dmStrat;

interface

uses
  SysUtils, Classes, WideStrings, FMTBcd, DB, DBClient, Provider,
  midaslib, DBXCommon,
  SqlExpr, DbxDevartInterBase;

type
  TdmStrat = class(TDataModule)
    sqlcStratDB: TSQLConnection;
    qUnitRecords: TSQLQuery;
    dspUnitRecords: TDataSetProvider;
    cdsUnitRecords: TClientDataSet;
    dsUnitRecords: TDataSource;
    cdsUnitRecordsUNITID: TIntegerField;
    cdsUnitRecordsRECORDID: TIntegerField;
    qCountryHasRecords: TSQLQuery;
    dspCountryHasRecords: TDataSetProvider;
    cdsCountryHasRecords: TClientDataSet;
    dsCountryHasRecords: TDataSource;
    cdsCountryHasRecordsCOUNTRYID: TWideStringField;
    qNew: TSQLQuery;
    qParentRecords: TSQLQuery;
    dspParentRecords: TDataSetProvider;
    cdsParentRecords: TClientDataSet;
    dsParentRecords: TDataSource;
    cdsParentRecordsUNITID: TIntegerField;
    cdsParentRecordsRECORDID: TIntegerField;
    cdsParentRecordsPARENTID: TIntegerField;
    qDomainRecords: TSQLQuery;
    dspDomainRecords: TDataSetProvider;
    cdsDomainRecords: TClientDataSet;
    dsDomainRecords: TDataSource;
    cdsDomainRecordsDOMAINID: TIntegerField;
    cdsDomainRecordsRECORDID: TIntegerField;
    qUnitsStratDB: TSQLQuery;
    dspUnitsStratDB: TDataSetProvider;
    cdsUnitsStratDB: TClientDataSet;
    dsUnitsStratDB: TDataSource;
    cdsUnitsStratDBUNITID: TIntegerField;
    cdsUnitsStratDBUNITNAME: TWideStringField;
    cdsUnitsStratDBCOUNTRYID: TWideStringField;
    qParentsStratDB: TSQLQuery;
    dspParentsStratDB: TDataSetProvider;
    cdsParentsStratDB: TClientDataSet;
    dsParentsStratDB: TDataSource;
    cdsParentsStratDBUNITID: TIntegerField;
    cdsParentsStratDBUNITNAME: TWideStringField;
    cdsParentsStratDBPARENTID: TIntegerField;
    qDepIsotopeCount: TSQLQuery;
    dspDepIsotopeCount: TDataSetProvider;
    cdsDepIsotopeCount: TClientDataSet;
    cdsDepIsotopeCountDEPOSITID: TIntegerField;
    cdsDepIsotopeCountCOUNTPB: TIntegerField;
    cdsDepIsotopeCountCOUNTSR: TIntegerField;
    cdsDepIsotopeCountCOUNTND: TIntegerField;
    cdsDepIsotopeCountCOUNTOS: TIntegerField;
    dsDepIsotopeCount: TDataSource;
    DeleteRecords: TSQLQuery;
    InsertDepIsotopeCount: TSQLQuery;
    cdsDepIsotopeCountCOUNTS: TIntegerField;
    cdsDepIsotopeCountCOUNTSO4: TIntegerField;
    cdsDepIsotopeCountCOUNTO: TIntegerField;
    SQLMonitor1: TSQLMonitor;
    cdsDepIsotopeCountCOUNTHF: TIntegerField;
    qDepGDU: TSQLQuery;
    qGDUDepositAges: TSQLQuery;
    dsDepositIDDepFor: TDataSource;
    cdsDepositIDDepFor: TClientDataSet;
    cdsDepositIDDepForSDBDEPOSITID: TIntegerField;
    dsqDepositIDDepFor: TDataSource;
    dsDepFor: TDataSource;
    cdsDepFor: TClientDataSet;
    qDepositIDDepFor: TSQLQuery;
    InsertDepFor: TSQLQuery;
    qDepFor: TSQLQuery;
    qDepForSDBDEPOSITID: TIntegerField;
    dspDepositIDDepFor: TDataSetProvider;
    qDepGDUDEPOSITID: TIntegerField;
    qDepGDURCNMDLID: TWideStringField;
    qDepGDUGDUID: TFMTBCDField;
    dspDepGDU: TDataSetProvider;
    dsqDepGDU: TDataSource;
    cdsDepGDU: TClientDataSet;
    dsDepGDU: TDataSource;
    cdsGDUDepositAges: TClientDataSet;
    dsGDUDepositAges: TDataSource;
    qDepositIDDepForSDBDEPOSITID: TIntegerField;
    cdsDepositIDDepForqDepFor: TDataSetField;
    cdsDepForSDBDEPOSITID: TIntegerField;
    qDepForWHOFORID: TWideStringField;
    cdsDepForWHOFORID: TWideStringField;
    cdsDepGDUDEPOSITID: TIntegerField;
    cdsDepGDURCNMDLID: TWideStringField;
    cdsDepGDUGDUID: TFMTBCDField;
    cdsDepGDUqGDUDepositAges: TDataSetField;
    cdsGDUDepositAgesDEPOSITID: TIntegerField;
    cdsGDUDepositAgesRCNMDLID: TWideStringField;
    cdsGDUDepositAgesGDUID: TFMTBCDField;
    cdsGDUDepositAgesAPPROXAGE: TFloatField;
    cdsGDUDepositAgesAPPROXAGEUNCERTAINTY: TFloatField;
    cdsGDUDepositAgesDEPOSITCLANID: TIntegerField;
    cdsGDUDepositAgesDEPOSITCLAN: TWideStringField;
    cdsGDUDepositAgesPARENTCLAN: TWideStringField;
  private
    { Private declarations }
  public
    { Public declarations }
    StartRecord, EndRecord : integer;
    procedure DeleteDepositIsotopeCount;
    procedure InsertDepositIsotopeCount(tDepositID,tCountPb,tCountSr,tCountNd,tCountOs,tCountS,tCountSO4,tCountO : integer);
    procedure InsertDepForRecord(tDepositID : integer;tWhoForID : string);
  end;

var
  dmStrat: TdmStrat;

implementation

{$R *.dfm}

procedure TdmStrat.DeleteDepositIsotopeCount;
var
  TD: TTransactionDesc;
begin
  try
    dmStrat.DeleteRecords.SQL.Clear;
    dmStrat.DeleteRecords.SQL.Add('Delete from DEPISOTOPECOUNT');
    if not dmStrat.sqlcStratDB.InTransaction then
    begin
      TD.TransactionID := 1;
      TD.IsolationLevel := xilREADCOMMITTED;
      dmStrat.sqlcStratDB.StartTransaction(TD);
      try
        dmStrat.DeleteRecords.ExecSQL(false);
        dmStrat.sqlcStratDB.Commit(TD); {on success, commit the changes};
      except
        dmStrat.sqlcStratDB.Rollback(TD); {on failure, undo the changes};
      end;
    end;
  except
  end;
end;

procedure TdmStrat.InsertDepositIsotopeCount(tDepositID,tCountPb,tCountSr,tCountNd,tCountOs,tCountS,tCountSO4,tCountO : integer);
var
  TD: TTransactionDesc;
begin
  try
    if not dmStrat.sqlcStratDB.InTransaction then
    begin
      dmStrat.InsertDepIsotopeCount.Close;
      dmStrat.InsertDepIsotopeCount.ParamByName('DepositID').AsInteger := tDepositID;
      dmStrat.InsertDepIsotopeCount.ParamByName('CountPb').AsInteger := tCountPb;
      dmStrat.InsertDepIsotopeCount.ParamByName('CountSr').AsInteger := tCountSr;
      dmStrat.InsertDepIsotopeCount.ParamByName('CountNd').AsInteger := tCountNd;
      dmStrat.InsertDepIsotopeCount.ParamByName('CountOs').AsInteger := tCountOs;
      dmStrat.InsertDepIsotopeCount.ParamByName('CountS').AsInteger := tCountS;
      dmStrat.InsertDepIsotopeCount.ParamByName('CountSO4').AsInteger := tCountSO4;
      dmStrat.InsertDepIsotopeCount.ParamByName('CountO').AsInteger := tCountO;
      TD.TransactionID := 1;
      TD.IsolationLevel := xilREADCOMMITTED;
      dmStrat.sqlcStratDB.StartTransaction(TD);
      try
        dmStrat.InsertDepIsotopeCount.ExecSQL(false);
        dmStrat.sqlcStratDB.Commit(TD); //on success, commit the changes
      except
        dmStrat.sqlcStratDB.Rollback(TD); //on failure, undo the changes
      end;
    end;
  except
  end;
end;

procedure TdmStrat.InsertDepForRecord(tDepositID : integer;tWhoForID : string);
var
  TD: TDBXTransaction;
begin
  try
    //if not dmDVC.sqlcStratDB.InTransaction then
    //begin
      dmStrat.InsertDepFor.Close;
      dmStrat.InsertDepFor.ParamByName('tDepositID').AsInteger := tDepositID;
      dmStrat.InsertDepFor.ParamByName('tWhoForID').AsString := tWhoForID;
      if not dmStrat.sqlcStratDB.InTransaction then
      begin
        TD := dmStrat.sqlcStratDB.BeginTransaction(TDBXIsolations.ReadCommitted);
        try
          dmStrat.InsertDepFor.ExecSQL(false);
          dmStrat.sqlcStratDB.CommitFreeAndNil(TD); //on success, commit the changes
        except
          dmStrat.sqlcStratDB.RollbackFreeAndNil(TD); //on failure, undo the changes
          //WasSuccessful := false;
        end;
      end;
    //end;
  except
  end;
end;

end.
