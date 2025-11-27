unit DVC_user;

interface

uses
  System.SysUtils, System.Classes, DbxDevartInterBase, Data.FMTBcd, Data.DB,
  midaslib, Data.DBXCommon,
  Data.SqlExpr, Datasnap.DBClient, Datasnap.Provider;

type
  TdmUser = class(TDataModule)
    sqlcUser: TSQLConnection;
    SQLMonitor1: TSQLMonitor;
    qDevInfo: TSQLQuery;
    dspDevInfo: TDataSetProvider;
    cdsDevInfo: TClientDataSet;
    cdsDevInfoDEVINFOORDER: TIntegerField;
    cdsDevInfoDATESAVED: TSQLTimeStampField;
    cdsDevInfoQUERYCHECK: TWideStringField;
    dsDevInfo: TDataSource;
    qInsertDevInfo: TSQLQuery;
    qMaxDevInfo: TSQLQuery;
    dspMaxDevInfo: TDataSetProvider;
    cdsMaxDevInfo: TClientDataSet;
    cdsMaxDevInfoMAXIMUM: TIntegerField;
    dsMaxDevInfo: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
    function GetUTCDateTime: TDateTime;
    procedure SetDeveloperData(tmpStrList : String);
  end;

var
  dmUser: TdmUser;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmUser.SetDeveloperData(tmpStrList : String);
var
  tMax : integer;
  tNow : TDateTime;
  TD: TDBXTransaction;
begin
  dmUser.cdsMaxDevInfo.Open;
  tMax := dmUser.cdsMaxDevInfoMAXIMUM.AsInteger+1;
  dmUser.cdsMaxDevInfo.Close;
  tNow := dmUser.GetUTCDateTime;
  dmUser.qInsertDevInfo.Close;
  dmUser.qInsertDevInfo.SQL.Clear;
  dmUser.qInsertDevInfo.SQL.Add('INSERT INTO DEVINFO');
  dmUser.qInsertDevInfo.SQL.Add('(DevInfoOrder,DateSaved,QueryCheck)');
  dmUser.qInsertDevInfo.SQL.Add('Values (:tDevInfoOrder,:tDateSaved,:tmpStr)');
  dmUser.qInsertDevInfo.ParamByName('tmpStr').AsString := tmpStrList;
  dmUser.qInsertDevInfo.ParamByName('tDevInfoOrder').AsInteger := tMax;
  dmUser.qInsertDevInfo.ParamByName('tDateSaved').AsDateTime := tNow;
  TD := dmUser.sqlcUser.BeginTransaction(TDBXIsolations.ReadCommitted);
  try
    dmUser.qInsertDevInfo.ExecSQL(false);
    dmUser.sqlcUser.CommitFreeAndNil(TD); //on success, commit the changes;
  except
    //ShowMessage('Not able to insert '+tmpStrList);
    dmUser.sqlcUser.RollbackFreeAndNil(TD); //on failure, undo the changes;
  end;
end;

function TdmUser.GetUTCDateTime: TDateTime;
var
  //UTC: TSystemTime;
  UTC: TDateTime;
begin
  UTC := Now;
  //result := SystemTimeToDateTime(Now);
  result := UTC;
end;


end.
