unit DVC_dmStrat;

interface

uses
  SysUtils, Classes, WideStrings, FMTBcd, DB, DBClient, Provider,
  midaslib,
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
    cdsCountryHasRecordsCOUNTRYID: TStringField;
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
    cdsUnitsStratDBUNITNAME: TStringField;
    cdsUnitsStratDBCOUNTRYID: TStringField;
    qParentsStratDB: TSQLQuery;
    dspParentsStratDB: TDataSetProvider;
    cdsParentsStratDB: TClientDataSet;
    dsParentsStratDB: TDataSource;
    cdsParentsStratDBUNITID: TIntegerField;
    cdsParentsStratDBUNITNAME: TStringField;
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
  private
    { Private declarations }
  public
    { Public declarations }
    procedure DeleteDepositIsotopeCount;
    procedure InsertDepositIsotopeCount(tDepositID,tCountPb,tCountSr,tCountNd,tCountOs,tCountS,tCountSO4,tCountO : integer);
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

end.
